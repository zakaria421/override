#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <unistd.h>

static void clear_stdin(void) {
    int character;

    do {
        character = getchar();
    } while (character != '\n' && character != EOF);
}

static unsigned int get_unum(void) {
    unsigned int value;

    value = 0;
    fflush(stdout);
    scanf("%u", &value);
    clear_stdin();
    return value;
}

static void prog_timeout(int signal_number) {
    (void)signal_number;
    _exit(1);
}

static void enable_timeout_cons(void) {
    signal(SIGALRM, prog_timeout);
    alarm(60);
}

static int auth(char *login, unsigned int serial) {
    size_t login_len;
    uint32_t hash;
    size_t index;

    login[strcspn(login, "\n")] = '\0';
    login_len = strnlen(login, 32);
    if (login_len <= 5) {
        return 1;
    }

    if (ptrace(PTRACE_TRACEME, 0, 1, 0) == -1) {
        puts(".---------------------------.");
        puts("| !! TAMPERING DETECTED !!  |");
        puts("'---------------------------'");
        return 1;
    }

    hash = ((uint32_t)(unsigned char)login[3] ^ 0x1337U) + 0x5eededU;
    for (index = 0; index < login_len; index++) {
        unsigned char current;
        uint32_t mixed;

        current = (unsigned char)login[index];
        if (current <= 31U) {
            return 1;
        }

        mixed = ((uint32_t)(signed char)current) ^ hash;
        hash += mixed % 1337U;
    }
    printf("hash: %u\n", hash);
    if (serial != hash) {
        return 1;
    }

    return 0;
}

int main(void) {
    char login[32];
    unsigned int serial;

    memset(login, 0, sizeof(login));
    serial = 0;

    puts("***********************************");
    puts("*\t\tlevel06\t\t*");
    puts("***********************************");
    printf("-> Enter Login: ");
    fgets(login, sizeof(login), stdin);

    puts("***********************************");
    puts("***** NEW ACCOUNT DETECTED ********");
    puts("***********************************");
    printf("-> Enter Serial: ");
    scanf("%u", &serial);

    if (auth(login, serial) == 0) {
        puts("Authenticated!");
        system("/bin/sh");
        return 0;
    }

    return 1;
}
