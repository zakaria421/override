#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <sys/ptrace.h>

static const char *SEP = "--------------------------------------------";
static const char *BANNER = "|   Welcome to level06 auth challenge      |";
static const char *LOGIN_PROMPT = "-> Enter Login: ";
static const char *SERIAL_PROMPT = "-> Enter Serial: ";
static const char *SUCCESS_MSG = "Authenticated!";
static const char *SHELL_CMD = "/bin/sh";
static const char *ANTI_DBG_1 = ".---------------------------.";
static const char *ANTI_DBG_2 = "| !! TAMPERING DETECTED !!  |";
static const char *ANTI_DBG_3 = "'---------------------------'";

void clear_stdin(void) {
	int ch;

	do {
		ch = getchar();
	} while (ch != '\n' && ch != EOF);
}

unsigned int get_unum(void) {
	unsigned int value = 0;

	fflush(stdout);
	scanf("%u", &value);
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

int auth(char *login, unsigned int serial) {
	size_t len;
	int key;
	size_t index;

	login[strcspn(login, "\n")] = '\0';
	len = strnlen(login, 32);

	if (len <= 5) {
		return 1;
	}

	if (ptrace(PTRACE_TRACEME, 0, 1, 0) == -1) {
		puts(ANTI_DBG_1);
		puts(ANTI_DBG_2);
		puts(ANTI_DBG_3);
		return 1;
	}

	key = ((signed char)login[3] ^ 0x1337) + 0x5eeded;

	for (index = 0; index < len; index++) {
		signed char current = login[index];

		if (current <= 31) {
			return 1;
		}

		key += (current ^ key) % 0x539;
	}

	if ((unsigned int)key != serial) {
		return 1;
	}

	return 0;
}

int main(int argc, char **argv) {
	char login[32];
	unsigned int serial;

	(void)argc;
	(void)argv;

	puts(SEP);
	puts(BANNER);
	puts(SEP);

	printf(LOGIN_PROMPT);
	fgets(login, sizeof(login), stdin);

	puts(SEP);
	puts(SERIAL_PROMPT);
	puts(SEP);

	printf("-> Enter Serial: ");
	scanf("%u", &serial);

	if (auth(login, serial) == 0) {
		puts(SUCCESS_MSG);
		system(SHELL_CMD);
		return 0;
	}

	return 1;
}
