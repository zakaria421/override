#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

static const char *USAGE_FMT = "%s [file to read]\n";
static const char *LOG_PATH = "./backups/.log";
static const char *LOG_MODE = "w";
static const char *READ_MODE = "r";
static const char *BACKUP_PREFIX = "./backups/";
static const char *START_NOTE = "Starting back up: ";
static const char *END_NOTE = "Finished back up: ";
static const char *LOG_LINE_FMT = "LOG: %s\n";
static const char *ERR_OPEN_FMT = "ERROR: Failed to open %s\n";
static const char *ERR_BACKUP_FMT = "ERROR: Failed to open %s%s\n";

void log_wrapper(FILE *log_file, const char *name, const char *note) {
	char log_buffer[0x100];
	size_t used;
	size_t remaining;

	strcpy(log_buffer, name);

	used = strlen(log_buffer);
	if (used >= 0xfe) {
		used = 0xfe;
	}
	remaining = 0xfe - used;

	snprintf(log_buffer + used, remaining, "%s", note);
	log_buffer[strcspn(log_buffer, "\n")] = '\0';

	fprintf(log_file, LOG_LINE_FMT, log_buffer);
}

int main(int argc, char **argv) {
	FILE *log_file;
	FILE *input_file;
	char output_path[112];
	int output_fd = -1;
	int current_char = EOF;
	char one_byte;

	if (argc != 2) {
		printf(USAGE_FMT, argv[0]);
	}

	log_file = fopen(LOG_PATH, LOG_MODE);
	if (log_file == NULL) {
		printf(ERR_OPEN_FMT, LOG_PATH);
		exit(1);
	}

	log_wrapper(log_file, argv[1], START_NOTE);

	input_file = fopen(argv[1], READ_MODE);
	if (input_file == NULL) {
		printf(ERR_OPEN_FMT, argv[1]);
		exit(1);
	}

	strcpy(output_path, BACKUP_PREFIX);
	strncat(output_path, argv[1], 0x63 - strlen(output_path));

	output_fd = open(output_path, O_WRONLY | O_CREAT | O_EXCL, 0700);
	if (output_fd < 0) {
		printf(ERR_BACKUP_FMT, BACKUP_PREFIX, argv[1]);
		exit(1);
	}

	while (1) {
		current_char = fgetc(input_file);
		one_byte = (char)current_char;
		if ((unsigned char)one_byte == 0xff) {
			break;
		}
		write(output_fd, &one_byte, 1);
	}

	log_wrapper(log_file, argv[1], END_NOTE);

	fclose(input_file);
	close(output_fd);

	return 0;
}
