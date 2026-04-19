#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

/**
 * Global and Static Variables (Preserving original memory structure where possible)
 */
static char completed_6531 = 0;       // 601258 <completed.6531>
static long dtor_idx_6533 = 0;        // 601260 <dtor_idx.6533>

// External symbols referenced by the CRT logic
extern void (*__CTOR_LIST__[])(void); // 601000 <__CTOR_LIST__>
extern void (*__DTOR_LIST__[])(void); // 601010 <__DTOR_LIST__>
extern void* __JCR_END__;             // 601020 <__JCR_END__>
extern void* _DYNAMIC[];              // 6011b8 <_DYNAMIC+0x190>

/**
 * Data Section Strings (Extracted from disassembly addresses)
 */
const char* const STR_R = "r";                                         // 400bb0
const char* const STR_FILENAME = "password.txt";                       // 400bb2 (Inferred)
const char* const STR_ERR_OPEN = "Error: could not open file\n";       // 400bd0
const char* const STR_NL = "\n";                                       // 400bf5
const char* const STR_ERR_SIZE = "Error: file is not the correct size\n"; // 400bf8
const char* const STR_BANNER1 = "******************************************"; // 400c20
const char* const STR_BANNER2 = "*      Secure Password Entry System      *"; // 400c50
const char* const STR_BANNER3 = "******************************************"; // 400c80
const char* const STR_BANNER4 = "";                                    // 400cb0
const char* const STR_PROMPT_USER = "Username: ";                      // 400cd9
const char* const STR_PROMPT_PASS = "Password: ";                      // 400ce8
const char* const STR_CHECKING = "Checking...";                        // 400cf8
const char* const STR_WELCOME = "Welcome, %s!\n";                      // 400d22
const char* const STR_SYSTEM_CMD = "/bin/sh";                          // 400d32
const char* const STR_INVALID = "Invalid password.";                   // 400d3a

/**
 * Disassembly of section .init: 0000000000400640 <_init>
 */
void _init(void) {
    // 400640: sub $0x8,%rsp
    // 400644: callq 40075c <call_gmon_start>
    call_gmon_start();
    // 400649: callq 4007f0 <frame_dummy>
    frame_dummy();
    // 40064e: callq 400b60 <__do_global_ctors_aux>
    __do_global_ctors_aux();
    // 400653: add $0x8,%rsp
    // 400657: retq
}

/**
 * Disassembly of section .text: 000000000040075c <call_gmon_start>
 */
void call_gmon_start(void) {
    // 40075c: sub $0x8,%rsp
    // 400760: mov 0x200a51(%rip),%rax
    void (*gmon_start)(void) = (void (*)(void))_DYNAMIC[50]; // Offset 0x190 in _DYNAMIC
    // 400767: test %rax,%rax
    if (gmon_start != NULL) {
        // 40076c: callq *%rax
        gmon_start();
    }
    // 40076e: add $0x8,%rsp
    // 400772: retq
}

/**
 * Disassembly of section .text: 0000000000400780 <__do_global_dtors_aux>
 */
void __do_global_dtors_aux(void) {
    // 400780: push %rbp; mov %rsp,%rbp; push %rbx; sub $0x8,%rsp
    // 400789: cmpb $0x0,0x200ac8(%rip)
    if (completed_6531 != 0) {
        return;
    }

    // 400792: mov $0x601018,%ebx
    // 400797: mov 0x200ac2(%rip),%rax
    // 40079e: sub $0x601010,%rbx
    // 4007a5: sar $0x3,%rbx
    // 4007a9: sub $0x1,%rbx
    long max_idx = ((size_t)0x601018 - (size_t)0x601010) / 8 - 1;
    
    // 4007ad: cmp %rbx,%rax
    // 4007b0: jae 4007d6
    while (dtor_idx_6533 < max_idx) {
        // 4007b8: add $0x1,%rax
        // 4007bc: mov %rax,0x200a9d(%rip)
        dtor_idx_6533++;
        // 4007c3: callq *0x601010(,%rax,8)
        __DTOR_LIST__[dtor_idx_6533]();
        // 4007ca: mov 0x200a8f(%rip),%rax
    }

    // 4007d6: movb $0x1,0x200a7b(%rip)
    completed_6531 = 1;
    // 4007dd: add $0x8,%rsp; pop %rbx; pop %rbp; retq
}

/**
 * Disassembly of section .text: 00000000004007f0 <frame_dummy>
 */
void frame_dummy(void) {
    // 4007f0: cmpq $0x0,0x200828(%rip)
    if (__JCR_END__ != 0) {
        void (*rax)(void*) = NULL; // Simplified register logic
        if (rax != NULL) {
            rax(&__JCR_END__);
        }
    }
    // 400811: retq
}

/**
 * Disassembly of section .text: 0000000000400814 <main>
 */
int main(int argc, char **argv) {
    // 400814: push %rbp; mov %rsp,%rbp; sub $0x120,%rsp
    
    // Local Variable Mapping:
    // -0x114(%rbp): argc
    // -0x120(%rbp): argv
    // -0x110(%rbp): buf3 [100 bytes] (password_input)
    // -0xa0(%rbp):  buf2 [41 bytes]  (file_content)
    // -0x70(%rbp):  buf1 [100 bytes] (username)
    // -0x8(%rbp):   fp
    // -0xc(%rbp):   nread

    char username[100];       // -0x70
    char file_content[41];    // -0xa0
    char password_input[100]; // -0x110
    FILE *fp = NULL;          // -0x8
    int nread = 0;            // -0xc

    // 40082c - 400849: Initialize username buffer (100 bytes)
    memset(username, 0, 100); 

    // 400849 - 400869: Initialize file_content buffer (41 bytes)
    memset(file_content, 0, 41);

    // 400869 - 400889: Initialize password_input buffer (100 bytes)
    memset(password_input, 0, 100);

    // 400889: movq $0x0,-0x8(%rbp)
    fp = NULL;
    // 400891: movl $0x0,-0xc(%rbp)
    nread = 0;

    // 400898 - 4008ad: fp = fopen("password.txt", "r")
    fp = fopen(STR_FILENAME, STR_R);
    // 4008ad: mov %rax,-0x8(%rbp)

    // 4008b1: cmpq $0x0,-0x8(%rbp)
    if (fp == NULL) {
        // 4008b8 - 4008d7: fwrite(STR_ERR_OPEN, 1, 0x24, stderr)
        fwrite(STR_ERR_OPEN, 1, 36, stderr);
        // 4008dc: mov $0x1,%edi; callq 400710 <exit@plt>
        exit(1);
    }

    // 4008e6 - 400901: nread = fread(file_content, 1, 0x29, fp)
    nread = fread(file_content, 1, 41, fp);
    // 400906: mov %eax,-0xc(%rbp)

    // 400909 - 40091d: Remove newline from file_content
    file_content[strcspn(file_content, STR_NL)] = '\0';

    // 400925: cmpl $0x29,-0xc(%rbp)
    if (nread != 41) {
        // 40092b - 40094a: First fwrite of error to stderr
        fwrite(STR_ERR_SIZE, 1, 36, stderr);
        // 40094f - 40096e: Second fwrite of error to stderr (Preserving exact logic)
        fwrite(STR_ERR_SIZE, 1, 36, stderr);
        // 400973: mov $0x1,%edi; callq 400710 <exit@plt>
        exit(1);
    }

    // 40097d - 400984: fclose(fp)
    fclose(fp);

    // 400989 - 4009ac: Print banner strings
    puts(STR_BANNER1);
    puts(STR_BANNER2);
    puts(STR_BANNER3);
    puts(STR_BANNER4);

    // 4009b1 - 4009be: printf("Username: ")
    printf(STR_PROMPT_USER);

    // 4009c3 - 4009d9: fgets(username, 100, stdin)
    fgets(username, 100, stdin);

    // 4009de - 4009ef: Remove newline from username
    username[strcspn(username, STR_NL)] = '\0';

    // 4009f4 - 400a01: printf("Password: ")
    printf(STR_PROMPT_PASS);

    // 400a06 - 400a1f: fgets(password_input, 100, stdin)
    fgets(password_input, 100, stdin);

    // 400a24 - 400a38: Remove newline from password_input
    password_input[strcspn(password_input, STR_NL)] = '\0';

    // 400a40: puts("Checking...")
    puts(STR_CHECKING);

    // 400a4a - 400a63: strncmp(file_content, password_input, 41)
    if (strncmp(file_content, password_input, 41) == 0) {
        // 400a6c - 400a80: printf("Welcome, %s!\n", username)
        printf(STR_WELCOME, username);
        // 400a85: system("/bin/sh")
        system(STR_SYSTEM_CMD);
        // 400a8f: return 0
        return 0;
    } else {
        // 400a96 - 400aa2: printf(username) - Potential format string vulnerability preserved
        printf(username);
        // 400aa7: puts("Invalid password.")
        puts(STR_INVALID);
        // 400ab1: exit(1)
        exit(1);
    }
}

/**
 * Disassembly of section .text: 0000000000400ac0 <__libc_csu_init>
 */
void __libc_csu_init(int argc, char **argv, char **envp) {
    // Emulated CRT initialization logic
    _init();
    
    // Logic to call constructors from __CTOR_LIST__
    size_t n = ((size_t)0x601008 - (size_t)0x601000) / 8; // Example calculation
    for (size_t i = 0; i < n; i++) {
        // __CTOR_LIST__[i](argc, argv, envp);
    }
}

/**
 * Disassembly of section .text: 0000000000400b50 <__libc_csu_fini>
 */
void __libc_csu_fini(void) {
    // 400b50: repz retq
}

/**
 * Disassembly of section .text: 0000000000400b60 <__do_global_ctors_aux>
 */
void __do_global_ctors_aux(void) {
    // 400b60: push %rbp; mov %rsp,%rbp; push %rbx; sub $0x8,%rsp
    // 400b69: mov 0x200490(%rip),%rax (checks __CTOR_LIST__)
    void (*ctor)(void) = __CTOR_LIST__[0];
    if (ctor != (void (*)(void))-1) {
        void (**list_ptr)(void) = &__CTOR_LIST__[0];
        while (*list_ptr != (void (*)(void))-1) {
            (*list_ptr)();
            list_ptr--; // Assembly: sub $0x8, %rbx
        }
    }
}

/**
 * Disassembly of section .fini: 0000000000400b98 <_fini>
 */
void _fini(void) {
    // 400b98: sub $0x8,%rsp
    // 400b9c: callq 400780 <__do_global_dtors_aux>
    __do_global_dtors_aux();
    // 400ba1: add $0x8,%rsp
    // 400ba5: retq
}
