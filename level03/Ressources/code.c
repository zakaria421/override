#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/**
 * Global Data Constants (Referenced by memory addresses in disassembly)
 */
const char* DATA_80489C0 = "%u";            // Used in get_unum scanf
const char* DATA_80489C3 = "PLACEHOLDER_STR"; // Target comparison string (17 bytes)
const char* DATA_80489D4 = "/bin/sh";        // Command for system()
const char* DATA_80489DC = "Verification failed!"; // Failure message for puts()
const char* DATA_8048A48 = "------------------------------------------";
const char* DATA_8048A6C = "Welcome to the Guessing Game!";
const char* DATA_8048A7B = "Enter your secret number: ";
const char* DATA_8048A85 = "%d";            // Used in main scanf

/**
 * 080485f4 <clear_stdin>:
 * Clears the input buffer until a newline or EOF is reached.
 */
void clear_stdin() {
    char c;
    while (1) {
        c = (char)getchar();
        // 0x0a is '\n', 0xff is EOF in 8-bit representation
        if (c == '\n' || (unsigned char)c == 0xff) {
            break;
        }
    }
}

/**
 * 08048617 <get_unum>:
 * Flushes stdout, reads an unsigned integer, and clears stdin.
 */
unsigned int get_unum() {
    unsigned int num = 0;
    fflush(stdout);
    // scanf(DATA_80489C0, &num)
    if (scanf(DATA_80489C0, &num) != 1) {
        num = 0;
    }
    clear_stdin();
    return num;
}

/**
 * 0804864f <prog_timeout>:
 * Executes a direct sys_exit(1) syscall.
 */
void prog_timeout() {
    // Assembly: mov $0x1, %eax (sys_exit); mov $0x1, %ebx (status); int $0x80
    _exit(1);
}

/**
 * 08048660 <decrypt>:
 * Decrypts a local buffer using an XOR key and checks it against a target string.
 */
void decrypt(int key) {
    // Local buffer initialization at 8048673
    unsigned char buffer[18];
    *(unsigned int*)&buffer[0] = 0x757c7d51;
    *(unsigned int*)&buffer[4] = 0x67667360;
    *(unsigned int*)&buffer[8] = 0x7b66737e;
    *(unsigned int*)&buffer[12] = 0x33617c7d;
    buffer[16] = 0x00; // movb $0x0, -0xd(%ebp)
    //Q}|u`sfg~sf{}|a3

    // Assembly uses 'repnz scas' to find the length of the buffer
    int len = (int)strlen((char*)buffer);

    // XOR Decryption Loop (80486c7 - 80486eb)
    for (int i = 0; i < len; i++) {
        buffer[i] = buffer[i] ^ (unsigned char)key;
    }

    // Comparison with global target string at 80486ed
    // repz cmpsb with ecx=0x11 (17)
    if (memcmp(buffer, DATA_80489C3, 0x11) == 0) {
        // Successful match
        system(DATA_80489D4);
    } else {
        // Failed match
        puts(DATA_80489DC);
    }
}

/**
 * 08048747 <test>:
 * Logic branch based on the difference between two values.
 */
void test(int val1, int val2) {
    // Calculate index/difference (8048755: sub %eax, %ecx)
    unsigned int diff = (unsigned int)val2 - (unsigned int)val1;

    // Boundary check for jump table (804875c: cmpl $0x15, -0xc(%ebp))
    if (diff <= 0x15) {
        // The jump table at 0x80489f0 contains 22 entries (0 to 21).
        // Every single entry (8048775 through 8048843) performs:
        // push diff; call decrypt; jmp end
        decrypt((int)diff);
    } else {
        // Default case (804884a): Call rand() then decrypt with result
        decrypt(rand());
    }
}

/**
 * 0804885a <main>:
 * Entry point for the application.
 */
int main(int argc, char** argv) {
    int user_input;

    // Seed random number generator with current time
    srand((unsigned int)time(NULL));

    // Display program headers
    puts(DATA_8048A48);
    puts(DATA_8048A6C);
    puts(DATA_8048A48);

    // Prompt user for input
    printf(DATA_8048A7B);

    // Read user input integer (80488c1)
    if (scanf(DATA_8048A85, &user_input) != 1) {
        user_input = 0;
    }

    // Call test(user_input, 0x1337d00d)
    // val2 is 0x1337d00d, val1 is user_input
    test(user_input, 0x1337d00d);

    return 0;
}
