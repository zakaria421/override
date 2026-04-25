
Disassembly of section .init:

00000000000006f0 <_init>:
 6f0:   48 83 ec 08             sub    $0x8,%rsp
 6f4:   e8 c3 00 00 00          callq  7bc <call_gmon_start>
 6f9:   e8 62 01 00 00          callq  860 <frame_dummy>
 6fe:   e8 6d 04 00 00          callq  b70 <__do_global_ctors_aux>
 703:   48 83 c4 08             add    $0x8,%rsp
 707:   c3                      retq   

Disassembly of section .plt:

0000000000000710 <strncpy@plt-0x10>:
 710:   ff 35 da 18 20 00       pushq  0x2018da(%rip)        # 201ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
 716:   ff 25 dc 18 20 00       jmpq   *0x2018dc(%rip)        # 201ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
 71c:   0f 1f 40 00             nopl   0x0(%rax)

0000000000000720 <strncpy@plt>:
 720:   ff 25 da 18 20 00       jmpq   *0x2018da(%rip)        # 202000 <_GLOBAL_OFFSET_TABLE_+0x18>
 726:   68 00 00 00 00          pushq  $0x0
 72b:   e9 e0 ff ff ff          jmpq   710 <_init+0x20>

0000000000000730 <puts@plt>:
 730:   ff 25 d2 18 20 00       jmpq   *0x2018d2(%rip)        # 202008 <_GLOBAL_OFFSET_TABLE_+0x20>
 736:   68 01 00 00 00          pushq  $0x1
 73b:   e9 d0 ff ff ff          jmpq   710 <_init+0x20>

0000000000000740 <system@plt>:
 740:   ff 25 ca 18 20 00       jmpq   *0x2018ca(%rip)        # 202010 <_GLOBAL_OFFSET_TABLE_+0x28>
 746:   68 02 00 00 00          pushq  $0x2
 74b:   e9 c0 ff ff ff          jmpq   710 <_init+0x20>

0000000000000750 <printf@plt>:
 750:   ff 25 c2 18 20 00       jmpq   *0x2018c2(%rip)        # 202018 <_GLOBAL_OFFSET_TABLE_+0x30>
 756:   68 03 00 00 00          pushq  $0x3
 75b:   e9 b0 ff ff ff          jmpq   710 <_init+0x20>

0000000000000760 <__libc_start_main@plt>:
 760:   ff 25 ba 18 20 00       jmpq   *0x2018ba(%rip)        # 202020 <_GLOBAL_OFFSET_TABLE_+0x38>
 766:   68 04 00 00 00          pushq  $0x4
 76b:   e9 a0 ff ff ff          jmpq   710 <_init+0x20>

0000000000000770 <fgets@plt>:
 770:   ff 25 b2 18 20 00       jmpq   *0x2018b2(%rip)        # 202028 <_GLOBAL_OFFSET_TABLE_+0x40>
 776:   68 05 00 00 00          pushq  $0x5
 77b:   e9 90 ff ff ff          jmpq   710 <_init+0x20>

0000000000000780 <__cxa_finalize@plt>:
 780:   ff 25 aa 18 20 00       jmpq   *0x2018aa(%rip)        # 202030 <_GLOBAL_OFFSET_TABLE_+0x48>
 786:   68 06 00 00 00          pushq  $0x6
 78b:   e9 80 ff ff ff          jmpq   710 <_init+0x20>

Disassembly of section .text:

0000000000000790 <_start>:
 790:   31 ed                   xor    %ebp,%ebp
 792:   49 89 d1                mov    %rdx,%r9
 795:   5e                      pop    %rsi
 796:   48 89 e2                mov    %rsp,%rdx
 799:   48 83 e4 f0             and    $0xfffffffffffffff0,%rsp
 79d:   50                      push   %rax
 79e:   54                      push   %rsp
 79f:   4c 8b 05 0a 18 20 00    mov    0x20180a(%rip),%r8        # 201fb0 <_DYNAMIC+0x190>
 7a6:   48 8b 0d 1b 18 20 00    mov    0x20181b(%rip),%rcx        # 201fc8 <_DYNAMIC+0x1a8>
 7ad:   48 8b 3d 1c 18 20 00    mov    0x20181c(%rip),%rdi        # 201fd0 <_DYNAMIC+0x1b0>
 7b4:   e8 a7 ff ff ff          callq  760 <__libc_start_main@plt>
 7b9:   f4                      hlt    
 7ba:   90                      nop
 7bb:   90                      nop

00000000000007bc <call_gmon_start>:
 7bc:   48 83 ec 08             sub    $0x8,%rsp
 7c0:   48 8b 05 f9 17 20 00    mov    0x2017f9(%rip),%rax        # 201fc0 <_DYNAMIC+0x1a0>
 7c7:   48 85 c0                test   %rax,%rax
 7ca:   74 02                   je     7ce <call_gmon_start+0x12>
 7cc:   ff d0                   callq  *%rax
 7ce:   48 83 c4 08             add    $0x8,%rsp
 7d2:   c3                      retq   
 7d3:   90                      nop
 7d4:   90                      nop
 7d5:   90                      nop
 7d6:   90                      nop
 7d7:   90                      nop
 7d8:   90                      nop
 7d9:   90                      nop
 7da:   90                      nop
 7db:   90                      nop
 7dc:   90                      nop
 7dd:   90                      nop
 7de:   90                      nop
 7df:   90                      nop

00000000000007e0 <__do_global_dtors_aux>:
 7e0:   55                      push   %rbp
 7e1:   80 3d 78 18 20 00 00    cmpb   $0x0,0x201878(%rip)        # 202060 <completed.6531>
 7e8:   48 89 e5                mov    %rsp,%rbp
 7eb:   41 54                   push   %r12
 7ed:   53                      push   %rbx
 7ee:   75 62                   jne    852 <__do_global_dtors_aux+0x72>
 7f0:   48 83 3d e8 17 20 00    cmpq   $0x0,0x2017e8(%rip)        # 201fe0 <_DYNAMIC+0x1c0>
 7f7:   00 
 7f8:   74 0c                   je     806 <__do_global_dtors_aux+0x26>
 7fa:   48 8b 3d 3f 18 20 00    mov    0x20183f(%rip),%rdi        # 202040 <__dso_handle>
 801:   e8 7a ff ff ff          callq  780 <__cxa_finalize@plt>
 806:   48 8d 1d 03 16 20 00    lea    0x201603(%rip),%rbx        # 201e10 <__DTOR_END__>
 80d:   4c 8d 25 f4 15 20 00    lea    0x2015f4(%rip),%r12        # 201e08 <__DTOR_LIST__>
 814:   48 8b 05 4d 18 20 00    mov    0x20184d(%rip),%rax        # 202068 <dtor_idx.6533>
 81b:   4c 29 e3                sub    %r12,%rbx
 81e:   48 c1 fb 03             sar    $0x3,%rbx
 822:   48 83 eb 01             sub    $0x1,%rbx
 826:   48 39 d8                cmp    %rbx,%rax
 829:   73 20                   jae    84b <__do_global_dtors_aux+0x6b>
 82b:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
 830:   48 83 c0 01             add    $0x1,%rax
 834:   48 89 05 2d 18 20 00    mov    %rax,0x20182d(%rip)        # 202068 <dtor_idx.6533>
 83b:   41 ff 14 c4             callq  *(%r12,%rax,8)
 83f:   48 8b 05 22 18 20 00    mov    0x201822(%rip),%rax        # 202068 <dtor_idx.6533>
 846:   48 39 d8                cmp    %rbx,%rax
 849:   72 e5                   jb     830 <__do_global_dtors_aux+0x50>
 84b:   c6 05 0e 18 20 00 01    movb   $0x1,0x20180e(%rip)        # 202060 <completed.6531>
 852:   5b                      pop    %rbx
 853:   41 5c                   pop    %r12
 855:   5d                      pop    %rbp
 856:   c3                      retq   
 857:   66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
 85e:   00 00 

0000000000000860 <frame_dummy>:
 860:   48 83 3d b0 15 20 00    cmpq   $0x0,0x2015b0(%rip)        # 201e18 <__JCR_END__>
 867:   00 
 868:   55                      push   %rbp
 869:   48 89 e5                mov    %rsp,%rbp
 86c:   74 1a                   je     888 <frame_dummy+0x28>
 86e:   48 8b 05 63 17 20 00    mov    0x201763(%rip),%rax        # 201fd8 <_DYNAMIC+0x1b8>
 875:   48 85 c0                test   %rax,%rax
 878:   74 0e                   je     888 <frame_dummy+0x28>
 87a:   5d                      pop    %rbp
 87b:   48 8d 3d 96 15 20 00    lea    0x201596(%rip),%rdi        # 201e18 <__JCR_END__>
 882:   ff e0                   jmpq   *%rax
 884:   0f 1f 40 00             nopl   0x0(%rax)
 888:   5d                      pop    %rbp
 889:   c3                      retq   
 88a:   90                      nop
 88b:   90                      nop

000000000000088c <secret_backdoor>:
 88c:   55                      push   %rbp
 88d:   48 89 e5                mov    %rsp,%rbp
 890:   48 83 c4 80             add    $0xffffffffffffff80,%rsp
 894:   48 8b 05 1d 17 20 00    mov    0x20171d(%rip),%rax        # 201fb8 <_DYNAMIC+0x198>
 89b:   48 8b 00                mov    (%rax),%rax
 89e:   48 89 c2                mov    %rax,%rdx
 8a1:   48 8d 45 80             lea    -0x80(%rbp),%rax
 8a5:   be 80 00 00 00          mov    $0x80,%esi
 8aa:   48 89 c7                mov    %rax,%rdi
 8ad:   e8 be fe ff ff          callq  770 <fgets@plt>
 8b2:   48 8d 45 80             lea    -0x80(%rbp),%rax
 8b6:   48 89 c7                mov    %rax,%rdi
 8b9:   e8 82 fe ff ff          callq  740 <system@plt>
 8be:   c9                      leaveq 
 8bf:   c3                      retq   

00000000000008c0 <handle_msg>:
 8c0:   55                      push   %rbp
 8c1:   48 89 e5                mov    %rsp,%rbp
 8c4:   48 81 ec c0 00 00 00    sub    $0xc0,%rsp
 8cb:   48 8d 85 40 ff ff ff    lea    -0xc0(%rbp),%rax
 8d2:   48 05 8c 00 00 00       add    $0x8c,%rax
 8d8:   48 c7 00 00 00 00 00    movq   $0x0,(%rax)
 8df:   48 c7 40 08 00 00 00    movq   $0x0,0x8(%rax)
 8e6:   00 
 8e7:   48 c7 40 10 00 00 00    movq   $0x0,0x10(%rax)
 8ee:   00 
 8ef:   48 c7 40 18 00 00 00    movq   $0x0,0x18(%rax)
 8f6:   00 
 8f7:   48 c7 40 20 00 00 00    movq   $0x0,0x20(%rax)
 8fe:   00 
 8ff:   c7 45 f4 8c 00 00 00    movl   $0x8c,-0xc(%rbp)
 906:   48 8d 85 40 ff ff ff    lea    -0xc0(%rbp),%rax
 90d:   48 89 c7                mov    %rax,%rdi
 910:   e8 b8 00 00 00          callq  9cd <set_username>
 915:   48 8d 85 40 ff ff ff    lea    -0xc0(%rbp),%rax
 91c:   48 89 c7                mov    %rax,%rdi
 91f:   e8 0e 00 00 00          callq  932 <set_msg>
 924:   48 8d 3d 95 02 00 00    lea    0x295(%rip),%rdi        # bc0 <_IO_stdin_used+0x8>
 92b:   e8 00 fe ff ff          callq  730 <puts@plt>
 930:   c9                      leaveq 
 931:   c3                      retq   

0000000000000932 <set_msg>:
 932:   55                      push   %rbp
 933:   48 89 e5                mov    %rsp,%rbp
 936:   48 81 ec 10 04 00 00    sub    $0x410,%rsp
 93d:   48 89 bd f8 fb ff ff    mov    %rdi,-0x408(%rbp)
 944:   48 8d 85 00 fc ff ff    lea    -0x400(%rbp),%rax
 94b:   48 89 c6                mov    %rax,%rsi
 94e:   b8 00 00 00 00          mov    $0x0,%eax
 953:   ba 80 00 00 00          mov    $0x80,%edx
 958:   48 89 f7                mov    %rsi,%rdi
 95b:   48 89 d1                mov    %rdx,%rcx
 95e:   f3 48 ab                rep stos %rax,%es:(%rdi)
 961:   48 8d 3d 65 02 00 00    lea    0x265(%rip),%rdi        # bcd <_IO_stdin_used+0x15>
 968:   e8 c3 fd ff ff          callq  730 <puts@plt>
 96d:   48 8d 05 6b 02 00 00    lea    0x26b(%rip),%rax        # bdf <_IO_stdin_used+0x27>
 974:   48 89 c7                mov    %rax,%rdi
 977:   b8 00 00 00 00          mov    $0x0,%eax
 97c:   e8 cf fd ff ff          callq  750 <printf@plt>
 981:   48 8b 05 30 16 20 00    mov    0x201630(%rip),%rax        # 201fb8 <_DYNAMIC+0x198>
 988:   48 8b 00                mov    (%rax),%rax
 98b:   48 89 c2                mov    %rax,%rdx
 98e:   48 8d 85 00 fc ff ff    lea    -0x400(%rbp),%rax
 995:   be 00 04 00 00          mov    $0x400,%esi
 99a:   48 89 c7                mov    %rax,%rdi
 99d:   e8 ce fd ff ff          callq  770 <fgets@plt>
 9a2:   48 8b 85 f8 fb ff ff    mov    -0x408(%rbp),%rax
 9a9:   8b 80 b4 00 00 00       mov    0xb4(%rax),%eax
 9af:   48 63 d0                movslq %eax,%rdx
 9b2:   48 8d 8d 00 fc ff ff    lea    -0x400(%rbp),%rcx
 9b9:   48 8b 85 f8 fb ff ff    mov    -0x408(%rbp),%rax
 9c0:   48 89 ce                mov    %rcx,%rsi
 9c3:   48 89 c7                mov    %rax,%rdi
 9c6:   e8 55 fd ff ff          callq  720 <strncpy@plt>
 9cb:   c9                      leaveq 
 9cc:   c3                      retq   

00000000000009cd <set_username>:
 9cd:   55                      push   %rbp
 9ce:   48 89 e5                mov    %rsp,%rbp
 9d1:   48 81 ec a0 00 00 00    sub    $0xa0,%rsp
 9d8:   48 89 bd 68 ff ff ff    mov    %rdi,-0x98(%rbp)
 9df:   48 8d 85 70 ff ff ff    lea    -0x90(%rbp),%rax
 9e6:   48 89 c6                mov    %rax,%rsi
 9e9:   b8 00 00 00 00          mov    $0x0,%eax
 9ee:   ba 10 00 00 00          mov    $0x10,%edx
 9f3:   48 89 f7                mov    %rsi,%rdi
 9f6:   48 89 d1                mov    %rdx,%rcx
 9f9:   f3 48 ab                rep stos %rax,%es:(%rdi)
 9fc:   48 8d 3d e1 01 00 00    lea    0x1e1(%rip),%rdi        # be4 <_IO_stdin_used+0x2c>
 a03:   e8 28 fd ff ff          callq  730 <puts@plt>
 a08:   48 8d 05 d0 01 00 00    lea    0x1d0(%rip),%rax        # bdf <_IO_stdin_used+0x27>
 a0f:   48 89 c7                mov    %rax,%rdi
 a12:   b8 00 00 00 00          mov    $0x0,%eax
 a17:   e8 34 fd ff ff          callq  750 <printf@plt>
 a1c:   48 8b 05 95 15 20 00    mov    0x201595(%rip),%rax        # 201fb8 <_DYNAMIC+0x198>
 a23:   48 8b 00                mov    (%rax),%rax
 a26:   48 89 c2                mov    %rax,%rdx
 a29:   48 8d 85 70 ff ff ff    lea    -0x90(%rbp),%rax
 a30:   be 80 00 00 00          mov    $0x80,%esi
 a35:   48 89 c7                mov    %rax,%rdi
 a38:   e8 33 fd ff ff          callq  770 <fgets@plt>
 a3d:   c7 45 fc 00 00 00 00    movl   $0x0,-0x4(%rbp)
 a44:   eb 24                   jmp    a6a <set_username+0x9d>
 a46:   8b 45 fc                mov    -0x4(%rbp),%eax
 a49:   48 98                   cltq   
 a4b:   0f b6 8c 05 70 ff ff    movzbl -0x90(%rbp,%rax,1),%ecx
 a52:   ff 
 a53:   48 8b 95 68 ff ff ff    mov    -0x98(%rbp),%rdx
 a5a:   8b 45 fc                mov    -0x4(%rbp),%eax
 a5d:   48 98                   cltq   
 a5f:   88 8c 02 8c 00 00 00    mov    %cl,0x8c(%rdx,%rax,1)
 a66:   83 45 fc 01             addl   $0x1,-0x4(%rbp)
 a6a:   83 7d fc 28             cmpl   $0x28,-0x4(%rbp)
 a6e:   7f 11                   jg     a81 <set_username+0xb4>
 a70:   8b 45 fc                mov    -0x4(%rbp),%eax
 a73:   48 98                   cltq   
 a75:   0f b6 84 05 70 ff ff    movzbl -0x90(%rbp,%rax,1),%eax
 a7c:   ff 
 a7d:   84 c0                   test   %al,%al
 a7f:   75 c5                   jne    a46 <set_username+0x79>
 a81:   48 8b 85 68 ff ff ff    mov    -0x98(%rbp),%rax
 a88:   48 8d 90 8c 00 00 00    lea    0x8c(%rax),%rdx
 a8f:   48 8d 05 65 01 00 00    lea    0x165(%rip),%rax        # bfb <_IO_stdin_used+0x43>
 a96:   48 89 d6                mov    %rdx,%rsi
 a99:   48 89 c7                mov    %rax,%rdi
 a9c:   b8 00 00 00 00          mov    $0x0,%eax
 aa1:   e8 aa fc ff ff          callq  750 <printf@plt>
 aa6:   c9                      leaveq 
 aa7:   c3                      retq   

0000000000000aa8 <main>:
 aa8:   55                      push   %rbp
 aa9:   48 89 e5                mov    %rsp,%rbp
 aac:   48 8d 3d 5d 01 00 00    lea    0x15d(%rip),%rdi        # c10 <_IO_stdin_used+0x58>
 ab3:   e8 78 fc ff ff          callq  730 <puts@plt>
 ab8:   e8 03 fe ff ff          callq  8c0 <handle_msg>
 abd:   b8 00 00 00 00          mov    $0x0,%eax
 ac2:   5d                      pop    %rbp
 ac3:   c3                      retq   
 ac4:   90                      nop
 ac5:   90                      nop
 ac6:   90                      nop
 ac7:   90                      nop
 ac8:   90                      nop
 ac9:   90                      nop
 aca:   90                      nop
 acb:   90                      nop
 acc:   90                      nop
 acd:   90                      nop
 ace:   90                      nop
 acf:   90                      nop

0000000000000ad0 <__libc_csu_init>:
 ad0:   48 89 6c 24 d8          mov    %rbp,-0x28(%rsp)
 ad5:   4c 89 64 24 e0          mov    %r12,-0x20(%rsp)
 ada:   48 8d 2d 13 13 20 00    lea    0x201313(%rip),%rbp        # 201df4 <__init_array_end>
 ae1:   4c 8d 25 0c 13 20 00    lea    0x20130c(%rip),%r12        # 201df4 <__init_array_end>
 ae8:   4c 89 6c 24 e8          mov    %r13,-0x18(%rsp)
 aed:   4c 89 74 24 f0          mov    %r14,-0x10(%rsp)
 af2:   4c 89 7c 24 f8          mov    %r15,-0x8(%rsp)
 af7:   48 89 5c 24 d0          mov    %rbx,-0x30(%rsp)
 afc:   48 83 ec 38             sub    $0x38,%rsp
 b00:   4c 29 e5                sub    %r12,%rbp
 b03:   41 89 fd                mov    %edi,%r13d
 b06:   49 89 f6                mov    %rsi,%r14
 b09:   48 c1 fd 03             sar    $0x3,%rbp
 b0d:   49 89 d7                mov    %rdx,%r15
 b10:   e8 db fb ff ff          callq  6f0 <_init>
 b15:   48 85 ed                test   %rbp,%rbp
 b18:   74 1c                   je     b36 <__libc_csu_init+0x66>
 b1a:   31 db                   xor    %ebx,%ebx
 b1c:   0f 1f 40 00             nopl   0x0(%rax)
 b20:   4c 89 fa                mov    %r15,%rdx
 b23:   4c 89 f6                mov    %r14,%rsi
 b26:   44 89 ef                mov    %r13d,%edi
 b29:   41 ff 14 dc             callq  *(%r12,%rbx,8)
 b2d:   48 83 c3 01             add    $0x1,%rbx
 b31:   48 39 eb                cmp    %rbp,%rbx
 b34:   75 ea                   jne    b20 <__libc_csu_init+0x50>
 b36:   48 8b 5c 24 08          mov    0x8(%rsp),%rbx
 b3b:   48 8b 6c 24 10          mov    0x10(%rsp),%rbp
 b40:   4c 8b 64 24 18          mov    0x18(%rsp),%r12
 b45:   4c 8b 6c 24 20          mov    0x20(%rsp),%r13
 b4a:   4c 8b 74 24 28          mov    0x28(%rsp),%r14
 b4f:   4c 8b 7c 24 30          mov    0x30(%rsp),%r15
 b54:   48 83 c4 38             add    $0x38,%rsp
 b58:   c3                      retq   
 b59:   0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000000b60 <__libc_csu_fini>:
 b60:   f3 c3                   repz retq 
 b62:   90                      nop
 b63:   90                      nop
 b64:   90                      nop
 b65:   90                      nop
 b66:   90                      nop
 b67:   90                      nop
 b68:   90                      nop
 b69:   90                      nop
 b6a:   90                      nop
 b6b:   90                      nop
 b6c:   90                      nop
 b6d:   90                      nop
 b6e:   90                      nop
 b6f:   90                      nop

0000000000000b70 <__do_global_ctors_aux>:
 b70:   55                      push   %rbp
 b71:   48 89 e5                mov    %rsp,%rbp
 b74:   53                      push   %rbx
 b75:   48 83 ec 08             sub    $0x8,%rsp
 b79:   48 8b 05 78 12 20 00    mov    0x201278(%rip),%rax        # 201df8 <__CTOR_LIST__>
 b80:   48 83 f8 ff             cmp    $0xffffffffffffffff,%rax
 b84:   74 19                   je     b9f <__do_global_ctors_aux+0x2f>
 b86:   48 8d 1d 6b 12 20 00    lea    0x20126b(%rip),%rbx        # 201df8 <__CTOR_LIST__>
 b8d:   0f 1f 00                nopl   (%rax)
 b90:   48 83 eb 08             sub    $0x8,%rbx
 b94:   ff d0                   callq  *%rax
 b96:   48 8b 03                mov    (%rbx),%rax
 b99:   48 83 f8 ff             cmp    $0xffffffffffffffff,%rax
 b9d:   75 f1                   jne    b90 <__do_global_ctors_aux+0x20>
 b9f:   48 83 c4 08             add    $0x8,%rsp
 ba3:   5b                      pop    %rbx
 ba4:   5d                      pop    %rbp
 ba5:   c3                      retq   
 ba6:   90                      nop
 ba7:   90                      nop

Disassembly of section .fini:

0000000000000ba8 <_fini>:
 ba8:   48 83 ec 08             sub    $0x8,%rsp
 bac:   e8 2f fc ff ff          callq  7e0 <__do_global_dtors_aux>
 bb1:   48 83 c4 08             add    $0x8,%rsp
 bb5:   c3                      retq 