#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <sys/ptrace.h>

int main(void) {
    
    char login[32] = "zakaria";
    
    size_t len = strnlen(login, 32);
    int key;
    size_t index;

    key = ((signed char)login[3] ^ 0x1337) + 0x5eeded;

	for (index = 0; index < len; index++) {
		signed char current = login[index];
        printf("current: %c\n", current);
		if (current <= 31) {
			return 1;
		}

		key += (current ^ key) % 0x539;
	}
    printf("key: %d\n", key);
    return 0;
}