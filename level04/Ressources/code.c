#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/prctl.h>

static const char *STR_SCAN_U = "%u";
static const char *STR_PROMPT = "Give me some shellcode, k";
static const char *STR_CHILD_EXIT = "child is exiting...";
static const char *STR_NO_EXEC = "no exec() for you";

void clear_stdin(void) {
	int ch;
	while (1) {
		ch = getchar();
		if (ch == '\n' || ch == EOF) {
			break;
		}
	}
}

unsigned int get_unum(void) {
	unsigned int value = 0;
	fflush(stdout);
	scanf(STR_SCAN_U, &value);
	clear_stdin();
	return value;
}

void prog_timeout(void) {
	_exit(1);
}

void enable_timeout_cons(void) {
	signal(SIGALRM, (void (*)(int))prog_timeout);
	alarm(60);
}

int main(void) {
	pid_t child_pid;
	int wait_status = 0;
	long traced_syscall = 0;
	char user_buffer[128];

	for (int i = 0; i < 128; i++) {
		user_buffer[i] = '\0';
	}

	child_pid = fork();

	if (child_pid == 0) {
		prctl(PR_SET_PDEATHSIG, SIGHUP);
		ptrace(PTRACE_TRACEME, 0, 0, 0);
		puts(STR_PROMPT);
		gets(user_buffer);
		return 0;
	}

	while (1) {
		wait(&wait_status);

		if ((wait_status & 0x7f) == 0) {
			puts(STR_CHILD_EXIT);
			break;
		}

		if ((((wait_status & 0x7f) + 1) >> 1) > 0) {
			puts(STR_CHILD_EXIT);
			break;
		}

		traced_syscall = ptrace(PTRACE_PEEKUSER, child_pid, 44, 0);

		if (traced_syscall == 11) {
			puts(STR_NO_EXEC);
			kill(child_pid, SIGKILL);
			break;
		}
	}

	return 0;
}



