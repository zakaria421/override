#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

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

int store_number(unsigned int *data) {
	unsigned int number = 0;
	unsigned int index = 0;

	printf(" Number: ");
	number = get_unum();

	printf(" Index: ");
	index = get_unum();

	if ((index % 3) == 0 || ((number >> 24) == 0xb7)) {
		puts(" *** ERROR! ***");
		puts("   This index is reserved for wil!");
		puts(" *** ERROR! ***");
		return 1;
	}

	data[index] = number;
	return 0;
}

int read_number(unsigned int *data) {
	unsigned int index = 0;

	printf(" Index: ");
	index = get_unum();

	printf(" Number at data[%u] is %u\n", index, data[index]);
	return 0;
}

int main(int argc, char **argv, char **envp) {
	unsigned int data[100];
	int status = 0;
	char command[20];
	char **argp;
	char **envp_it;
	size_t command_len;

	memset(data, 0, sizeof(data));
	memset(command, 0, sizeof(command));

	for (argp = argv; *argp != NULL; argp++) {
		memset(*argp, 0, strlen(*argp));
	}

	for (envp_it = envp; *envp_it != NULL; envp_it++) {
		memset(*envp_it, 0, strlen(*envp_it));
	}

	puts("----------------------------------------------------");

	while (1) {
		printf("Input command: ");
		status = 1;

		if (fgets(command, sizeof(command), stdin) == NULL) {
			break;
		}

		command_len = strlen(command);
		if (command_len > 0) {
			command[command_len - 1] = '\0';
		}

		if (strncmp(command, "store", 5) == 0) {
			status = store_number(data);
		} else if (strncmp(command, "read", 4) == 0) {
			status = read_number(data);
		} else if (strncmp(command, "quit", 4) == 0) {
			break;
		}

		if (status != 0) {
			printf(" Failed to do %s command\n", command);
		} else {
			printf(" Completed %s command successfully\n", command);
		}

		memset(command, 0, sizeof(command));
	}

	return 0;
}
