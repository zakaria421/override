Disassembly of section .init:

080484d0 <_init>:
 80484d0:       53                      push   %ebx
 80484d1:       83 ec 08                sub    $0x8,%esp
 80484d4:       e8 00 00 00 00          call   80484d9 <_init+0x9>
 80484d9:       5b                      pop    %ebx
 80484da:       81 c3 1b 1b 00 00       add    $0x1b1b,%ebx
 80484e0:       8b 83 fc ff ff ff       mov    -0x4(%ebx),%eax
 80484e6:       85 c0                   test   %eax,%eax
 80484e8:       74 05                   je     80484ef <_init+0x1f>
 80484ea:       e8 c1 00 00 00          call   80485b0 <__gmon_start__@plt>
 80484ef:       e8 9c 01 00 00          call   8048690 <frame_dummy>
 80484f4:       e8 17 05 00 00          call   8048a10 <__do_global_ctors_aux>
 80484f9:       83 c4 08                add    $0x8,%esp
 80484fc:       5b                      pop    %ebx
 80484fd:       c3                      ret    

Disassembly of section .plt:

08048500 <printf@plt-0x10>:
 8048500:       ff 35 f8 9f 04 08       pushl  0x8049ff8
 8048506:       ff 25 fc 9f 04 08       jmp    *0x8049ffc
 804850c:       00 00                   add    %al,(%eax)
        ...

08048510 <printf@plt>:
 8048510:       ff 25 00 a0 04 08       jmp    *0x804a000
 8048516:       68 00 00 00 00          push   $0x0
 804851b:       e9 e0 ff ff ff          jmp    8048500 <_init+0x30>

08048520 <strcspn@plt>:
 8048520:       ff 25 04 a0 04 08       jmp    *0x804a004
 8048526:       68 08 00 00 00          push   $0x8
 804852b:       e9 d0 ff ff ff          jmp    8048500 <_init+0x30>

08048530 <fflush@plt>:
 8048530:       ff 25 08 a0 04 08       jmp    *0x804a008
 8048536:       68 10 00 00 00          push   $0x10
 804853b:       e9 c0 ff ff ff          jmp    8048500 <_init+0x30>

08048540 <getchar@plt>:
 8048540:       ff 25 0c a0 04 08       jmp    *0x804a00c
 8048546:       68 18 00 00 00          push   $0x18
 804854b:       e9 b0 ff ff ff          jmp    8048500 <_init+0x30>

08048550 <fgets@plt>:
 8048550:       ff 25 10 a0 04 08       jmp    *0x804a010
 8048556:       68 20 00 00 00          push   $0x20
 804855b:       e9 a0 ff ff ff          jmp    8048500 <_init+0x30>

08048560 <signal@plt>:
 8048560:       ff 25 14 a0 04 08       jmp    *0x804a014
 8048566:       68 28 00 00 00          push   $0x28
 804856b:       e9 90 ff ff ff          jmp    8048500 <_init+0x30>

08048570 <alarm@plt>:
 8048570:       ff 25 18 a0 04 08       jmp    *0x804a018
 8048576:       68 30 00 00 00          push   $0x30
 804857b:       e9 80 ff ff ff          jmp    8048500 <_init+0x30>

08048580 <__stack_chk_fail@plt>:
 8048580:       ff 25 1c a0 04 08       jmp    *0x804a01c
 8048586:       68 38 00 00 00          push   $0x38
 804858b:       e9 70 ff ff ff          jmp    8048500 <_init+0x30>

08048590 <puts@plt>:
 8048590:       ff 25 20 a0 04 08       jmp    *0x804a020
 8048596:       68 40 00 00 00          push   $0x40
 804859b:       e9 60 ff ff ff          jmp    8048500 <_init+0x30>

080485a0 <system@plt>:
 80485a0:       ff 25 24 a0 04 08       jmp    *0x804a024
 80485a6:       68 48 00 00 00          push   $0x48
 80485ab:       e9 50 ff ff ff          jmp    8048500 <_init+0x30>

080485b0 <__gmon_start__@plt>:
 80485b0:       ff 25 28 a0 04 08       jmp    *0x804a028
 80485b6:       68 50 00 00 00          push   $0x50
 80485bb:       e9 40 ff ff ff          jmp    8048500 <_init+0x30>

080485c0 <__libc_start_main@plt>:
 80485c0:       ff 25 2c a0 04 08       jmp    *0x804a02c
 80485c6:       68 58 00 00 00          push   $0x58
 80485cb:       e9 30 ff ff ff          jmp    8048500 <_init+0x30>

080485d0 <strnlen@plt>:
 80485d0:       ff 25 30 a0 04 08       jmp    *0x804a030
 80485d6:       68 60 00 00 00          push   $0x60
 80485db:       e9 20 ff ff ff          jmp    8048500 <_init+0x30>

080485e0 <__isoc99_scanf@plt>:
 80485e0:       ff 25 34 a0 04 08       jmp    *0x804a034
 80485e6:       68 68 00 00 00          push   $0x68
 80485eb:       e9 10 ff ff ff          jmp    8048500 <_init+0x30>

080485f0 <ptrace@plt>:
 80485f0:       ff 25 38 a0 04 08       jmp    *0x804a038
 80485f6:       68 70 00 00 00          push   $0x70
 80485fb:       e9 00 ff ff ff          jmp    8048500 <_init+0x30>

Disassembly of section .text:

08048600 <_start>:
 8048600:       31 ed                   xor    %ebp,%ebp
 8048602:       5e                      pop    %esi
 8048603:       89 e1                   mov    %esp,%ecx
 8048605:       83 e4 f0                and    $0xfffffff0,%esp
 8048608:       50                      push   %eax
 8048609:       54                      push   %esp
 804860a:       52                      push   %edx
 804860b:       68 00 8a 04 08          push   $0x8048a00
 8048610:       68 90 89 04 08          push   $0x8048990
 8048615:       51                      push   %ecx
 8048616:       56                      push   %esi
 8048617:       68 79 88 04 08          push   $0x8048879
 804861c:       e8 9f ff ff ff          call   80485c0 <__libc_start_main@plt>
 8048621:       f4                      hlt    
 8048622:       90                      nop
 8048623:       90                      nop
 8048624:       90                      nop
 8048625:       90                      nop
 8048626:       90                      nop
 8048627:       90                      nop
 8048628:       90                      nop
 8048629:       90                      nop
 804862a:       90                      nop
 804862b:       90                      nop
 804862c:       90                      nop
 804862d:       90                      nop
 804862e:       90                      nop
 804862f:       90                      nop

08048630 <__do_global_dtors_aux>:
 8048630:       55                      push   %ebp
 8048631:       89 e5                   mov    %esp,%ebp
 8048633:       53                      push   %ebx
 8048634:       83 ec 04                sub    $0x4,%esp
 8048637:       80 3d 84 a0 04 08 00    cmpb   $0x0,0x804a084
 804863e:       75 3f                   jne    804867f <__do_global_dtors_aux+0x4f>
 8048640:       a1 88 a0 04 08          mov    0x804a088,%eax
 8048645:       bb 10 9f 04 08          mov    $0x8049f10,%ebx
 804864a:       81 eb 0c 9f 04 08       sub    $0x8049f0c,%ebx
 8048650:       c1 fb 02                sar    $0x2,%ebx
 8048653:       83 eb 01                sub    $0x1,%ebx
 8048656:       39 d8                   cmp    %ebx,%eax
 8048658:       73 1e                   jae    8048678 <__do_global_dtors_aux+0x48>
 804865a:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
 8048660:       83 c0 01                add    $0x1,%eax
 8048663:       a3 88 a0 04 08          mov    %eax,0x804a088
 8048668:       ff 14 85 0c 9f 04 08    call   *0x8049f0c(,%eax,4)
 804866f:       a1 88 a0 04 08          mov    0x804a088,%eax
 8048674:       39 d8                   cmp    %ebx,%eax
 8048676:       72 e8                   jb     8048660 <__do_global_dtors_aux+0x30>
 8048678:       c6 05 84 a0 04 08 01    movb   $0x1,0x804a084
 804867f:       83 c4 04                add    $0x4,%esp
 8048682:       5b                      pop    %ebx
 8048683:       5d                      pop    %ebp
 8048684:       c3                      ret    
 8048685:       8d 74 26 00             lea    0x0(%esi,%eiz,1),%esi
 8048689:       8d bc 27 00 00 00 00    lea    0x0(%edi,%eiz,1),%edi

08048690 <frame_dummy>:
 8048690:       55                      push   %ebp
 8048691:       89 e5                   mov    %esp,%ebp
 8048693:       83 ec 18                sub    $0x18,%esp
 8048696:       a1 14 9f 04 08          mov    0x8049f14,%eax
 804869b:       85 c0                   test   %eax,%eax
 804869d:       74 12                   je     80486b1 <frame_dummy+0x21>
 804869f:       b8 00 00 00 00          mov    $0x0,%eax
 80486a4:       85 c0                   test   %eax,%eax
 80486a6:       74 09                   je     80486b1 <frame_dummy+0x21>
 80486a8:       c7 04 24 14 9f 04 08    movl   $0x8049f14,(%esp)
 80486af:       ff d0                   call   *%eax
 80486b1:       c9                      leave  
 80486b2:       c3                      ret    
 80486b3:       90                      nop

080486b4 <clear_stdin>:
 80486b4:       55                      push   %ebp
 80486b5:       89 e5                   mov    %esp,%ebp
 80486b7:       83 ec 18                sub    $0x18,%esp
 80486ba:       c6 45 f7 00             movb   $0x0,-0x9(%ebp)
 80486be:       eb 01                   jmp    80486c1 <clear_stdin+0xd>
 80486c0:       90                      nop
 80486c1:       e8 7a fe ff ff          call   8048540 <getchar@plt>
 80486c6:       88 45 f7                mov    %al,-0x9(%ebp)
 80486c9:       80 7d f7 0a             cmpb   $0xa,-0x9(%ebp)
 80486cd:       74 06                   je     80486d5 <clear_stdin+0x21>
 80486cf:       80 7d f7 ff             cmpb   $0xff,-0x9(%ebp)
 80486d3:       75 eb                   jne    80486c0 <clear_stdin+0xc>
 80486d5:       c9                      leave  
 80486d6:       c3                      ret    

080486d7 <get_unum>:
 80486d7:       55                      push   %ebp
 80486d8:       89 e5                   mov    %esp,%ebp
 80486da:       83 ec 28                sub    $0x28,%esp
 80486dd:       c7 45 f4 00 00 00 00    movl   $0x0,-0xc(%ebp)
 80486e4:       a1 80 a0 04 08          mov    0x804a080,%eax
 80486e9:       89 04 24                mov    %eax,(%esp)
 80486ec:       e8 3f fe ff ff          call   8048530 <fflush@plt>
 80486f1:       b8 60 8a 04 08          mov    $0x8048a60,%eax
 80486f6:       8d 55 f4                lea    -0xc(%ebp),%edx
 80486f9:       89 54 24 04             mov    %edx,0x4(%esp)
 80486fd:       89 04 24                mov    %eax,(%esp)
 8048700:       e8 db fe ff ff          call   80485e0 <__isoc99_scanf@plt>
 8048705:       e8 aa ff ff ff          call   80486b4 <clear_stdin>
 804870a:       8b 45 f4                mov    -0xc(%ebp),%eax
 804870d:       c9                      leave  
 804870e:       c3                      ret    

0804870f <prog_timeout>:
 804870f:       55                      push   %ebp
 8048710:       89 e5                   mov    %esp,%ebp
 8048712:       b8 01 00 00 00          mov    $0x1,%eax
 8048717:       bb 01 00 00 00          mov    $0x1,%ebx
 804871c:       cd 80                   int    $0x80
 804871e:       5d                      pop    %ebp
 804871f:       c3                      ret    

08048720 <enable_timeout_cons>:
 8048720:       55                      push   %ebp
 8048721:       89 e5                   mov    %esp,%ebp
 8048723:       83 ec 18                sub    $0x18,%esp
 8048726:       c7 44 24 04 0f 87 04    movl   $0x804870f,0x4(%esp)
 804872d:       08 
 804872e:       c7 04 24 0e 00 00 00    movl   $0xe,(%esp)
 8048735:       e8 26 fe ff ff          call   8048560 <signal@plt>
 804873a:       c7 04 24 3c 00 00 00    movl   $0x3c,(%esp)
 8048741:       e8 2a fe ff ff          call   8048570 <alarm@plt>
 8048746:       c9                      leave  
 8048747:       c3                      ret    

08048748 <auth>:
 8048748:       55                      push   %ebp
 8048749:       89 e5                   mov    %esp,%ebp
 804874b:       83 ec 28                sub    $0x28,%esp
 804874e:       c7 44 24 04 63 8a 04    movl   $0x8048a63,0x4(%esp)
 8048755:       08 
 8048756:       8b 45 08                mov    0x8(%ebp),%eax
 8048759:       89 04 24                mov    %eax,(%esp)
 804875c:       e8 bf fd ff ff          call   8048520 <strcspn@plt>
 8048761:       03 45 08                add    0x8(%ebp),%eax
 8048764:       c6 00 00                movb   $0x0,(%eax)
 8048767:       c7 44 24 04 20 00 00    movl   $0x20,0x4(%esp)
 804876e:       00 
 804876f:       8b 45 08                mov    0x8(%ebp),%eax
 8048772:       89 04 24                mov    %eax,(%esp)
 8048775:       e8 56 fe ff ff          call   80485d0 <strnlen@plt>
 804877a:       89 45 f4                mov    %eax,-0xc(%ebp)
 804877d:       50                      push   %eax
 804877e:       31 c0                   xor    %eax,%eax
 8048780:       74 03                   je     8048785 <auth+0x3d>
 8048782:       83 c4 04                add    $0x4,%esp
 8048785:       58                      pop    %eax
 8048786:       83 7d f4 05             cmpl   $0x5,-0xc(%ebp)
 804878a:       7f 0a                   jg     8048796 <auth+0x4e>
 804878c:       b8 01 00 00 00          mov    $0x1,%eax
 8048791:       e9 e1 00 00 00          jmp    8048877 <auth+0x12f>
 8048796:       c7 44 24 0c 00 00 00    movl   $0x0,0xc(%esp)
 804879d:       00 
 804879e:       c7 44 24 08 01 00 00    movl   $0x1,0x8(%esp)
 80487a5:       00 
 80487a6:       c7 44 24 04 00 00 00    movl   $0x0,0x4(%esp)
 80487ad:       00 
 80487ae:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 80487b5:       e8 36 fe ff ff          call   80485f0 <ptrace@plt>
 80487ba:       83 f8 ff                cmp    $0xffffffff,%eax
 80487bd:       75 2e                   jne    80487ed <auth+0xa5>
 80487bf:       c7 04 24 68 8a 04 08    movl   $0x8048a68,(%esp)
 80487c6:       e8 c5 fd ff ff          call   8048590 <puts@plt>
 80487cb:       c7 04 24 8c 8a 04 08    movl   $0x8048a8c,(%esp)
 80487d2:       e8 b9 fd ff ff          call   8048590 <puts@plt>
 80487d7:       c7 04 24 b0 8a 04 08    movl   $0x8048ab0,(%esp)
 80487de:       e8 ad fd ff ff          call   8048590 <puts@plt>
 80487e3:       b8 01 00 00 00          mov    $0x1,%eax
 80487e8:       e9 8a 00 00 00          jmp    8048877 <auth+0x12f>
 80487ed:       8b 45 08                mov    0x8(%ebp),%eax
 80487f0:       83 c0 03                add    $0x3,%eax
 80487f3:       0f b6 00                movzbl (%eax),%eax
 80487f6:       0f be c0                movsbl %al,%eax
 80487f9:       35 37 13 00 00          xor    $0x1337,%eax
 80487fe:       05 ed ed 5e 00          add    $0x5eeded,%eax
 8048803:       89 45 f0                mov    %eax,-0x10(%ebp)
 8048806:       c7 45 ec 00 00 00 00    movl   $0x0,-0x14(%ebp)
 804880d:       eb 4c                   jmp    804885b <auth+0x113>
 804880f:       8b 45 ec                mov    -0x14(%ebp),%eax
 8048812:       03 45 08                add    0x8(%ebp),%eax
 8048815:       0f b6 00                movzbl (%eax),%eax
 8048818:       3c 1f                   cmp    $0x1f,%al
 804881a:       7f 07                   jg     8048823 <auth+0xdb>
 804881c:       b8 01 00 00 00          mov    $0x1,%eax
 8048821:       eb 54                   jmp    8048877 <auth+0x12f>
 8048823:       8b 45 ec                mov    -0x14(%ebp),%eax
 8048826:       03 45 08                add    0x8(%ebp),%eax
 8048829:       0f b6 00                movzbl (%eax),%eax
 804882c:       0f be c0                movsbl %al,%eax
 804882f:       89 c1                   mov    %eax,%ecx
 8048831:       33 4d f0                xor    -0x10(%ebp),%ecx
 8048834:       ba 2b 3b 23 88          mov    $0x88233b2b,%edx
 8048839:       89 c8                   mov    %ecx,%eax
 804883b:       f7 e2                   mul    %edx
 804883d:       89 c8                   mov    %ecx,%eax
 804883f:       29 d0                   sub    %edx,%eax
 8048841:       d1 e8                   shr    %eax
 8048843:       01 d0                   add    %edx,%eax
 8048845:       c1 e8 0a                shr    $0xa,%eax
 8048848:       69 c0 39 05 00 00       imul   $0x539,%eax,%eax
 804884e:       89 ca                   mov    %ecx,%edx
 8048850:       29 c2                   sub    %eax,%edx
 8048852:       89 d0                   mov    %edx,%eax
 8048854:       01 45 f0                add    %eax,-0x10(%ebp)
 8048857:       83 45 ec 01             addl   $0x1,-0x14(%ebp)
 804885b:       8b 45 ec                mov    -0x14(%ebp),%eax
 804885e:       3b 45 f4                cmp    -0xc(%ebp),%eax
level06@OverRide:~$ objdump -d /home/users/level06/level06 

/home/users/level06/level06:     file format elf32-i386


Disassembly of section .init:

080484d0 <_init>:
 80484d0:       53                      push   %ebx
 80484d1:       83 ec 08                sub    $0x8,%esp
 80484d4:       e8 00 00 00 00          call   80484d9 <_init+0x9>
 80484d9:       5b                      pop    %ebx
 80484da:       81 c3 1b 1b 00 00       add    $0x1b1b,%ebx
 80484e0:       8b 83 fc ff ff ff       mov    -0x4(%ebx),%eax
 80484e6:       85 c0                   test   %eax,%eax
 80484e8:       74 05                   je     80484ef <_init+0x1f>
 80484ea:       e8 c1 00 00 00          call   80485b0 <__gmon_start__@plt>
 80484ef:       e8 9c 01 00 00          call   8048690 <frame_dummy>
 80484f4:       e8 17 05 00 00          call   8048a10 <__do_global_ctors_aux>
 80484f9:       83 c4 08                add    $0x8,%esp
 80484fc:       5b                      pop    %ebx
 80484fd:       c3                      ret    

Disassembly of section .plt:

08048500 <printf@plt-0x10>:
 8048500:       ff 35 f8 9f 04 08       pushl  0x8049ff8
 8048506:       ff 25 fc 9f 04 08       jmp    *0x8049ffc
 804850c:       00 00                   add    %al,(%eax)
        ...

08048510 <printf@plt>:
 8048510:       ff 25 00 a0 04 08       jmp    *0x804a000
 8048516:       68 00 00 00 00          push   $0x0
 804851b:       e9 e0 ff ff ff          jmp    8048500 <_init+0x30>

08048520 <strcspn@plt>:
 8048520:       ff 25 04 a0 04 08       jmp    *0x804a004
 8048526:       68 08 00 00 00          push   $0x8
 804852b:       e9 d0 ff ff ff          jmp    8048500 <_init+0x30>

08048530 <fflush@plt>:
 8048530:       ff 25 08 a0 04 08       jmp    *0x804a008
 8048536:       68 10 00 00 00          push   $0x10
 804853b:       e9 c0 ff ff ff          jmp    8048500 <_init+0x30>

08048540 <getchar@plt>:
 8048540:       ff 25 0c a0 04 08       jmp    *0x804a00c
 8048546:       68 18 00 00 00          push   $0x18
 804854b:       e9 b0 ff ff ff          jmp    8048500 <_init+0x30>

08048550 <fgets@plt>:
 8048550:       ff 25 10 a0 04 08       jmp    *0x804a010
 8048556:       68 20 00 00 00          push   $0x20
 804855b:       e9 a0 ff ff ff          jmp    8048500 <_init+0x30>

08048560 <signal@plt>:
 8048560:       ff 25 14 a0 04 08       jmp    *0x804a014
 8048566:       68 28 00 00 00          push   $0x28
 804856b:       e9 90 ff ff ff          jmp    8048500 <_init+0x30>

08048570 <alarm@plt>:
 8048570:       ff 25 18 a0 04 08       jmp    *0x804a018
 8048576:       68 30 00 00 00          push   $0x30
 804857b:       e9 80 ff ff ff          jmp    8048500 <_init+0x30>

08048580 <__stack_chk_fail@plt>:
 8048580:       ff 25 1c a0 04 08       jmp    *0x804a01c
 8048586:       68 38 00 00 00          push   $0x38
 804858b:       e9 70 ff ff ff          jmp    8048500 <_init+0x30>

08048590 <puts@plt>:
 8048590:       ff 25 20 a0 04 08       jmp    *0x804a020
 8048596:       68 40 00 00 00          push   $0x40
 804859b:       e9 60 ff ff ff          jmp    8048500 <_init+0x30>

080485a0 <system@plt>:
 80485a0:       ff 25 24 a0 04 08       jmp    *0x804a024
 80485a6:       68 48 00 00 00          push   $0x48
 80485ab:       e9 50 ff ff ff          jmp    8048500 <_init+0x30>

080485b0 <__gmon_start__@plt>:
 80485b0:       ff 25 28 a0 04 08       jmp    *0x804a028
 80485b6:       68 50 00 00 00          push   $0x50
 80485bb:       e9 40 ff ff ff          jmp    8048500 <_init+0x30>

080485c0 <__libc_start_main@plt>:
 80485c0:       ff 25 2c a0 04 08       jmp    *0x804a02c
 80485c6:       68 58 00 00 00          push   $0x58
 80485cb:       e9 30 ff ff ff          jmp    8048500 <_init+0x30>

080485d0 <strnlen@plt>:
 80485d0:       ff 25 30 a0 04 08       jmp    *0x804a030
 80485d6:       68 60 00 00 00          push   $0x60
 80485db:       e9 20 ff ff ff          jmp    8048500 <_init+0x30>

080485e0 <__isoc99_scanf@plt>:
 80485e0:       ff 25 34 a0 04 08       jmp    *0x804a034
 80485e6:       68 68 00 00 00          push   $0x68
 80485eb:       e9 10 ff ff ff          jmp    8048500 <_init+0x30>

080485f0 <ptrace@plt>:
 80485f0:       ff 25 38 a0 04 08       jmp    *0x804a038
 80485f6:       68 70 00 00 00          push   $0x70
 80485fb:       e9 00 ff ff ff          jmp    8048500 <_init+0x30>

Disassembly of section .text:

08048600 <_start>:
 8048600:       31 ed                   xor    %ebp,%ebp
 8048602:       5e                      pop    %esi
 8048603:       89 e1                   mov    %esp,%ecx
 8048605:       83 e4 f0                and    $0xfffffff0,%esp
 8048608:       50                      push   %eax
 8048609:       54                      push   %esp
 804860a:       52                      push   %edx
 804860b:       68 00 8a 04 08          push   $0x8048a00
 8048610:       68 90 89 04 08          push   $0x8048990
 8048615:       51                      push   %ecx
 8048616:       56                      push   %esi
 8048617:       68 79 88 04 08          push   $0x8048879
 804861c:       e8 9f ff ff ff          call   80485c0 <__libc_start_main@plt>
 8048621:       f4                      hlt    
 8048622:       90                      nop
 8048623:       90                      nop
 8048624:       90                      nop
 8048625:       90                      nop
 8048626:       90                      nop
 8048627:       90                      nop
 8048628:       90                      nop
 8048629:       90                      nop
 804862a:       90                      nop
 804862b:       90                      nop
 804862c:       90                      nop
 804862d:       90                      nop
 804862e:       90                      nop
 804862f:       90                      nop

08048630 <__do_global_dtors_aux>:
 8048630:       55                      push   %ebp
 8048631:       89 e5                   mov    %esp,%ebp
 8048633:       53                      push   %ebx
 8048634:       83 ec 04                sub    $0x4,%esp
 8048637:       80 3d 84 a0 04 08 00    cmpb   $0x0,0x804a084
 804863e:       75 3f                   jne    804867f <__do_global_dtors_aux+0x4f>
 8048640:       a1 88 a0 04 08          mov    0x804a088,%eax
 8048645:       bb 10 9f 04 08          mov    $0x8049f10,%ebx
 804864a:       81 eb 0c 9f 04 08       sub    $0x8049f0c,%ebx
 8048650:       c1 fb 02                sar    $0x2,%ebx
 8048653:       83 eb 01                sub    $0x1,%ebx
 8048656:       39 d8                   cmp    %ebx,%eax
 8048658:       73 1e                   jae    8048678 <__do_global_dtors_aux+0x48>
 804865a:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
 8048660:       83 c0 01                add    $0x1,%eax
 8048663:       a3 88 a0 04 08          mov    %eax,0x804a088
 8048668:       ff 14 85 0c 9f 04 08    call   *0x8049f0c(,%eax,4)
 804866f:       a1 88 a0 04 08          mov    0x804a088,%eax
 8048674:       39 d8                   cmp    %ebx,%eax
 8048676:       72 e8                   jb     8048660 <__do_global_dtors_aux+0x30>
 8048678:       c6 05 84 a0 04 08 01    movb   $0x1,0x804a084
 804867f:       83 c4 04                add    $0x4,%esp
 8048682:       5b                      pop    %ebx
 8048683:       5d                      pop    %ebp
 8048684:       c3                      ret    
 8048685:       8d 74 26 00             lea    0x0(%esi,%eiz,1),%esi
 8048689:       8d bc 27 00 00 00 00    lea    0x0(%edi,%eiz,1),%edi

08048690 <frame_dummy>:
 8048690:       55                      push   %ebp
 8048691:       89 e5                   mov    %esp,%ebp
 8048693:       83 ec 18                sub    $0x18,%esp
 8048696:       a1 14 9f 04 08          mov    0x8049f14,%eax
 804869b:       85 c0                   test   %eax,%eax
 804869d:       74 12                   je     80486b1 <frame_dummy+0x21>
 804869f:       b8 00 00 00 00          mov    $0x0,%eax
 80486a4:       85 c0                   test   %eax,%eax
 80486a6:       74 09                   je     80486b1 <frame_dummy+0x21>
 80486a8:       c7 04 24 14 9f 04 08    movl   $0x8049f14,(%esp)
 80486af:       ff d0                   call   *%eax
 80486b1:       c9                      leave  
 80486b2:       c3                      ret    
 80486b3:       90                      nop

080486b4 <clear_stdin>:
 80486b4:       55                      push   %ebp
 80486b5:       89 e5                   mov    %esp,%ebp
 80486b7:       83 ec 18                sub    $0x18,%esp
 80486ba:       c6 45 f7 00             movb   $0x0,-0x9(%ebp)
 80486be:       eb 01                   jmp    80486c1 <clear_stdin+0xd>
 80486c0:       90                      nop
 80486c1:       e8 7a fe ff ff          call   8048540 <getchar@plt>
 80486c6:       88 45 f7                mov    %al,-0x9(%ebp)
 80486c9:       80 7d f7 0a             cmpb   $0xa,-0x9(%ebp)
 80486cd:       74 06                   je     80486d5 <clear_stdin+0x21>
 80486cf:       80 7d f7 ff             cmpb   $0xff,-0x9(%ebp)
 80486d3:       75 eb                   jne    80486c0 <clear_stdin+0xc>
 80486d5:       c9                      leave  
 80486d6:       c3                      ret    

080486d7 <get_unum>:
 80486d7:       55                      push   %ebp
 80486d8:       89 e5                   mov    %esp,%ebp
 80486da:       83 ec 28                sub    $0x28,%esp
 80486dd:       c7 45 f4 00 00 00 00    movl   $0x0,-0xc(%ebp)
 80486e4:       a1 80 a0 04 08          mov    0x804a080,%eax
 80486e9:       89 04 24                mov    %eax,(%esp)
 80486ec:       e8 3f fe ff ff          call   8048530 <fflush@plt>
 80486f1:       b8 60 8a 04 08          mov    $0x8048a60,%eax
 80486f6:       8d 55 f4                lea    -0xc(%ebp),%edx
 80486f9:       89 54 24 04             mov    %edx,0x4(%esp)
 80486fd:       89 04 24                mov    %eax,(%esp)
 8048700:       e8 db fe ff ff          call   80485e0 <__isoc99_scanf@plt>
 8048705:       e8 aa ff ff ff          call   80486b4 <clear_stdin>
 804870a:       8b 45 f4                mov    -0xc(%ebp),%eax
 804870d:       c9                      leave  
 804870e:       c3                      ret    

0804870f <prog_timeout>:
 804870f:       55                      push   %ebp
 8048710:       89 e5                   mov    %esp,%ebp
 8048712:       b8 01 00 00 00          mov    $0x1,%eax
 8048717:       bb 01 00 00 00          mov    $0x1,%ebx
 804871c:       cd 80                   int    $0x80
 804871e:       5d                      pop    %ebp
 804871f:       c3                      ret    

08048720 <enable_timeout_cons>:
 8048720:       55                      push   %ebp
 8048721:       89 e5                   mov    %esp,%ebp
 8048723:       83 ec 18                sub    $0x18,%esp
 8048726:       c7 44 24 04 0f 87 04    movl   $0x804870f,0x4(%esp)
 804872d:       08 
 804872e:       c7 04 24 0e 00 00 00    movl   $0xe,(%esp)
 8048735:       e8 26 fe ff ff          call   8048560 <signal@plt>
 804873a:       c7 04 24 3c 00 00 00    movl   $0x3c,(%esp)
 8048741:       e8 2a fe ff ff          call   8048570 <alarm@plt>
 8048746:       c9                      leave  
 8048747:       c3                      ret    

08048748 <auth>:
 8048748:       55                      push   %ebp
 8048749:       89 e5                   mov    %esp,%ebp
 804874b:       83 ec 28                sub    $0x28,%esp
 804874e:       c7 44 24 04 63 8a 04    movl   $0x8048a63,0x4(%esp)
 8048755:       08 
 8048756:       8b 45 08                mov    0x8(%ebp),%eax
 8048759:       89 04 24                mov    %eax,(%esp)
 804875c:       e8 bf fd ff ff          call   8048520 <strcspn@plt>
 8048761:       03 45 08                add    0x8(%ebp),%eax
 8048764:       c6 00 00                movb   $0x0,(%eax)
 8048767:       c7 44 24 04 20 00 00    movl   $0x20,0x4(%esp)
 804876e:       00 
 804876f:       8b 45 08                mov    0x8(%ebp),%eax
 8048772:       89 04 24                mov    %eax,(%esp)
 8048775:       e8 56 fe ff ff          call   80485d0 <strnlen@plt>
 804877a:       89 45 f4                mov    %eax,-0xc(%ebp)
 804877d:       50                      push   %eax
 804877e:       31 c0                   xor    %eax,%eax
 8048780:       74 03                   je     8048785 <auth+0x3d>
 8048782:       83 c4 04                add    $0x4,%esp
 8048785:       58                      pop    %eax
 8048786:       83 7d f4 05             cmpl   $0x5,-0xc(%ebp)
 804878a:       7f 0a                   jg     8048796 <auth+0x4e>
 804878c:       b8 01 00 00 00          mov    $0x1,%eax
 8048791:       e9 e1 00 00 00          jmp    8048877 <auth+0x12f>
 8048796:       c7 44 24 0c 00 00 00    movl   $0x0,0xc(%esp)
 804879d:       00 
 804879e:       c7 44 24 08 01 00 00    movl   $0x1,0x8(%esp)
 80487a5:       00 
 80487a6:       c7 44 24 04 00 00 00    movl   $0x0,0x4(%esp)
 80487ad:       00 
 80487ae:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 80487b5:       e8 36 fe ff ff          call   80485f0 <ptrace@plt>
 80487ba:       83 f8 ff                cmp    $0xffffffff,%eax
 80487bd:       75 2e                   jne    80487ed <auth+0xa5>
 80487bf:       c7 04 24 68 8a 04 08    movl   $0x8048a68,(%esp)
 80487c6:       e8 c5 fd ff ff          call   8048590 <puts@plt>
 80487cb:       c7 04 24 8c 8a 04 08    movl   $0x8048a8c,(%esp)
 80487d2:       e8 b9 fd ff ff          call   8048590 <puts@plt>
 80487d7:       c7 04 24 b0 8a 04 08    movl   $0x8048ab0,(%esp)
 80487de:       e8 ad fd ff ff          call   8048590 <puts@plt>
 80487e3:       b8 01 00 00 00          mov    $0x1,%eax
 80487e8:       e9 8a 00 00 00          jmp    8048877 <auth+0x12f>
 80487ed:       8b 45 08                mov    0x8(%ebp),%eax
 80487f0:       83 c0 03                add    $0x3,%eax
 80487f3:       0f b6 00                movzbl (%eax),%eax
 80487f6:       0f be c0                movsbl %al,%eax
 80487f9:       35 37 13 00 00          xor    $0x1337,%eax
 80487fe:       05 ed ed 5e 00          add    $0x5eeded,%eax
 8048803:       89 45 f0                mov    %eax,-0x10(%ebp)
 8048806:       c7 45 ec 00 00 00 00    movl   $0x0,-0x14(%ebp)
 804880d:       eb 4c                   jmp    804885b <auth+0x113>
 804880f:       8b 45 ec                mov    -0x14(%ebp),%eax
 8048812:       03 45 08                add    0x8(%ebp),%eax
 8048815:       0f b6 00                movzbl (%eax),%eax
 8048818:       3c 1f                   cmp    $0x1f,%al
 804881a:       7f 07                   jg     8048823 <auth+0xdb>
 804881c:       b8 01 00 00 00          mov    $0x1,%eax
 8048821:       eb 54                   jmp    8048877 <auth+0x12f>
 8048823:       8b 45 ec                mov    -0x14(%ebp),%eax
 8048826:       03 45 08                add    0x8(%ebp),%eax
 8048829:       0f b6 00                movzbl (%eax),%eax
 804882c:       0f be c0                movsbl %al,%eax
 804882f:       89 c1                   mov    %eax,%ecx
 8048831:       33 4d f0                xor    -0x10(%ebp),%ecx
 8048834:       ba 2b 3b 23 88          mov    $0x88233b2b,%edx
 8048839:       89 c8                   mov    %ecx,%eax
 804883b:       f7 e2                   mul    %edx
 804883d:       89 c8                   mov    %ecx,%eax
 804883f:       29 d0                   sub    %edx,%eax
 8048841:       d1 e8                   shr    %eax
 8048843:       01 d0                   add    %edx,%eax
 8048845:       c1 e8 0a                shr    $0xa,%eax
 8048848:       69 c0 39 05 00 00       imul   $0x539,%eax,%eax
 804884e:       89 ca                   mov    %ecx,%edx
 8048850:       29 c2                   sub    %eax,%edx
 8048852:       89 d0                   mov    %edx,%eax
 8048854:       01 45 f0                add    %eax,-0x10(%ebp)
 8048857:       83 45 ec 01             addl   $0x1,-0x14(%ebp)
 804885b:       8b 45 ec                mov    -0x14(%ebp),%eax
 804885e:       3b 45 f4                cmp    -0xc(%ebp),%eax
 8048861:       7c ac                   jl     804880f <auth+0xc7>
 8048863:       8b 45 0c                mov    0xc(%ebp),%eax
 8048866:       3b 45 f0                cmp    -0x10(%ebp),%eax
 8048869:       74 07                   je     8048872 <auth+0x12a>
 804886b:       b8 01 00 00 00          mov    $0x1,%eax
 8048870:       eb 05                   jmp    8048877 <auth+0x12f>
 8048872:       b8 00 00 00 00          mov    $0x0,%eax
 8048877:       c9                      leave  
 8048878:       c3                      ret    

08048879 <main>:
 8048879:       55                      push   %ebp
 804887a:       89 e5                   mov    %esp,%ebp
 804887c:       83 e4 f0                and    $0xfffffff0,%esp
 804887f:       83 ec 50                sub    $0x50,%esp
 8048882:       8b 45 0c                mov    0xc(%ebp),%eax
 8048885:       89 44 24 1c             mov    %eax,0x1c(%esp)
 8048889:       65 a1 14 00 00 00       mov    %gs:0x14,%eax
 804888f:       89 44 24 4c             mov    %eax,0x4c(%esp)
 8048893:       31 c0                   xor    %eax,%eax
 8048895:       50                      push   %eax
 8048896:       31 c0                   xor    %eax,%eax
 8048898:       74 03                   je     804889d <main+0x24>
 804889a:       83 c4 04                add    $0x4,%esp
 804889d:       58                      pop    %eax
 804889e:       c7 04 24 d4 8a 04 08    movl   $0x8048ad4,(%esp)
 80488a5:       e8 e6 fc ff ff          call   8048590 <puts@plt>
 80488aa:       c7 04 24 f8 8a 04 08    movl   $0x8048af8,(%esp)
 80488b1:       e8 da fc ff ff          call   8048590 <puts@plt>
 80488b6:       c7 04 24 d4 8a 04 08    movl   $0x8048ad4,(%esp)
 80488bd:       e8 ce fc ff ff          call   8048590 <puts@plt>
 80488c2:       b8 08 8b 04 08          mov    $0x8048b08,%eax
 80488c7:       89 04 24                mov    %eax,(%esp)
 80488ca:       e8 41 fc ff ff          call   8048510 <printf@plt>
 80488cf:       a1 60 a0 04 08          mov    0x804a060,%eax
 80488d4:       89 44 24 08             mov    %eax,0x8(%esp)
 80488d8:       c7 44 24 04 20 00 00    movl   $0x20,0x4(%esp)
 80488df:       00 
 80488e0:       8d 44 24 2c             lea    0x2c(%esp),%eax
 80488e4:       89 04 24                mov    %eax,(%esp)
 80488e7:       e8 64 fc ff ff          call   8048550 <fgets@plt>
 80488ec:       c7 04 24 d4 8a 04 08    movl   $0x8048ad4,(%esp)
 80488f3:       e8 98 fc ff ff          call   8048590 <puts@plt>
 80488f8:       c7 04 24 1c 8b 04 08    movl   $0x8048b1c,(%esp)
 80488ff:       e8 8c fc ff ff          call   8048590 <puts@plt>
 8048904:       c7 04 24 d4 8a 04 08    movl   $0x8048ad4,(%esp)
 804890b:       e8 80 fc ff ff          call   8048590 <puts@plt>
 8048910:       b8 40 8b 04 08          mov    $0x8048b40,%eax
 8048915:       89 04 24                mov    %eax,(%esp)
 8048918:       e8 f3 fb ff ff          call   8048510 <printf@plt>
 804891d:       b8 60 8a 04 08          mov    $0x8048a60,%eax
 8048922:       8d 54 24 28             lea    0x28(%esp),%edx
 8048926:       89 54 24 04             mov    %edx,0x4(%esp)
 804892a:       89 04 24                mov    %eax,(%esp)
 804892d:       e8 ae fc ff ff          call   80485e0 <__isoc99_scanf@plt>
 8048932:       8b 44 24 28             mov    0x28(%esp),%eax
 8048936:       89 44 24 04             mov    %eax,0x4(%esp)
 804893a:       8d 44 24 2c             lea    0x2c(%esp),%eax
 804893e:       89 04 24                mov    %eax,(%esp)
 8048941:       e8 02 fe ff ff          call   8048748 <auth>
 8048946:       85 c0                   test   %eax,%eax
 8048948:       75 1f                   jne    8048969 <main+0xf0>
 804894a:       c7 04 24 52 8b 04 08    movl   $0x8048b52,(%esp)
 8048951:       e8 3a fc ff ff          call   8048590 <puts@plt>
 8048956:       c7 04 24 61 8b 04 08    movl   $0x8048b61,(%esp)
 804895d:       e8 3e fc ff ff          call   80485a0 <system@plt>
 8048962:       b8 00 00 00 00          mov    $0x0,%eax
 8048967:       eb 05                   jmp    804896e <main+0xf5>
 8048969:       b8 01 00 00 00          mov    $0x1,%eax
 804896e:       8b 54 24 4c             mov    0x4c(%esp),%edx
 8048972:       65 33 15 14 00 00 00    xor    %gs:0x14,%edx
 8048979:       74 05                   je     8048980 <main+0x107>
 804897b:       e8 00 fc ff ff          call   8048580 <__stack_chk_fail@plt>
 8048980:       c9                      leave  
 8048981:       c3                      ret    
 8048982:       90                      nop
 8048983:       90                      nop
 8048984:       90                      nop
 8048985:       90                      nop
 8048986:       90                      nop
 8048987:       90                      nop
 8048988:       90                      nop
 8048989:       90                      nop
 804898a:       90                      nop
 804898b:       90                      nop
 804898c:       90                      nop
 804898d:       90                      nop
 804898e:       90                      nop
 804898f:       90                      nop

08048990 <__libc_csu_init>:
 8048990:       55                      push   %ebp
 8048991:       57                      push   %edi
 8048992:       56                      push   %esi
 8048993:       53                      push   %ebx
 8048994:       e8 69 00 00 00          call   8048a02 <__i686.get_pc_thunk.bx>
 8048999:       81 c3 5b 16 00 00       add    $0x165b,%ebx
 804899f:       83 ec 1c                sub    $0x1c,%esp
 80489a2:       8b 6c 24 30             mov    0x30(%esp),%ebp
 80489a6:       8d bb 10 ff ff ff       lea    -0xf0(%ebx),%edi
 80489ac:       e8 1f fb ff ff          call   80484d0 <_init>
 80489b1:       8d 83 0c ff ff ff       lea    -0xf4(%ebx),%eax
 80489b7:       29 c7                   sub    %eax,%edi
 80489b9:       c1 ff 02                sar    $0x2,%edi
 80489bc:       85 ff                   test   %edi,%edi
 80489be:       74 29                   je     80489e9 <__libc_csu_init+0x59>
 80489c0:       31 f6                   xor    %esi,%esi
 80489c2:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
 80489c8:       8b 44 24 38             mov    0x38(%esp),%eax
 80489cc:       89 2c 24                mov    %ebp,(%esp)
 80489cf:       89 44 24 08             mov    %eax,0x8(%esp)
 80489d3:       8b 44 24 34             mov    0x34(%esp),%eax
 80489d7:       89 44 24 04             mov    %eax,0x4(%esp)
 80489db:       ff 94 b3 0c ff ff ff    call   *-0xf4(%ebx,%esi,4)
 80489e2:       83 c6 01                add    $0x1,%esi
 80489e5:       39 fe                   cmp    %edi,%esi
 80489e7:       75 df                   jne    80489c8 <__libc_csu_init+0x38>
 80489e9:       83 c4 1c                add    $0x1c,%esp
 80489ec:       5b                      pop    %ebx
 80489ed:       5e                      pop    %esi
 80489ee:       5f                      pop    %edi
 80489ef:       5d                      pop    %ebp
 80489f0:       c3                      ret    
 80489f1:       eb 0d                   jmp    8048a00 <__libc_csu_fini>
 80489f3:       90                      nop
 80489f4:       90                      nop
 80489f5:       90                      nop
 80489f6:       90                      nop
 80489f7:       90                      nop
 80489f8:       90                      nop
 80489f9:       90                      nop
 80489fa:       90                      nop
 80489fb:       90                      nop
 80489fc:       90                      nop
 80489fd:       90                      nop
 80489fe:       90                      nop
 80489ff:       90                      nop

08048a00 <__libc_csu_fini>:
 8048a00:       f3 c3                   repz ret 

08048a02 <__i686.get_pc_thunk.bx>:
 8048a02:       8b 1c 24                mov    (%esp),%ebx
 8048a05:       c3                      ret    
 8048a06:       90                      nop
 8048a07:       90                      nop
 8048a08:       90                      nop
 8048a09:       90                      nop
 8048a0a:       90                      nop
 8048a0b:       90                      nop
 8048a0c:       90                      nop
 8048a0d:       90                      nop
 8048a0e:       90                      nop
 8048a0f:       90                      nop

08048a10 <__do_global_ctors_aux>:
 8048a10:       55                      push   %ebp
 8048a11:       89 e5                   mov    %esp,%ebp
 8048a13:       53                      push   %ebx
 8048a14:       83 ec 04                sub    $0x4,%esp
 8048a17:       a1 04 9f 04 08          mov    0x8049f04,%eax
 8048a1c:       83 f8 ff                cmp    $0xffffffff,%eax
 8048a1f:       74 13                   je     8048a34 <__do_global_ctors_aux+0x24>
 8048a21:       bb 04 9f 04 08          mov    $0x8049f04,%ebx
 8048a26:       66 90                   xchg   %ax,%ax
 8048a28:       83 eb 04                sub    $0x4,%ebx
 8048a2b:       ff d0                   call   *%eax
 8048a2d:       8b 03                   mov    (%ebx),%eax
 8048a2f:       83 f8 ff                cmp    $0xffffffff,%eax
 8048a32:       75 f4                   jne    8048a28 <__do_global_ctors_aux+0x18>
 8048a34:       83 c4 04                add    $0x4,%esp
 8048a37:       5b                      pop    %ebx
 8048a38:       5d                      pop    %ebp
 8048a39:       c3                      ret    
 8048a3a:       90                      nop
 8048a3b:       90                      nop

Disassembly of section .fini:

08048a3c <_fini>:
 8048a3c:       53                      push   %ebx
 8048a3d:       83 ec 08                sub    $0x8,%esp
 8048a40:       e8 00 00 00 00          call   8048a45 <_fini+0x9>
 8048a45:       5b                      pop    %ebx
 8048a46:       81 c3 af 15 00 00       add    $0x15af,%ebx
 8048a4c:       e8 df fb ff ff          call   8048630 <__do_global_dtors_aux>
 8048a51:       83 c4 08                add    $0x8,%esp
 8048a54:       5b                      pop    %ebx
 8048a55:       c3                      ret