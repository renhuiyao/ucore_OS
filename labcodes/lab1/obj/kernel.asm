
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 7e 2a 00 00       	call   102aaa <memset>

    cons_init();                // init the console
  10002c:	e8 3f 15 00 00       	call   101570 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 c0 32 10 00 	movl   $0x1032c0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 dc 32 10 00 	movl   $0x1032dc,(%esp)
  100046:	e8 11 02 00 00       	call   10025c <cprintf>

    print_kerninfo();
  10004b:	e8 b2 08 00 00       	call   100902 <print_kerninfo>

    grade_backtrace();
  100050:	e8 89 00 00 00       	call   1000de <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 25 27 00 00       	call   10277f <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 50 16 00 00       	call   1016af <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 b0 17 00 00       	call   101814 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 e8 0c 00 00       	call   100d51 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 7b 17 00 00       	call   1017e9 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 ad 0c 00 00       	call   100d3f <mon_backtrace>
}
  100092:	90                   	nop
  100093:	c9                   	leave  
  100094:	c3                   	ret    

00100095 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100095:	55                   	push   %ebp
  100096:	89 e5                	mov    %esp,%ebp
  100098:	53                   	push   %ebx
  100099:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009f:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a2:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000ac:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b4:	89 04 24             	mov    %eax,(%esp)
  1000b7:	e8 b4 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bc:	90                   	nop
  1000bd:	83 c4 14             	add    $0x14,%esp
  1000c0:	5b                   	pop    %ebx
  1000c1:	5d                   	pop    %ebp
  1000c2:	c3                   	ret    

001000c3 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c3:	55                   	push   %ebp
  1000c4:	89 e5                	mov    %esp,%ebp
  1000c6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d3:	89 04 24             	mov    %eax,(%esp)
  1000d6:	e8 ba ff ff ff       	call   100095 <grade_backtrace1>
}
  1000db:	90                   	nop
  1000dc:	c9                   	leave  
  1000dd:	c3                   	ret    

001000de <grade_backtrace>:

void
grade_backtrace(void) {
  1000de:	55                   	push   %ebp
  1000df:	89 e5                	mov    %esp,%ebp
  1000e1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f0:	ff 
  1000f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fc:	e8 c2 ff ff ff       	call   1000c3 <grade_backtrace0>
}
  100101:	90                   	nop
  100102:	c9                   	leave  
  100103:	c3                   	ret    

00100104 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100104:	55                   	push   %ebp
  100105:	89 e5                	mov    %esp,%ebp
  100107:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010a:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010d:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100110:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100113:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100116:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011a:	83 e0 03             	and    $0x3,%eax
  10011d:	89 c2                	mov    %eax,%edx
  10011f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100124:	89 54 24 08          	mov    %edx,0x8(%esp)
  100128:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012c:	c7 04 24 e1 32 10 00 	movl   $0x1032e1,(%esp)
  100133:	e8 24 01 00 00       	call   10025c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100138:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013c:	89 c2                	mov    %eax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 ef 32 10 00 	movl   $0x1032ef,(%esp)
  100152:	e8 05 01 00 00       	call   10025c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	89 c2                	mov    %eax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	89 54 24 08          	mov    %edx,0x8(%esp)
  100166:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016a:	c7 04 24 fd 32 10 00 	movl   $0x1032fd,(%esp)
  100171:	e8 e6 00 00 00       	call   10025c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100176:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017a:	89 c2                	mov    %eax,%edx
  10017c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100181:	89 54 24 08          	mov    %edx,0x8(%esp)
  100185:	89 44 24 04          	mov    %eax,0x4(%esp)
  100189:	c7 04 24 0b 33 10 00 	movl   $0x10330b,(%esp)
  100190:	e8 c7 00 00 00       	call   10025c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100195:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100199:	89 c2                	mov    %eax,%edx
  10019b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a0:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a8:	c7 04 24 19 33 10 00 	movl   $0x103319,(%esp)
  1001af:	e8 a8 00 00 00       	call   10025c <cprintf>
    round ++;
  1001b4:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001b9:	40                   	inc    %eax
  1001ba:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001bf:	90                   	nop
  1001c0:	c9                   	leave  
  1001c1:	c3                   	ret    

001001c2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c2:	55                   	push   %ebp
  1001c3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c5:	90                   	nop
  1001c6:	5d                   	pop    %ebp
  1001c7:	c3                   	ret    

001001c8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001c8:	55                   	push   %ebp
  1001c9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001cb:	90                   	nop
  1001cc:	5d                   	pop    %ebp
  1001cd:	c3                   	ret    

001001ce <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ce:	55                   	push   %ebp
  1001cf:	89 e5                	mov    %esp,%ebp
  1001d1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d4:	e8 2b ff ff ff       	call   100104 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001d9:	c7 04 24 28 33 10 00 	movl   $0x103328,(%esp)
  1001e0:	e8 77 00 00 00       	call   10025c <cprintf>
    lab1_switch_to_user();
  1001e5:	e8 d8 ff ff ff       	call   1001c2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ea:	e8 15 ff ff ff       	call   100104 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ef:	c7 04 24 48 33 10 00 	movl   $0x103348,(%esp)
  1001f6:	e8 61 00 00 00       	call   10025c <cprintf>
    lab1_switch_to_kernel();
  1001fb:	e8 c8 ff ff ff       	call   1001c8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100200:	e8 ff fe ff ff       	call   100104 <lab1_print_cur_status>
}
  100205:	90                   	nop
  100206:	c9                   	leave  
  100207:	c3                   	ret    

00100208 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100208:	55                   	push   %ebp
  100209:	89 e5                	mov    %esp,%ebp
  10020b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10020e:	8b 45 08             	mov    0x8(%ebp),%eax
  100211:	89 04 24             	mov    %eax,(%esp)
  100214:	e8 84 13 00 00       	call   10159d <cons_putc>
    (*cnt) ++;
  100219:	8b 45 0c             	mov    0xc(%ebp),%eax
  10021c:	8b 00                	mov    (%eax),%eax
  10021e:	8d 50 01             	lea    0x1(%eax),%edx
  100221:	8b 45 0c             	mov    0xc(%ebp),%eax
  100224:	89 10                	mov    %edx,(%eax)
}
  100226:	90                   	nop
  100227:	c9                   	leave  
  100228:	c3                   	ret    

00100229 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100229:	55                   	push   %ebp
  10022a:	89 e5                	mov    %esp,%ebp
  10022c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10022f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100236:	8b 45 0c             	mov    0xc(%ebp),%eax
  100239:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10023d:	8b 45 08             	mov    0x8(%ebp),%eax
  100240:	89 44 24 08          	mov    %eax,0x8(%esp)
  100244:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100247:	89 44 24 04          	mov    %eax,0x4(%esp)
  10024b:	c7 04 24 08 02 10 00 	movl   $0x100208,(%esp)
  100252:	e8 a6 2b 00 00       	call   102dfd <vprintfmt>
    return cnt;
  100257:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10025a:	c9                   	leave  
  10025b:	c3                   	ret    

0010025c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10025c:	55                   	push   %ebp
  10025d:	89 e5                	mov    %esp,%ebp
  10025f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100262:	8d 45 0c             	lea    0xc(%ebp),%eax
  100265:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100268:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10026b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10026f:	8b 45 08             	mov    0x8(%ebp),%eax
  100272:	89 04 24             	mov    %eax,(%esp)
  100275:	e8 af ff ff ff       	call   100229 <vcprintf>
  10027a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10027d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100280:	c9                   	leave  
  100281:	c3                   	ret    

00100282 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100282:	55                   	push   %ebp
  100283:	89 e5                	mov    %esp,%ebp
  100285:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100288:	8b 45 08             	mov    0x8(%ebp),%eax
  10028b:	89 04 24             	mov    %eax,(%esp)
  10028e:	e8 0a 13 00 00       	call   10159d <cons_putc>
}
  100293:	90                   	nop
  100294:	c9                   	leave  
  100295:	c3                   	ret    

00100296 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100296:	55                   	push   %ebp
  100297:	89 e5                	mov    %esp,%ebp
  100299:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10029c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002a3:	eb 13                	jmp    1002b8 <cputs+0x22>
        cputch(c, &cnt);
  1002a5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002a9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002ac:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002b0:	89 04 24             	mov    %eax,(%esp)
  1002b3:	e8 50 ff ff ff       	call   100208 <cputch>
    while ((c = *str ++) != '\0') {
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	8d 50 01             	lea    0x1(%eax),%edx
  1002be:	89 55 08             	mov    %edx,0x8(%ebp)
  1002c1:	0f b6 00             	movzbl (%eax),%eax
  1002c4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002c7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002cb:	75 d8                	jne    1002a5 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002cd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002d4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002db:	e8 28 ff ff ff       	call   100208 <cputch>
    return cnt;
  1002e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002e3:	c9                   	leave  
  1002e4:	c3                   	ret    

001002e5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002e5:	55                   	push   %ebp
  1002e6:	89 e5                	mov    %esp,%ebp
  1002e8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002eb:	e8 d7 12 00 00       	call   1015c7 <cons_getc>
  1002f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002f7:	74 f2                	je     1002eb <getchar+0x6>
        /* do nothing */;
    return c;
  1002f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002fc:	c9                   	leave  
  1002fd:	c3                   	ret    

001002fe <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002fe:	55                   	push   %ebp
  1002ff:	89 e5                	mov    %esp,%ebp
  100301:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100304:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100308:	74 13                	je     10031d <readline+0x1f>
        cprintf("%s", prompt);
  10030a:	8b 45 08             	mov    0x8(%ebp),%eax
  10030d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100311:	c7 04 24 67 33 10 00 	movl   $0x103367,(%esp)
  100318:	e8 3f ff ff ff       	call   10025c <cprintf>
    }
    int i = 0, c;
  10031d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100324:	e8 bc ff ff ff       	call   1002e5 <getchar>
  100329:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10032c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100330:	79 07                	jns    100339 <readline+0x3b>
            return NULL;
  100332:	b8 00 00 00 00       	mov    $0x0,%eax
  100337:	eb 78                	jmp    1003b1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100339:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10033d:	7e 28                	jle    100367 <readline+0x69>
  10033f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100346:	7f 1f                	jg     100367 <readline+0x69>
            cputchar(c);
  100348:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10034b:	89 04 24             	mov    %eax,(%esp)
  10034e:	e8 2f ff ff ff       	call   100282 <cputchar>
            buf[i ++] = c;
  100353:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100356:	8d 50 01             	lea    0x1(%eax),%edx
  100359:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10035c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10035f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100365:	eb 45                	jmp    1003ac <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100367:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10036b:	75 16                	jne    100383 <readline+0x85>
  10036d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100371:	7e 10                	jle    100383 <readline+0x85>
            cputchar(c);
  100373:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100376:	89 04 24             	mov    %eax,(%esp)
  100379:	e8 04 ff ff ff       	call   100282 <cputchar>
            i --;
  10037e:	ff 4d f4             	decl   -0xc(%ebp)
  100381:	eb 29                	jmp    1003ac <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100383:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100387:	74 06                	je     10038f <readline+0x91>
  100389:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10038d:	75 95                	jne    100324 <readline+0x26>
            cputchar(c);
  10038f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100392:	89 04 24             	mov    %eax,(%esp)
  100395:	e8 e8 fe ff ff       	call   100282 <cputchar>
            buf[i] = '\0';
  10039a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10039d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003a2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003a5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003aa:	eb 05                	jmp    1003b1 <readline+0xb3>
        c = getchar();
  1003ac:	e9 73 ff ff ff       	jmp    100324 <readline+0x26>
        }
    }
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003b9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003be:	85 c0                	test   %eax,%eax
  1003c0:	75 5b                	jne    10041d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003c2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003c9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003cc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003dc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003e0:	c7 04 24 6a 33 10 00 	movl   $0x10336a,(%esp)
  1003e7:	e8 70 fe ff ff       	call   10025c <cprintf>
    vcprintf(fmt, ap);
  1003ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f3:	8b 45 10             	mov    0x10(%ebp),%eax
  1003f6:	89 04 24             	mov    %eax,(%esp)
  1003f9:	e8 2b fe ff ff       	call   100229 <vcprintf>
    cprintf("\n");
  1003fe:	c7 04 24 86 33 10 00 	movl   $0x103386,(%esp)
  100405:	e8 52 fe ff ff       	call   10025c <cprintf>
    
    cprintf("stack trackback:\n");
  10040a:	c7 04 24 88 33 10 00 	movl   $0x103388,(%esp)
  100411:	e8 46 fe ff ff       	call   10025c <cprintf>
    print_stackframe();
  100416:	e8 32 06 00 00       	call   100a4d <print_stackframe>
  10041b:	eb 01                	jmp    10041e <__panic+0x6b>
        goto panic_dead;
  10041d:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10041e:	e8 cd 13 00 00       	call   1017f0 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100423:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10042a:	e8 43 08 00 00       	call   100c72 <kmonitor>
  10042f:	eb f2                	jmp    100423 <__panic+0x70>

00100431 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100431:	55                   	push   %ebp
  100432:	89 e5                	mov    %esp,%ebp
  100434:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100437:	8d 45 14             	lea    0x14(%ebp),%eax
  10043a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10043d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100440:	89 44 24 08          	mov    %eax,0x8(%esp)
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	89 44 24 04          	mov    %eax,0x4(%esp)
  10044b:	c7 04 24 9a 33 10 00 	movl   $0x10339a,(%esp)
  100452:	e8 05 fe ff ff       	call   10025c <cprintf>
    vcprintf(fmt, ap);
  100457:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10045a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045e:	8b 45 10             	mov    0x10(%ebp),%eax
  100461:	89 04 24             	mov    %eax,(%esp)
  100464:	e8 c0 fd ff ff       	call   100229 <vcprintf>
    cprintf("\n");
  100469:	c7 04 24 86 33 10 00 	movl   $0x103386,(%esp)
  100470:	e8 e7 fd ff ff       	call   10025c <cprintf>
    va_end(ap);
}
  100475:	90                   	nop
  100476:	c9                   	leave  
  100477:	c3                   	ret    

00100478 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100478:	55                   	push   %ebp
  100479:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10047b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100480:	5d                   	pop    %ebp
  100481:	c3                   	ret    

00100482 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100482:	55                   	push   %ebp
  100483:	89 e5                	mov    %esp,%ebp
  100485:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100488:	8b 45 0c             	mov    0xc(%ebp),%eax
  10048b:	8b 00                	mov    (%eax),%eax
  10048d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100490:	8b 45 10             	mov    0x10(%ebp),%eax
  100493:	8b 00                	mov    (%eax),%eax
  100495:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100498:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10049f:	e9 ca 00 00 00       	jmp    10056e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004aa:	01 d0                	add    %edx,%eax
  1004ac:	89 c2                	mov    %eax,%edx
  1004ae:	c1 ea 1f             	shr    $0x1f,%edx
  1004b1:	01 d0                	add    %edx,%eax
  1004b3:	d1 f8                	sar    %eax
  1004b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004bb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004be:	eb 03                	jmp    1004c3 <stab_binsearch+0x41>
            m --;
  1004c0:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c9:	7c 1f                	jl     1004ea <stab_binsearch+0x68>
  1004cb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ce:	89 d0                	mov    %edx,%eax
  1004d0:	01 c0                	add    %eax,%eax
  1004d2:	01 d0                	add    %edx,%eax
  1004d4:	c1 e0 02             	shl    $0x2,%eax
  1004d7:	89 c2                	mov    %eax,%edx
  1004d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004dc:	01 d0                	add    %edx,%eax
  1004de:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004e2:	0f b6 c0             	movzbl %al,%eax
  1004e5:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004e8:	75 d6                	jne    1004c0 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004f0:	7d 09                	jge    1004fb <stab_binsearch+0x79>
            l = true_m + 1;
  1004f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004f5:	40                   	inc    %eax
  1004f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f9:	eb 73                	jmp    10056e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  1004fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100502:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100505:	89 d0                	mov    %edx,%eax
  100507:	01 c0                	add    %eax,%eax
  100509:	01 d0                	add    %edx,%eax
  10050b:	c1 e0 02             	shl    $0x2,%eax
  10050e:	89 c2                	mov    %eax,%edx
  100510:	8b 45 08             	mov    0x8(%ebp),%eax
  100513:	01 d0                	add    %edx,%eax
  100515:	8b 40 08             	mov    0x8(%eax),%eax
  100518:	39 45 18             	cmp    %eax,0x18(%ebp)
  10051b:	76 11                	jbe    10052e <stab_binsearch+0xac>
            *region_left = m;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100523:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100525:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100528:	40                   	inc    %eax
  100529:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10052c:	eb 40                	jmp    10056e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10052e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100531:	89 d0                	mov    %edx,%eax
  100533:	01 c0                	add    %eax,%eax
  100535:	01 d0                	add    %edx,%eax
  100537:	c1 e0 02             	shl    $0x2,%eax
  10053a:	89 c2                	mov    %eax,%edx
  10053c:	8b 45 08             	mov    0x8(%ebp),%eax
  10053f:	01 d0                	add    %edx,%eax
  100541:	8b 40 08             	mov    0x8(%eax),%eax
  100544:	39 45 18             	cmp    %eax,0x18(%ebp)
  100547:	73 14                	jae    10055d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100549:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10054f:	8b 45 10             	mov    0x10(%ebp),%eax
  100552:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100554:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100557:	48                   	dec    %eax
  100558:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10055b:	eb 11                	jmp    10056e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10055d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100560:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100563:	89 10                	mov    %edx,(%eax)
            l = m;
  100565:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100568:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10056b:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10056e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100571:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100574:	0f 8e 2a ff ff ff    	jle    1004a4 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10057a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10057e:	75 0f                	jne    10058f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100580:	8b 45 0c             	mov    0xc(%ebp),%eax
  100583:	8b 00                	mov    (%eax),%eax
  100585:	8d 50 ff             	lea    -0x1(%eax),%edx
  100588:	8b 45 10             	mov    0x10(%ebp),%eax
  10058b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10058d:	eb 3e                	jmp    1005cd <stab_binsearch+0x14b>
        l = *region_right;
  10058f:	8b 45 10             	mov    0x10(%ebp),%eax
  100592:	8b 00                	mov    (%eax),%eax
  100594:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100597:	eb 03                	jmp    10059c <stab_binsearch+0x11a>
  100599:	ff 4d fc             	decl   -0x4(%ebp)
  10059c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10059f:	8b 00                	mov    (%eax),%eax
  1005a1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005a4:	7e 1f                	jle    1005c5 <stab_binsearch+0x143>
  1005a6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a9:	89 d0                	mov    %edx,%eax
  1005ab:	01 c0                	add    %eax,%eax
  1005ad:	01 d0                	add    %edx,%eax
  1005af:	c1 e0 02             	shl    $0x2,%eax
  1005b2:	89 c2                	mov    %eax,%edx
  1005b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b7:	01 d0                	add    %edx,%eax
  1005b9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005bd:	0f b6 c0             	movzbl %al,%eax
  1005c0:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005c3:	75 d4                	jne    100599 <stab_binsearch+0x117>
        *region_left = l;
  1005c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005cb:	89 10                	mov    %edx,(%eax)
}
  1005cd:	90                   	nop
  1005ce:	c9                   	leave  
  1005cf:	c3                   	ret    

001005d0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005d0:	55                   	push   %ebp
  1005d1:	89 e5                	mov    %esp,%ebp
  1005d3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d9:	c7 00 b8 33 10 00    	movl   $0x1033b8,(%eax)
    info->eip_line = 0;
  1005df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	c7 40 08 b8 33 10 00 	movl   $0x1033b8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f6:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100600:	8b 55 08             	mov    0x8(%ebp),%edx
  100603:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100606:	8b 45 0c             	mov    0xc(%ebp),%eax
  100609:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100610:	c7 45 f4 cc 3b 10 00 	movl   $0x103bcc,-0xc(%ebp)
    stab_end = __STAB_END__;
  100617:	c7 45 f0 10 b8 10 00 	movl   $0x10b810,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10061e:	c7 45 ec 11 b8 10 00 	movl   $0x10b811,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100625:	c7 45 e8 ed d8 10 00 	movl   $0x10d8ed,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10062c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10062f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100632:	76 0b                	jbe    10063f <debuginfo_eip+0x6f>
  100634:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100637:	48                   	dec    %eax
  100638:	0f b6 00             	movzbl (%eax),%eax
  10063b:	84 c0                	test   %al,%al
  10063d:	74 0a                	je     100649 <debuginfo_eip+0x79>
        return -1;
  10063f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100644:	e9 b7 02 00 00       	jmp    100900 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100649:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100650:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100653:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100656:	29 c2                	sub    %eax,%edx
  100658:	89 d0                	mov    %edx,%eax
  10065a:	c1 f8 02             	sar    $0x2,%eax
  10065d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100663:	48                   	dec    %eax
  100664:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100667:	8b 45 08             	mov    0x8(%ebp),%eax
  10066a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10066e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100675:	00 
  100676:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100679:	89 44 24 08          	mov    %eax,0x8(%esp)
  10067d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100680:	89 44 24 04          	mov    %eax,0x4(%esp)
  100684:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100687:	89 04 24             	mov    %eax,(%esp)
  10068a:	e8 f3 fd ff ff       	call   100482 <stab_binsearch>
    if (lfile == 0)
  10068f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100692:	85 c0                	test   %eax,%eax
  100694:	75 0a                	jne    1006a0 <debuginfo_eip+0xd0>
        return -1;
  100696:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10069b:	e9 60 02 00 00       	jmp    100900 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1006af:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006b3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ba:	00 
  1006bb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006be:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006c2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006c5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006cc:	89 04 24             	mov    %eax,(%esp)
  1006cf:	e8 ae fd ff ff       	call   100482 <stab_binsearch>

    if (lfun <= rfun) {
  1006d4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006da:	39 c2                	cmp    %eax,%edx
  1006dc:	7f 7c                	jg     10075a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006de:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006e1:	89 c2                	mov    %eax,%edx
  1006e3:	89 d0                	mov    %edx,%eax
  1006e5:	01 c0                	add    %eax,%eax
  1006e7:	01 d0                	add    %edx,%eax
  1006e9:	c1 e0 02             	shl    $0x2,%eax
  1006ec:	89 c2                	mov    %eax,%edx
  1006ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f1:	01 d0                	add    %edx,%eax
  1006f3:	8b 00                	mov    (%eax),%eax
  1006f5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006fb:	29 d1                	sub    %edx,%ecx
  1006fd:	89 ca                	mov    %ecx,%edx
  1006ff:	39 d0                	cmp    %edx,%eax
  100701:	73 22                	jae    100725 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100703:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100706:	89 c2                	mov    %eax,%edx
  100708:	89 d0                	mov    %edx,%eax
  10070a:	01 c0                	add    %eax,%eax
  10070c:	01 d0                	add    %edx,%eax
  10070e:	c1 e0 02             	shl    $0x2,%eax
  100711:	89 c2                	mov    %eax,%edx
  100713:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100716:	01 d0                	add    %edx,%eax
  100718:	8b 10                	mov    (%eax),%edx
  10071a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10071d:	01 c2                	add    %eax,%edx
  10071f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100722:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100725:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100728:	89 c2                	mov    %eax,%edx
  10072a:	89 d0                	mov    %edx,%eax
  10072c:	01 c0                	add    %eax,%eax
  10072e:	01 d0                	add    %edx,%eax
  100730:	c1 e0 02             	shl    $0x2,%eax
  100733:	89 c2                	mov    %eax,%edx
  100735:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100738:	01 d0                	add    %edx,%eax
  10073a:	8b 50 08             	mov    0x8(%eax),%edx
  10073d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100740:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100743:	8b 45 0c             	mov    0xc(%ebp),%eax
  100746:	8b 40 10             	mov    0x10(%eax),%eax
  100749:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100752:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100755:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100758:	eb 15                	jmp    10076f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	8b 55 08             	mov    0x8(%ebp),%edx
  100760:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100763:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100766:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100769:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10076c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10076f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100772:	8b 40 08             	mov    0x8(%eax),%eax
  100775:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10077c:	00 
  10077d:	89 04 24             	mov    %eax,(%esp)
  100780:	e8 a1 21 00 00       	call   102926 <strfind>
  100785:	89 c2                	mov    %eax,%edx
  100787:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078a:	8b 40 08             	mov    0x8(%eax),%eax
  10078d:	29 c2                	sub    %eax,%edx
  10078f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100792:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100795:	8b 45 08             	mov    0x8(%ebp),%eax
  100798:	89 44 24 10          	mov    %eax,0x10(%esp)
  10079c:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007a3:	00 
  1007a4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007a7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007ab:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b5:	89 04 24             	mov    %eax,(%esp)
  1007b8:	e8 c5 fc ff ff       	call   100482 <stab_binsearch>
    if (lline <= rline) {
  1007bd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007c3:	39 c2                	cmp    %eax,%edx
  1007c5:	7f 23                	jg     1007ea <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007ca:	89 c2                	mov    %eax,%edx
  1007cc:	89 d0                	mov    %edx,%eax
  1007ce:	01 c0                	add    %eax,%eax
  1007d0:	01 d0                	add    %edx,%eax
  1007d2:	c1 e0 02             	shl    $0x2,%eax
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007da:	01 d0                	add    %edx,%eax
  1007dc:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007e0:	89 c2                	mov    %eax,%edx
  1007e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007e8:	eb 11                	jmp    1007fb <debuginfo_eip+0x22b>
        return -1;
  1007ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ef:	e9 0c 01 00 00       	jmp    100900 <debuginfo_eip+0x330>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f7:	48                   	dec    %eax
  1007f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  1007fb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100801:	39 c2                	cmp    %eax,%edx
  100803:	7c 56                	jl     10085b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100805:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100808:	89 c2                	mov    %eax,%edx
  10080a:	89 d0                	mov    %edx,%eax
  10080c:	01 c0                	add    %eax,%eax
  10080e:	01 d0                	add    %edx,%eax
  100810:	c1 e0 02             	shl    $0x2,%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100818:	01 d0                	add    %edx,%eax
  10081a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10081e:	3c 84                	cmp    $0x84,%al
  100820:	74 39                	je     10085b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c 64                	cmp    $0x64,%al
  10083d:	75 b5                	jne    1007f4 <debuginfo_eip+0x224>
  10083f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100842:	89 c2                	mov    %eax,%edx
  100844:	89 d0                	mov    %edx,%eax
  100846:	01 c0                	add    %eax,%eax
  100848:	01 d0                	add    %edx,%eax
  10084a:	c1 e0 02             	shl    $0x2,%eax
  10084d:	89 c2                	mov    %eax,%edx
  10084f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100852:	01 d0                	add    %edx,%eax
  100854:	8b 40 08             	mov    0x8(%eax),%eax
  100857:	85 c0                	test   %eax,%eax
  100859:	74 99                	je     1007f4 <debuginfo_eip+0x224>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10085b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10085e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100861:	39 c2                	cmp    %eax,%edx
  100863:	7c 46                	jl     1008ab <debuginfo_eip+0x2db>
  100865:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100868:	89 c2                	mov    %eax,%edx
  10086a:	89 d0                	mov    %edx,%eax
  10086c:	01 c0                	add    %eax,%eax
  10086e:	01 d0                	add    %edx,%eax
  100870:	c1 e0 02             	shl    $0x2,%eax
  100873:	89 c2                	mov    %eax,%edx
  100875:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100878:	01 d0                	add    %edx,%eax
  10087a:	8b 00                	mov    (%eax),%eax
  10087c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10087f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100882:	29 d1                	sub    %edx,%ecx
  100884:	89 ca                	mov    %ecx,%edx
  100886:	39 d0                	cmp    %edx,%eax
  100888:	73 21                	jae    1008ab <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10088a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088d:	89 c2                	mov    %eax,%edx
  10088f:	89 d0                	mov    %edx,%eax
  100891:	01 c0                	add    %eax,%eax
  100893:	01 d0                	add    %edx,%eax
  100895:	c1 e0 02             	shl    $0x2,%eax
  100898:	89 c2                	mov    %eax,%edx
  10089a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089d:	01 d0                	add    %edx,%eax
  10089f:	8b 10                	mov    (%eax),%edx
  1008a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008a4:	01 c2                	add    %eax,%edx
  1008a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008ab:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008b1:	39 c2                	cmp    %eax,%edx
  1008b3:	7d 46                	jge    1008fb <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008b8:	40                   	inc    %eax
  1008b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008bc:	eb 16                	jmp    1008d4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008c1:	8b 40 14             	mov    0x14(%eax),%eax
  1008c4:	8d 50 01             	lea    0x1(%eax),%edx
  1008c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ca:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d0:	40                   	inc    %eax
  1008d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008d4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008da:	39 c2                	cmp    %eax,%edx
  1008dc:	7d 1d                	jge    1008fb <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e1:	89 c2                	mov    %eax,%edx
  1008e3:	89 d0                	mov    %edx,%eax
  1008e5:	01 c0                	add    %eax,%eax
  1008e7:	01 d0                	add    %edx,%eax
  1008e9:	c1 e0 02             	shl    $0x2,%eax
  1008ec:	89 c2                	mov    %eax,%edx
  1008ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f1:	01 d0                	add    %edx,%eax
  1008f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008f7:	3c a0                	cmp    $0xa0,%al
  1008f9:	74 c3                	je     1008be <debuginfo_eip+0x2ee>
        }
    }
    return 0;
  1008fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100900:	c9                   	leave  
  100901:	c3                   	ret    

00100902 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100902:	55                   	push   %ebp
  100903:	89 e5                	mov    %esp,%ebp
  100905:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100908:	c7 04 24 c2 33 10 00 	movl   $0x1033c2,(%esp)
  10090f:	e8 48 f9 ff ff       	call   10025c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100914:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10091b:	00 
  10091c:	c7 04 24 db 33 10 00 	movl   $0x1033db,(%esp)
  100923:	e8 34 f9 ff ff       	call   10025c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100928:	c7 44 24 04 a4 32 10 	movl   $0x1032a4,0x4(%esp)
  10092f:	00 
  100930:	c7 04 24 f3 33 10 00 	movl   $0x1033f3,(%esp)
  100937:	e8 20 f9 ff ff       	call   10025c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10093c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100943:	00 
  100944:	c7 04 24 0b 34 10 00 	movl   $0x10340b,(%esp)
  10094b:	e8 0c f9 ff ff       	call   10025c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100950:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100957:	00 
  100958:	c7 04 24 23 34 10 00 	movl   $0x103423,(%esp)
  10095f:	e8 f8 f8 ff ff       	call   10025c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100964:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100969:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10096f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100974:	29 c2                	sub    %eax,%edx
  100976:	89 d0                	mov    %edx,%eax
  100978:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097e:	85 c0                	test   %eax,%eax
  100980:	0f 48 c2             	cmovs  %edx,%eax
  100983:	c1 f8 0a             	sar    $0xa,%eax
  100986:	89 44 24 04          	mov    %eax,0x4(%esp)
  10098a:	c7 04 24 3c 34 10 00 	movl   $0x10343c,(%esp)
  100991:	e8 c6 f8 ff ff       	call   10025c <cprintf>
}
  100996:	90                   	nop
  100997:	c9                   	leave  
  100998:	c3                   	ret    

00100999 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100999:	55                   	push   %ebp
  10099a:	89 e5                	mov    %esp,%ebp
  10099c:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009a2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ac:	89 04 24             	mov    %eax,(%esp)
  1009af:	e8 1c fc ff ff       	call   1005d0 <debuginfo_eip>
  1009b4:	85 c0                	test   %eax,%eax
  1009b6:	74 15                	je     1009cd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009bf:	c7 04 24 66 34 10 00 	movl   $0x103466,(%esp)
  1009c6:	e8 91 f8 ff ff       	call   10025c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009cb:	eb 6c                	jmp    100a39 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009d4:	eb 1b                	jmp    1009f1 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009dc:	01 d0                	add    %edx,%eax
  1009de:	0f b6 00             	movzbl (%eax),%eax
  1009e1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009ea:	01 ca                	add    %ecx,%edx
  1009ec:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ee:	ff 45 f4             	incl   -0xc(%ebp)
  1009f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1009f7:	7c dd                	jl     1009d6 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  1009f9:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a02:	01 d0                	add    %edx,%eax
  100a04:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a07:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a0a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a0d:	89 d1                	mov    %edx,%ecx
  100a0f:	29 c1                	sub    %eax,%ecx
  100a11:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a14:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a17:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a1b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a21:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a25:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a29:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a2d:	c7 04 24 82 34 10 00 	movl   $0x103482,(%esp)
  100a34:	e8 23 f8 ff ff       	call   10025c <cprintf>
}
  100a39:	90                   	nop
  100a3a:	c9                   	leave  
  100a3b:	c3                   	ret    

00100a3c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a3c:	55                   	push   %ebp
  100a3d:	89 e5                	mov    %esp,%ebp
  100a3f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a42:	8b 45 04             	mov    0x4(%ebp),%eax
  100a45:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a48:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a4b:	c9                   	leave  
  100a4c:	c3                   	ret    

00100a4d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a4d:	55                   	push   %ebp
  100a4e:	89 e5                	mov    %esp,%ebp
  100a50:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a53:	89 e8                	mov    %ebp,%eax
  100a55:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a58:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(); //(1)
  100a5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip = read_eip(); //(2)
  100a5e:	e8 d9 ff ff ff       	call   100a3c <read_eip>
  100a63:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++){
  100a66:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a6d:	e9 81 00 00 00       	jmp    100af3 <print_stackframe+0xa6>
    	cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip); //(3.1) 
  100a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a75:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a80:	c7 04 24 94 34 10 00 	movl   $0x103494,(%esp)
  100a87:	e8 d0 f7 ff ff       	call   10025c <cprintf>
    	uint32_t *calling_arguments = (uint32_t *) ebp; 
  100a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    	for(int j=0;j<4;j++){
  100a92:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a99:	eb 24                	jmp    100abf <print_stackframe+0x72>
    		cprintf(" 0x%08x ", calling_arguments[j]); //(3.2)
  100a9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a9e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aa5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100aa8:	01 d0                	add    %edx,%eax
  100aaa:	8b 00                	mov    (%eax),%eax
  100aac:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ab0:	c7 04 24 b0 34 10 00 	movl   $0x1034b0,(%esp)
  100ab7:	e8 a0 f7 ff ff       	call   10025c <cprintf>
    	for(int j=0;j<4;j++){
  100abc:	ff 45 e8             	incl   -0x18(%ebp)
  100abf:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100ac3:	7e d6                	jle    100a9b <print_stackframe+0x4e>
		}
		cprintf("\n"); //(3.3)
  100ac5:	c7 04 24 b9 34 10 00 	movl   $0x1034b9,(%esp)
  100acc:	e8 8b f7 ff ff       	call   10025c <cprintf>
		print_debuginfo(eip-1); //(3.4)
  100ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ad4:	48                   	dec    %eax
  100ad5:	89 04 24             	mov    %eax,(%esp)
  100ad8:	e8 bc fe ff ff       	call   100999 <print_debuginfo>
    	eip = ((uint32_t *)ebp)[1]; 
  100add:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae0:	83 c0 04             	add    $0x4,%eax
  100ae3:	8b 00                	mov    (%eax),%eax
  100ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    	ebp = ((uint32_t *)ebp)[0]; //(3.5)
  100ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aeb:	8b 00                	mov    (%eax),%eax
  100aed:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++){
  100af0:	ff 45 ec             	incl   -0x14(%ebp)
  100af3:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100af7:	7f 0a                	jg     100b03 <print_stackframe+0xb6>
  100af9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100afd:	0f 85 6f ff ff ff    	jne    100a72 <print_stackframe+0x25>
	}
}
  100b03:	90                   	nop
  100b04:	c9                   	leave  
  100b05:	c3                   	ret    

00100b06 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b06:	55                   	push   %ebp
  100b07:	89 e5                	mov    %esp,%ebp
  100b09:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b13:	eb 0c                	jmp    100b21 <parse+0x1b>
            *buf ++ = '\0';
  100b15:	8b 45 08             	mov    0x8(%ebp),%eax
  100b18:	8d 50 01             	lea    0x1(%eax),%edx
  100b1b:	89 55 08             	mov    %edx,0x8(%ebp)
  100b1e:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b21:	8b 45 08             	mov    0x8(%ebp),%eax
  100b24:	0f b6 00             	movzbl (%eax),%eax
  100b27:	84 c0                	test   %al,%al
  100b29:	74 1d                	je     100b48 <parse+0x42>
  100b2b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2e:	0f b6 00             	movzbl (%eax),%eax
  100b31:	0f be c0             	movsbl %al,%eax
  100b34:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b38:	c7 04 24 3c 35 10 00 	movl   $0x10353c,(%esp)
  100b3f:	e8 b0 1d 00 00       	call   1028f4 <strchr>
  100b44:	85 c0                	test   %eax,%eax
  100b46:	75 cd                	jne    100b15 <parse+0xf>
        }
        if (*buf == '\0') {
  100b48:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4b:	0f b6 00             	movzbl (%eax),%eax
  100b4e:	84 c0                	test   %al,%al
  100b50:	74 65                	je     100bb7 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b52:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b56:	75 14                	jne    100b6c <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b58:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b5f:	00 
  100b60:	c7 04 24 41 35 10 00 	movl   $0x103541,(%esp)
  100b67:	e8 f0 f6 ff ff       	call   10025c <cprintf>
        }
        argv[argc ++] = buf;
  100b6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b6f:	8d 50 01             	lea    0x1(%eax),%edx
  100b72:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b75:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b7f:	01 c2                	add    %eax,%edx
  100b81:	8b 45 08             	mov    0x8(%ebp),%eax
  100b84:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b86:	eb 03                	jmp    100b8b <parse+0x85>
            buf ++;
  100b88:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8e:	0f b6 00             	movzbl (%eax),%eax
  100b91:	84 c0                	test   %al,%al
  100b93:	74 8c                	je     100b21 <parse+0x1b>
  100b95:	8b 45 08             	mov    0x8(%ebp),%eax
  100b98:	0f b6 00             	movzbl (%eax),%eax
  100b9b:	0f be c0             	movsbl %al,%eax
  100b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba2:	c7 04 24 3c 35 10 00 	movl   $0x10353c,(%esp)
  100ba9:	e8 46 1d 00 00       	call   1028f4 <strchr>
  100bae:	85 c0                	test   %eax,%eax
  100bb0:	74 d6                	je     100b88 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bb2:	e9 6a ff ff ff       	jmp    100b21 <parse+0x1b>
            break;
  100bb7:	90                   	nop
        }
    }
    return argc;
  100bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bbb:	c9                   	leave  
  100bbc:	c3                   	ret    

00100bbd <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bbd:	55                   	push   %ebp
  100bbe:	89 e5                	mov    %esp,%ebp
  100bc0:	53                   	push   %ebx
  100bc1:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bc4:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bcb:	8b 45 08             	mov    0x8(%ebp),%eax
  100bce:	89 04 24             	mov    %eax,(%esp)
  100bd1:	e8 30 ff ff ff       	call   100b06 <parse>
  100bd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bdd:	75 0a                	jne    100be9 <runcmd+0x2c>
        return 0;
  100bdf:	b8 00 00 00 00       	mov    $0x0,%eax
  100be4:	e9 83 00 00 00       	jmp    100c6c <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100be9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bf0:	eb 5a                	jmp    100c4c <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bf2:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf8:	89 d0                	mov    %edx,%eax
  100bfa:	01 c0                	add    %eax,%eax
  100bfc:	01 d0                	add    %edx,%eax
  100bfe:	c1 e0 02             	shl    $0x2,%eax
  100c01:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c06:	8b 00                	mov    (%eax),%eax
  100c08:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c0c:	89 04 24             	mov    %eax,(%esp)
  100c0f:	e8 43 1c 00 00       	call   102857 <strcmp>
  100c14:	85 c0                	test   %eax,%eax
  100c16:	75 31                	jne    100c49 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c18:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c1b:	89 d0                	mov    %edx,%eax
  100c1d:	01 c0                	add    %eax,%eax
  100c1f:	01 d0                	add    %edx,%eax
  100c21:	c1 e0 02             	shl    $0x2,%eax
  100c24:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c29:	8b 10                	mov    (%eax),%edx
  100c2b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c2e:	83 c0 04             	add    $0x4,%eax
  100c31:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c34:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c3a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c42:	89 1c 24             	mov    %ebx,(%esp)
  100c45:	ff d2                	call   *%edx
  100c47:	eb 23                	jmp    100c6c <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c49:	ff 45 f4             	incl   -0xc(%ebp)
  100c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c4f:	83 f8 02             	cmp    $0x2,%eax
  100c52:	76 9e                	jbe    100bf2 <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c54:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c57:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c5b:	c7 04 24 5f 35 10 00 	movl   $0x10355f,(%esp)
  100c62:	e8 f5 f5 ff ff       	call   10025c <cprintf>
    return 0;
  100c67:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c6c:	83 c4 64             	add    $0x64,%esp
  100c6f:	5b                   	pop    %ebx
  100c70:	5d                   	pop    %ebp
  100c71:	c3                   	ret    

00100c72 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c72:	55                   	push   %ebp
  100c73:	89 e5                	mov    %esp,%ebp
  100c75:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c78:	c7 04 24 78 35 10 00 	movl   $0x103578,(%esp)
  100c7f:	e8 d8 f5 ff ff       	call   10025c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c84:	c7 04 24 a0 35 10 00 	movl   $0x1035a0,(%esp)
  100c8b:	e8 cc f5 ff ff       	call   10025c <cprintf>

    if (tf != NULL) {
  100c90:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c94:	74 0b                	je     100ca1 <kmonitor+0x2f>
        print_trapframe(tf);
  100c96:	8b 45 08             	mov    0x8(%ebp),%eax
  100c99:	89 04 24             	mov    %eax,(%esp)
  100c9c:	e8 bf 0b 00 00       	call   101860 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100ca1:	c7 04 24 c5 35 10 00 	movl   $0x1035c5,(%esp)
  100ca8:	e8 51 f6 ff ff       	call   1002fe <readline>
  100cad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cb0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cb4:	74 eb                	je     100ca1 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100cb6:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc0:	89 04 24             	mov    %eax,(%esp)
  100cc3:	e8 f5 fe ff ff       	call   100bbd <runcmd>
  100cc8:	85 c0                	test   %eax,%eax
  100cca:	78 02                	js     100cce <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100ccc:	eb d3                	jmp    100ca1 <kmonitor+0x2f>
                break;
  100cce:	90                   	nop
            }
        }
    }
}
  100ccf:	90                   	nop
  100cd0:	c9                   	leave  
  100cd1:	c3                   	ret    

00100cd2 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cd2:	55                   	push   %ebp
  100cd3:	89 e5                	mov    %esp,%ebp
  100cd5:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cdf:	eb 3d                	jmp    100d1e <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100ce1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ce4:	89 d0                	mov    %edx,%eax
  100ce6:	01 c0                	add    %eax,%eax
  100ce8:	01 d0                	add    %edx,%eax
  100cea:	c1 e0 02             	shl    $0x2,%eax
  100ced:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cf2:	8b 08                	mov    (%eax),%ecx
  100cf4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cf7:	89 d0                	mov    %edx,%eax
  100cf9:	01 c0                	add    %eax,%eax
  100cfb:	01 d0                	add    %edx,%eax
  100cfd:	c1 e0 02             	shl    $0x2,%eax
  100d00:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d05:	8b 00                	mov    (%eax),%eax
  100d07:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d0f:	c7 04 24 c9 35 10 00 	movl   $0x1035c9,(%esp)
  100d16:	e8 41 f5 ff ff       	call   10025c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d1b:	ff 45 f4             	incl   -0xc(%ebp)
  100d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d21:	83 f8 02             	cmp    $0x2,%eax
  100d24:	76 bb                	jbe    100ce1 <mon_help+0xf>
    }
    return 0;
  100d26:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d2b:	c9                   	leave  
  100d2c:	c3                   	ret    

00100d2d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d2d:	55                   	push   %ebp
  100d2e:	89 e5                	mov    %esp,%ebp
  100d30:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d33:	e8 ca fb ff ff       	call   100902 <print_kerninfo>
    return 0;
  100d38:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d3d:	c9                   	leave  
  100d3e:	c3                   	ret    

00100d3f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d3f:	55                   	push   %ebp
  100d40:	89 e5                	mov    %esp,%ebp
  100d42:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d45:	e8 03 fd ff ff       	call   100a4d <print_stackframe>
    return 0;
  100d4a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d4f:	c9                   	leave  
  100d50:	c3                   	ret    

00100d51 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d51:	55                   	push   %ebp
  100d52:	89 e5                	mov    %esp,%ebp
  100d54:	83 ec 28             	sub    $0x28,%esp
  100d57:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d5d:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d61:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d65:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d69:	ee                   	out    %al,(%dx)
  100d6a:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d70:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d74:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d78:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d7c:	ee                   	out    %al,(%dx)
  100d7d:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d83:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100d87:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d8b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d8f:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d90:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d97:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d9a:	c7 04 24 d2 35 10 00 	movl   $0x1035d2,(%esp)
  100da1:	e8 b6 f4 ff ff       	call   10025c <cprintf>
    pic_enable(IRQ_TIMER);
  100da6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dad:	e8 ca 08 00 00       	call   10167c <pic_enable>
}
  100db2:	90                   	nop
  100db3:	c9                   	leave  
  100db4:	c3                   	ret    

00100db5 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100db5:	55                   	push   %ebp
  100db6:	89 e5                	mov    %esp,%ebp
  100db8:	83 ec 10             	sub    $0x10,%esp
  100dbb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dc5:	89 c2                	mov    %eax,%edx
  100dc7:	ec                   	in     (%dx),%al
  100dc8:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dcb:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dd1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dd5:	89 c2                	mov    %eax,%edx
  100dd7:	ec                   	in     (%dx),%al
  100dd8:	88 45 f5             	mov    %al,-0xb(%ebp)
  100ddb:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100de1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100de5:	89 c2                	mov    %eax,%edx
  100de7:	ec                   	in     (%dx),%al
  100de8:	88 45 f9             	mov    %al,-0x7(%ebp)
  100deb:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100df1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100df5:	89 c2                	mov    %eax,%edx
  100df7:	ec                   	in     (%dx),%al
  100df8:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dfb:	90                   	nop
  100dfc:	c9                   	leave  
  100dfd:	c3                   	ret    

00100dfe <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dfe:	55                   	push   %ebp
  100dff:	89 e5                	mov    %esp,%ebp
  100e01:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e04:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0e:	0f b7 00             	movzwl (%eax),%eax
  100e11:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e18:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e20:	0f b7 00             	movzwl (%eax),%eax
  100e23:	0f b7 c0             	movzwl %ax,%eax
  100e26:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e2b:	74 12                	je     100e3f <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e2d:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e34:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e3b:	b4 03 
  100e3d:	eb 13                	jmp    100e52 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e42:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e46:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e49:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e50:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e52:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e59:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e5d:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e61:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e65:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e69:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e6a:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e71:	40                   	inc    %eax
  100e72:	0f b7 c0             	movzwl %ax,%eax
  100e75:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e79:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e7d:	89 c2                	mov    %eax,%edx
  100e7f:	ec                   	in     (%dx),%al
  100e80:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e83:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e87:	0f b6 c0             	movzbl %al,%eax
  100e8a:	c1 e0 08             	shl    $0x8,%eax
  100e8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e90:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e97:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e9b:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e9f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ea3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ea7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ea8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eaf:	40                   	inc    %eax
  100eb0:	0f b7 c0             	movzwl %ax,%eax
  100eb3:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eb7:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ebb:	89 c2                	mov    %eax,%edx
  100ebd:	ec                   	in     (%dx),%al
  100ebe:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100ec1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ec5:	0f b6 c0             	movzbl %al,%eax
  100ec8:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ecb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ece:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ed3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ed6:	0f b7 c0             	movzwl %ax,%eax
  100ed9:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100edf:	90                   	nop
  100ee0:	c9                   	leave  
  100ee1:	c3                   	ret    

00100ee2 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ee2:	55                   	push   %ebp
  100ee3:	89 e5                	mov    %esp,%ebp
  100ee5:	83 ec 48             	sub    $0x48,%esp
  100ee8:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100eee:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ef2:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100ef6:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100efa:	ee                   	out    %al,(%dx)
  100efb:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f01:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  100f05:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f09:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f0d:	ee                   	out    %al,(%dx)
  100f0e:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f14:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  100f18:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f1c:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f20:	ee                   	out    %al,(%dx)
  100f21:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f27:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f2b:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f2f:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f33:	ee                   	out    %al,(%dx)
  100f34:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f3a:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  100f3e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f42:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f46:	ee                   	out    %al,(%dx)
  100f47:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f4d:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  100f51:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f55:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f59:	ee                   	out    %al,(%dx)
  100f5a:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f60:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  100f64:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f68:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f6c:	ee                   	out    %al,(%dx)
  100f6d:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f73:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f77:	89 c2                	mov    %eax,%edx
  100f79:	ec                   	in     (%dx),%al
  100f7a:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f7d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f81:	3c ff                	cmp    $0xff,%al
  100f83:	0f 95 c0             	setne  %al
  100f86:	0f b6 c0             	movzbl %al,%eax
  100f89:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f8e:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f94:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f98:	89 c2                	mov    %eax,%edx
  100f9a:	ec                   	in     (%dx),%al
  100f9b:	88 45 f1             	mov    %al,-0xf(%ebp)
  100f9e:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fa4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fa8:	89 c2                	mov    %eax,%edx
  100faa:	ec                   	in     (%dx),%al
  100fab:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fae:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fb3:	85 c0                	test   %eax,%eax
  100fb5:	74 0c                	je     100fc3 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fb7:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fbe:	e8 b9 06 00 00       	call   10167c <pic_enable>
    }
}
  100fc3:	90                   	nop
  100fc4:	c9                   	leave  
  100fc5:	c3                   	ret    

00100fc6 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc6:	55                   	push   %ebp
  100fc7:	89 e5                	mov    %esp,%ebp
  100fc9:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fcc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fd3:	eb 08                	jmp    100fdd <lpt_putc_sub+0x17>
        delay();
  100fd5:	e8 db fd ff ff       	call   100db5 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fda:	ff 45 fc             	incl   -0x4(%ebp)
  100fdd:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fe3:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe7:	89 c2                	mov    %eax,%edx
  100fe9:	ec                   	in     (%dx),%al
  100fea:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fed:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100ff1:	84 c0                	test   %al,%al
  100ff3:	78 09                	js     100ffe <lpt_putc_sub+0x38>
  100ff5:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ffc:	7e d7                	jle    100fd5 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100ffe:	8b 45 08             	mov    0x8(%ebp),%eax
  101001:	0f b6 c0             	movzbl %al,%eax
  101004:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10100a:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10100d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101011:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101015:	ee                   	out    %al,(%dx)
  101016:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10101c:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101020:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101024:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101028:	ee                   	out    %al,(%dx)
  101029:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10102f:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  101033:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101037:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10103b:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103c:	90                   	nop
  10103d:	c9                   	leave  
  10103e:	c3                   	ret    

0010103f <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103f:	55                   	push   %ebp
  101040:	89 e5                	mov    %esp,%ebp
  101042:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101045:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101049:	74 0d                	je     101058 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10104b:	8b 45 08             	mov    0x8(%ebp),%eax
  10104e:	89 04 24             	mov    %eax,(%esp)
  101051:	e8 70 ff ff ff       	call   100fc6 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101056:	eb 24                	jmp    10107c <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101058:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105f:	e8 62 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101064:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10106b:	e8 56 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101070:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101077:	e8 4a ff ff ff       	call   100fc6 <lpt_putc_sub>
}
  10107c:	90                   	nop
  10107d:	c9                   	leave  
  10107e:	c3                   	ret    

0010107f <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107f:	55                   	push   %ebp
  101080:	89 e5                	mov    %esp,%ebp
  101082:	53                   	push   %ebx
  101083:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101086:	8b 45 08             	mov    0x8(%ebp),%eax
  101089:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10108e:	85 c0                	test   %eax,%eax
  101090:	75 07                	jne    101099 <cga_putc+0x1a>
        c |= 0x0700;
  101092:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101099:	8b 45 08             	mov    0x8(%ebp),%eax
  10109c:	0f b6 c0             	movzbl %al,%eax
  10109f:	83 f8 0a             	cmp    $0xa,%eax
  1010a2:	74 55                	je     1010f9 <cga_putc+0x7a>
  1010a4:	83 f8 0d             	cmp    $0xd,%eax
  1010a7:	74 63                	je     10110c <cga_putc+0x8d>
  1010a9:	83 f8 08             	cmp    $0x8,%eax
  1010ac:	0f 85 94 00 00 00    	jne    101146 <cga_putc+0xc7>
    case '\b':
        if (crt_pos > 0) {
  1010b2:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b9:	85 c0                	test   %eax,%eax
  1010bb:	0f 84 af 00 00 00    	je     101170 <cga_putc+0xf1>
            crt_pos --;
  1010c1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c8:	48                   	dec    %eax
  1010c9:	0f b7 c0             	movzwl %ax,%eax
  1010cc:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010d5:	98                   	cwtl   
  1010d6:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010db:	98                   	cwtl   
  1010dc:	83 c8 20             	or     $0x20,%eax
  1010df:	98                   	cwtl   
  1010e0:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  1010e6:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010ed:	01 c9                	add    %ecx,%ecx
  1010ef:	01 ca                	add    %ecx,%edx
  1010f1:	0f b7 c0             	movzwl %ax,%eax
  1010f4:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f7:	eb 77                	jmp    101170 <cga_putc+0xf1>
    case '\n':
        crt_pos += CRT_COLS;
  1010f9:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101100:	83 c0 50             	add    $0x50,%eax
  101103:	0f b7 c0             	movzwl %ax,%eax
  101106:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10110c:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101113:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10111a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10111f:	89 c8                	mov    %ecx,%eax
  101121:	f7 e2                	mul    %edx
  101123:	c1 ea 06             	shr    $0x6,%edx
  101126:	89 d0                	mov    %edx,%eax
  101128:	c1 e0 02             	shl    $0x2,%eax
  10112b:	01 d0                	add    %edx,%eax
  10112d:	c1 e0 04             	shl    $0x4,%eax
  101130:	29 c1                	sub    %eax,%ecx
  101132:	89 c8                	mov    %ecx,%eax
  101134:	0f b7 c0             	movzwl %ax,%eax
  101137:	29 c3                	sub    %eax,%ebx
  101139:	89 d8                	mov    %ebx,%eax
  10113b:	0f b7 c0             	movzwl %ax,%eax
  10113e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101144:	eb 2b                	jmp    101171 <cga_putc+0xf2>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101146:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10114c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101153:	8d 50 01             	lea    0x1(%eax),%edx
  101156:	0f b7 d2             	movzwl %dx,%edx
  101159:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101160:	01 c0                	add    %eax,%eax
  101162:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101165:	8b 45 08             	mov    0x8(%ebp),%eax
  101168:	0f b7 c0             	movzwl %ax,%eax
  10116b:	66 89 02             	mov    %ax,(%edx)
        break;
  10116e:	eb 01                	jmp    101171 <cga_putc+0xf2>
        break;
  101170:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101171:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101178:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10117d:	76 5d                	jbe    1011dc <cga_putc+0x15d>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117f:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101184:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10118a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101196:	00 
  101197:	89 54 24 04          	mov    %edx,0x4(%esp)
  10119b:	89 04 24             	mov    %eax,(%esp)
  10119e:	e8 47 19 00 00       	call   102aea <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a3:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011aa:	eb 14                	jmp    1011c0 <cga_putc+0x141>
            crt_buf[i] = 0x0700 | ' ';
  1011ac:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b4:	01 d2                	add    %edx,%edx
  1011b6:	01 d0                	add    %edx,%eax
  1011b8:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011bd:	ff 45 f4             	incl   -0xc(%ebp)
  1011c0:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c7:	7e e3                	jle    1011ac <cga_putc+0x12d>
        }
        crt_pos -= CRT_COLS;
  1011c9:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011d0:	83 e8 50             	sub    $0x50,%eax
  1011d3:	0f b7 c0             	movzwl %ax,%eax
  1011d6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011dc:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011e3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011e7:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  1011eb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1011ef:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1011f3:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011fb:	c1 e8 08             	shr    $0x8,%eax
  1011fe:	0f b7 c0             	movzwl %ax,%eax
  101201:	0f b6 c0             	movzbl %al,%eax
  101204:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10120b:	42                   	inc    %edx
  10120c:	0f b7 d2             	movzwl %dx,%edx
  10120f:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101213:	88 45 e9             	mov    %al,-0x17(%ebp)
  101216:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10121a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10121e:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10121f:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101226:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10122a:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  10122e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101232:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101236:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101237:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10123e:	0f b6 c0             	movzbl %al,%eax
  101241:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101248:	42                   	inc    %edx
  101249:	0f b7 d2             	movzwl %dx,%edx
  10124c:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101250:	88 45 f1             	mov    %al,-0xf(%ebp)
  101253:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101257:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10125b:	ee                   	out    %al,(%dx)
}
  10125c:	90                   	nop
  10125d:	83 c4 34             	add    $0x34,%esp
  101260:	5b                   	pop    %ebx
  101261:	5d                   	pop    %ebp
  101262:	c3                   	ret    

00101263 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101263:	55                   	push   %ebp
  101264:	89 e5                	mov    %esp,%ebp
  101266:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101269:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101270:	eb 08                	jmp    10127a <serial_putc_sub+0x17>
        delay();
  101272:	e8 3e fb ff ff       	call   100db5 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101277:	ff 45 fc             	incl   -0x4(%ebp)
  10127a:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101280:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101284:	89 c2                	mov    %eax,%edx
  101286:	ec                   	in     (%dx),%al
  101287:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10128a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10128e:	0f b6 c0             	movzbl %al,%eax
  101291:	83 e0 20             	and    $0x20,%eax
  101294:	85 c0                	test   %eax,%eax
  101296:	75 09                	jne    1012a1 <serial_putc_sub+0x3e>
  101298:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10129f:	7e d1                	jle    101272 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a4:	0f b6 c0             	movzbl %al,%eax
  1012a7:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012ad:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012b4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b8:	ee                   	out    %al,(%dx)
}
  1012b9:	90                   	nop
  1012ba:	c9                   	leave  
  1012bb:	c3                   	ret    

001012bc <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012bc:	55                   	push   %ebp
  1012bd:	89 e5                	mov    %esp,%ebp
  1012bf:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012c2:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c6:	74 0d                	je     1012d5 <serial_putc+0x19>
        serial_putc_sub(c);
  1012c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012cb:	89 04 24             	mov    %eax,(%esp)
  1012ce:	e8 90 ff ff ff       	call   101263 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012d3:	eb 24                	jmp    1012f9 <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012d5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012dc:	e8 82 ff ff ff       	call   101263 <serial_putc_sub>
        serial_putc_sub(' ');
  1012e1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e8:	e8 76 ff ff ff       	call   101263 <serial_putc_sub>
        serial_putc_sub('\b');
  1012ed:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f4:	e8 6a ff ff ff       	call   101263 <serial_putc_sub>
}
  1012f9:	90                   	nop
  1012fa:	c9                   	leave  
  1012fb:	c3                   	ret    

001012fc <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012fc:	55                   	push   %ebp
  1012fd:	89 e5                	mov    %esp,%ebp
  1012ff:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101302:	eb 33                	jmp    101337 <cons_intr+0x3b>
        if (c != 0) {
  101304:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101308:	74 2d                	je     101337 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10130a:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10130f:	8d 50 01             	lea    0x1(%eax),%edx
  101312:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101318:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10131b:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101321:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101326:	3d 00 02 00 00       	cmp    $0x200,%eax
  10132b:	75 0a                	jne    101337 <cons_intr+0x3b>
                cons.wpos = 0;
  10132d:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101334:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101337:	8b 45 08             	mov    0x8(%ebp),%eax
  10133a:	ff d0                	call   *%eax
  10133c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10133f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101343:	75 bf                	jne    101304 <cons_intr+0x8>
            }
        }
    }
}
  101345:	90                   	nop
  101346:	c9                   	leave  
  101347:	c3                   	ret    

00101348 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101348:	55                   	push   %ebp
  101349:	89 e5                	mov    %esp,%ebp
  10134b:	83 ec 10             	sub    $0x10,%esp
  10134e:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101354:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101358:	89 c2                	mov    %eax,%edx
  10135a:	ec                   	in     (%dx),%al
  10135b:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10135e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101362:	0f b6 c0             	movzbl %al,%eax
  101365:	83 e0 01             	and    $0x1,%eax
  101368:	85 c0                	test   %eax,%eax
  10136a:	75 07                	jne    101373 <serial_proc_data+0x2b>
        return -1;
  10136c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101371:	eb 2a                	jmp    10139d <serial_proc_data+0x55>
  101373:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101379:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10137d:	89 c2                	mov    %eax,%edx
  10137f:	ec                   	in     (%dx),%al
  101380:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101383:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101387:	0f b6 c0             	movzbl %al,%eax
  10138a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10138d:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101391:	75 07                	jne    10139a <serial_proc_data+0x52>
        c = '\b';
  101393:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10139a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10139d:	c9                   	leave  
  10139e:	c3                   	ret    

0010139f <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10139f:	55                   	push   %ebp
  1013a0:	89 e5                	mov    %esp,%ebp
  1013a2:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013a5:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013aa:	85 c0                	test   %eax,%eax
  1013ac:	74 0c                	je     1013ba <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013ae:	c7 04 24 48 13 10 00 	movl   $0x101348,(%esp)
  1013b5:	e8 42 ff ff ff       	call   1012fc <cons_intr>
    }
}
  1013ba:	90                   	nop
  1013bb:	c9                   	leave  
  1013bc:	c3                   	ret    

001013bd <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013bd:	55                   	push   %ebp
  1013be:	89 e5                	mov    %esp,%ebp
  1013c0:	83 ec 38             	sub    $0x38,%esp
  1013c3:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013cc:	89 c2                	mov    %eax,%edx
  1013ce:	ec                   	in     (%dx),%al
  1013cf:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013d2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d6:	0f b6 c0             	movzbl %al,%eax
  1013d9:	83 e0 01             	and    $0x1,%eax
  1013dc:	85 c0                	test   %eax,%eax
  1013de:	75 0a                	jne    1013ea <kbd_proc_data+0x2d>
        return -1;
  1013e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e5:	e9 55 01 00 00       	jmp    10153f <kbd_proc_data+0x182>
  1013ea:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1013f3:	89 c2                	mov    %eax,%edx
  1013f5:	ec                   	in     (%dx),%al
  1013f6:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013fd:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101400:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101404:	75 17                	jne    10141d <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101406:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140b:	83 c8 40             	or     $0x40,%eax
  10140e:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101413:	b8 00 00 00 00       	mov    $0x0,%eax
  101418:	e9 22 01 00 00       	jmp    10153f <kbd_proc_data+0x182>
    } else if (data & 0x80) {
  10141d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101421:	84 c0                	test   %al,%al
  101423:	79 45                	jns    10146a <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101425:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142a:	83 e0 40             	and    $0x40,%eax
  10142d:	85 c0                	test   %eax,%eax
  10142f:	75 08                	jne    101439 <kbd_proc_data+0x7c>
  101431:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101435:	24 7f                	and    $0x7f,%al
  101437:	eb 04                	jmp    10143d <kbd_proc_data+0x80>
  101439:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143d:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101440:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101444:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144b:	0c 40                	or     $0x40,%al
  10144d:	0f b6 c0             	movzbl %al,%eax
  101450:	f7 d0                	not    %eax
  101452:	89 c2                	mov    %eax,%edx
  101454:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101459:	21 d0                	and    %edx,%eax
  10145b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101460:	b8 00 00 00 00       	mov    $0x0,%eax
  101465:	e9 d5 00 00 00       	jmp    10153f <kbd_proc_data+0x182>
    } else if (shift & E0ESC) {
  10146a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146f:	83 e0 40             	and    $0x40,%eax
  101472:	85 c0                	test   %eax,%eax
  101474:	74 11                	je     101487 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101476:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10147a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147f:	83 e0 bf             	and    $0xffffffbf,%eax
  101482:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101487:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10148b:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101492:	0f b6 d0             	movzbl %al,%edx
  101495:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10149a:	09 d0                	or     %edx,%eax
  10149c:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a5:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014ac:	0f b6 d0             	movzbl %al,%edx
  1014af:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b4:	31 d0                	xor    %edx,%eax
  1014b6:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014bb:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c0:	83 e0 03             	and    $0x3,%eax
  1014c3:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ce:	01 d0                	add    %edx,%eax
  1014d0:	0f b6 00             	movzbl (%eax),%eax
  1014d3:	0f b6 c0             	movzbl %al,%eax
  1014d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014de:	83 e0 08             	and    $0x8,%eax
  1014e1:	85 c0                	test   %eax,%eax
  1014e3:	74 22                	je     101507 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014e5:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e9:	7e 0c                	jle    1014f7 <kbd_proc_data+0x13a>
  1014eb:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014ef:	7f 06                	jg     1014f7 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  1014f1:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f5:	eb 10                	jmp    101507 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  1014f7:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014fb:	7e 0a                	jle    101507 <kbd_proc_data+0x14a>
  1014fd:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101501:	7f 04                	jg     101507 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101503:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101507:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10150c:	f7 d0                	not    %eax
  10150e:	83 e0 06             	and    $0x6,%eax
  101511:	85 c0                	test   %eax,%eax
  101513:	75 27                	jne    10153c <kbd_proc_data+0x17f>
  101515:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10151c:	75 1e                	jne    10153c <kbd_proc_data+0x17f>
        cprintf("Rebooting!\n");
  10151e:	c7 04 24 ed 35 10 00 	movl   $0x1035ed,(%esp)
  101525:	e8 32 ed ff ff       	call   10025c <cprintf>
  10152a:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101530:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101534:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101538:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10153b:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10153c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10153f:	c9                   	leave  
  101540:	c3                   	ret    

00101541 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101541:	55                   	push   %ebp
  101542:	89 e5                	mov    %esp,%ebp
  101544:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101547:	c7 04 24 bd 13 10 00 	movl   $0x1013bd,(%esp)
  10154e:	e8 a9 fd ff ff       	call   1012fc <cons_intr>
}
  101553:	90                   	nop
  101554:	c9                   	leave  
  101555:	c3                   	ret    

00101556 <kbd_init>:

static void
kbd_init(void) {
  101556:	55                   	push   %ebp
  101557:	89 e5                	mov    %esp,%ebp
  101559:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10155c:	e8 e0 ff ff ff       	call   101541 <kbd_intr>
    pic_enable(IRQ_KBD);
  101561:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101568:	e8 0f 01 00 00       	call   10167c <pic_enable>
}
  10156d:	90                   	nop
  10156e:	c9                   	leave  
  10156f:	c3                   	ret    

00101570 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101570:	55                   	push   %ebp
  101571:	89 e5                	mov    %esp,%ebp
  101573:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101576:	e8 83 f8 ff ff       	call   100dfe <cga_init>
    serial_init();
  10157b:	e8 62 f9 ff ff       	call   100ee2 <serial_init>
    kbd_init();
  101580:	e8 d1 ff ff ff       	call   101556 <kbd_init>
    if (!serial_exists) {
  101585:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10158a:	85 c0                	test   %eax,%eax
  10158c:	75 0c                	jne    10159a <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10158e:	c7 04 24 f9 35 10 00 	movl   $0x1035f9,(%esp)
  101595:	e8 c2 ec ff ff       	call   10025c <cprintf>
    }
}
  10159a:	90                   	nop
  10159b:	c9                   	leave  
  10159c:	c3                   	ret    

0010159d <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10159d:	55                   	push   %ebp
  10159e:	89 e5                	mov    %esp,%ebp
  1015a0:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a6:	89 04 24             	mov    %eax,(%esp)
  1015a9:	e8 91 fa ff ff       	call   10103f <lpt_putc>
    cga_putc(c);
  1015ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b1:	89 04 24             	mov    %eax,(%esp)
  1015b4:	e8 c6 fa ff ff       	call   10107f <cga_putc>
    serial_putc(c);
  1015b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1015bc:	89 04 24             	mov    %eax,(%esp)
  1015bf:	e8 f8 fc ff ff       	call   1012bc <serial_putc>
}
  1015c4:	90                   	nop
  1015c5:	c9                   	leave  
  1015c6:	c3                   	ret    

001015c7 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015c7:	55                   	push   %ebp
  1015c8:	89 e5                	mov    %esp,%ebp
  1015ca:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015cd:	e8 cd fd ff ff       	call   10139f <serial_intr>
    kbd_intr();
  1015d2:	e8 6a ff ff ff       	call   101541 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015d7:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015dd:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e2:	39 c2                	cmp    %eax,%edx
  1015e4:	74 36                	je     10161c <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e6:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015eb:	8d 50 01             	lea    0x1(%eax),%edx
  1015ee:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015f4:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015fb:	0f b6 c0             	movzbl %al,%eax
  1015fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101601:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101606:	3d 00 02 00 00       	cmp    $0x200,%eax
  10160b:	75 0a                	jne    101617 <cons_getc+0x50>
            cons.rpos = 0;
  10160d:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101614:	00 00 00 
        }
        return c;
  101617:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10161a:	eb 05                	jmp    101621 <cons_getc+0x5a>
    }
    return 0;
  10161c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101621:	c9                   	leave  
  101622:	c3                   	ret    

00101623 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101623:	55                   	push   %ebp
  101624:	89 e5                	mov    %esp,%ebp
  101626:	83 ec 14             	sub    $0x14,%esp
  101629:	8b 45 08             	mov    0x8(%ebp),%eax
  10162c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101630:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101633:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101639:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  10163e:	85 c0                	test   %eax,%eax
  101640:	74 37                	je     101679 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101642:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101645:	0f b6 c0             	movzbl %al,%eax
  101648:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10164e:	88 45 f9             	mov    %al,-0x7(%ebp)
  101651:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101655:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101659:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10165a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10165e:	c1 e8 08             	shr    $0x8,%eax
  101661:	0f b7 c0             	movzwl %ax,%eax
  101664:	0f b6 c0             	movzbl %al,%eax
  101667:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10166d:	88 45 fd             	mov    %al,-0x3(%ebp)
  101670:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101674:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101678:	ee                   	out    %al,(%dx)
    }
}
  101679:	90                   	nop
  10167a:	c9                   	leave  
  10167b:	c3                   	ret    

0010167c <pic_enable>:

void
pic_enable(unsigned int irq) {
  10167c:	55                   	push   %ebp
  10167d:	89 e5                	mov    %esp,%ebp
  10167f:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101682:	8b 45 08             	mov    0x8(%ebp),%eax
  101685:	ba 01 00 00 00       	mov    $0x1,%edx
  10168a:	88 c1                	mov    %al,%cl
  10168c:	d3 e2                	shl    %cl,%edx
  10168e:	89 d0                	mov    %edx,%eax
  101690:	98                   	cwtl   
  101691:	f7 d0                	not    %eax
  101693:	0f bf d0             	movswl %ax,%edx
  101696:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10169d:	98                   	cwtl   
  10169e:	21 d0                	and    %edx,%eax
  1016a0:	98                   	cwtl   
  1016a1:	0f b7 c0             	movzwl %ax,%eax
  1016a4:	89 04 24             	mov    %eax,(%esp)
  1016a7:	e8 77 ff ff ff       	call   101623 <pic_setmask>
}
  1016ac:	90                   	nop
  1016ad:	c9                   	leave  
  1016ae:	c3                   	ret    

001016af <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016af:	55                   	push   %ebp
  1016b0:	89 e5                	mov    %esp,%ebp
  1016b2:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b5:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016bc:	00 00 00 
  1016bf:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016c5:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  1016c9:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016cd:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016d1:	ee                   	out    %al,(%dx)
  1016d2:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016d8:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  1016dc:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1016e0:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1016e4:	ee                   	out    %al,(%dx)
  1016e5:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1016eb:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  1016ef:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1016f3:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1016f7:	ee                   	out    %al,(%dx)
  1016f8:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1016fe:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  101702:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101706:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10170a:	ee                   	out    %al,(%dx)
  10170b:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101711:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  101715:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101719:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10171d:	ee                   	out    %al,(%dx)
  10171e:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101724:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101728:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10172c:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101730:	ee                   	out    %al,(%dx)
  101731:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101737:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  10173b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10173f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101743:	ee                   	out    %al,(%dx)
  101744:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  10174a:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  10174e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101752:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101756:	ee                   	out    %al,(%dx)
  101757:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  10175d:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  101761:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101765:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101769:	ee                   	out    %al,(%dx)
  10176a:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101770:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  101774:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101778:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10177c:	ee                   	out    %al,(%dx)
  10177d:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101783:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  101787:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10178b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10178f:	ee                   	out    %al,(%dx)
  101790:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101796:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  10179a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10179e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017a2:	ee                   	out    %al,(%dx)
  1017a3:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017a9:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  1017ad:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017b1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017b5:	ee                   	out    %al,(%dx)
  1017b6:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017bc:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  1017c0:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017c4:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017c8:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d0:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017d5:	74 0f                	je     1017e6 <pic_init+0x137>
        pic_setmask(irq_mask);
  1017d7:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017de:	89 04 24             	mov    %eax,(%esp)
  1017e1:	e8 3d fe ff ff       	call   101623 <pic_setmask>
    }
}
  1017e6:	90                   	nop
  1017e7:	c9                   	leave  
  1017e8:	c3                   	ret    

001017e9 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017e9:	55                   	push   %ebp
  1017ea:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ec:	fb                   	sti    
    sti();
}
  1017ed:	90                   	nop
  1017ee:	5d                   	pop    %ebp
  1017ef:	c3                   	ret    

001017f0 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017f0:	55                   	push   %ebp
  1017f1:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017f3:	fa                   	cli    
    cli();
}
  1017f4:	90                   	nop
  1017f5:	5d                   	pop    %ebp
  1017f6:	c3                   	ret    

001017f7 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017f7:	55                   	push   %ebp
  1017f8:	89 e5                	mov    %esp,%ebp
  1017fa:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017fd:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101804:	00 
  101805:	c7 04 24 20 36 10 00 	movl   $0x103620,(%esp)
  10180c:	e8 4b ea ff ff       	call   10025c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101811:	90                   	nop
  101812:	c9                   	leave  
  101813:	c3                   	ret    

00101814 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101814:	55                   	push   %ebp
  101815:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101817:	90                   	nop
  101818:	5d                   	pop    %ebp
  101819:	c3                   	ret    

0010181a <trapname>:

static const char *
trapname(int trapno) {
  10181a:	55                   	push   %ebp
  10181b:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10181d:	8b 45 08             	mov    0x8(%ebp),%eax
  101820:	83 f8 13             	cmp    $0x13,%eax
  101823:	77 0c                	ja     101831 <trapname+0x17>
        return excnames[trapno];
  101825:	8b 45 08             	mov    0x8(%ebp),%eax
  101828:	8b 04 85 80 39 10 00 	mov    0x103980(,%eax,4),%eax
  10182f:	eb 18                	jmp    101849 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101831:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101835:	7e 0d                	jle    101844 <trapname+0x2a>
  101837:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10183b:	7f 07                	jg     101844 <trapname+0x2a>
        return "Hardware Interrupt";
  10183d:	b8 2a 36 10 00       	mov    $0x10362a,%eax
  101842:	eb 05                	jmp    101849 <trapname+0x2f>
    }
    return "(unknown trap)";
  101844:	b8 3d 36 10 00       	mov    $0x10363d,%eax
}
  101849:	5d                   	pop    %ebp
  10184a:	c3                   	ret    

0010184b <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10184b:	55                   	push   %ebp
  10184c:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10184e:	8b 45 08             	mov    0x8(%ebp),%eax
  101851:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101855:	83 f8 08             	cmp    $0x8,%eax
  101858:	0f 94 c0             	sete   %al
  10185b:	0f b6 c0             	movzbl %al,%eax
}
  10185e:	5d                   	pop    %ebp
  10185f:	c3                   	ret    

00101860 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101860:	55                   	push   %ebp
  101861:	89 e5                	mov    %esp,%ebp
  101863:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101866:	8b 45 08             	mov    0x8(%ebp),%eax
  101869:	89 44 24 04          	mov    %eax,0x4(%esp)
  10186d:	c7 04 24 7e 36 10 00 	movl   $0x10367e,(%esp)
  101874:	e8 e3 e9 ff ff       	call   10025c <cprintf>
    print_regs(&tf->tf_regs);
  101879:	8b 45 08             	mov    0x8(%ebp),%eax
  10187c:	89 04 24             	mov    %eax,(%esp)
  10187f:	e8 8f 01 00 00       	call   101a13 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101884:	8b 45 08             	mov    0x8(%ebp),%eax
  101887:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10188b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10188f:	c7 04 24 8f 36 10 00 	movl   $0x10368f,(%esp)
  101896:	e8 c1 e9 ff ff       	call   10025c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  10189b:	8b 45 08             	mov    0x8(%ebp),%eax
  10189e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1018a2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018a6:	c7 04 24 a2 36 10 00 	movl   $0x1036a2,(%esp)
  1018ad:	e8 aa e9 ff ff       	call   10025c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1018b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b5:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018b9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018bd:	c7 04 24 b5 36 10 00 	movl   $0x1036b5,(%esp)
  1018c4:	e8 93 e9 ff ff       	call   10025c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1018cc:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018d4:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  1018db:	e8 7c e9 ff ff       	call   10025c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1018e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e3:	8b 40 30             	mov    0x30(%eax),%eax
  1018e6:	89 04 24             	mov    %eax,(%esp)
  1018e9:	e8 2c ff ff ff       	call   10181a <trapname>
  1018ee:	89 c2                	mov    %eax,%edx
  1018f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1018f3:	8b 40 30             	mov    0x30(%eax),%eax
  1018f6:	89 54 24 08          	mov    %edx,0x8(%esp)
  1018fa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018fe:	c7 04 24 db 36 10 00 	movl   $0x1036db,(%esp)
  101905:	e8 52 e9 ff ff       	call   10025c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  10190a:	8b 45 08             	mov    0x8(%ebp),%eax
  10190d:	8b 40 34             	mov    0x34(%eax),%eax
  101910:	89 44 24 04          	mov    %eax,0x4(%esp)
  101914:	c7 04 24 ed 36 10 00 	movl   $0x1036ed,(%esp)
  10191b:	e8 3c e9 ff ff       	call   10025c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101920:	8b 45 08             	mov    0x8(%ebp),%eax
  101923:	8b 40 38             	mov    0x38(%eax),%eax
  101926:	89 44 24 04          	mov    %eax,0x4(%esp)
  10192a:	c7 04 24 fc 36 10 00 	movl   $0x1036fc,(%esp)
  101931:	e8 26 e9 ff ff       	call   10025c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101936:	8b 45 08             	mov    0x8(%ebp),%eax
  101939:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10193d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101941:	c7 04 24 0b 37 10 00 	movl   $0x10370b,(%esp)
  101948:	e8 0f e9 ff ff       	call   10025c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  10194d:	8b 45 08             	mov    0x8(%ebp),%eax
  101950:	8b 40 40             	mov    0x40(%eax),%eax
  101953:	89 44 24 04          	mov    %eax,0x4(%esp)
  101957:	c7 04 24 1e 37 10 00 	movl   $0x10371e,(%esp)
  10195e:	e8 f9 e8 ff ff       	call   10025c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101963:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10196a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101971:	eb 3d                	jmp    1019b0 <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101973:	8b 45 08             	mov    0x8(%ebp),%eax
  101976:	8b 50 40             	mov    0x40(%eax),%edx
  101979:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10197c:	21 d0                	and    %edx,%eax
  10197e:	85 c0                	test   %eax,%eax
  101980:	74 28                	je     1019aa <print_trapframe+0x14a>
  101982:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101985:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10198c:	85 c0                	test   %eax,%eax
  10198e:	74 1a                	je     1019aa <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101990:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101993:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10199a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10199e:	c7 04 24 2d 37 10 00 	movl   $0x10372d,(%esp)
  1019a5:	e8 b2 e8 ff ff       	call   10025c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019aa:	ff 45 f4             	incl   -0xc(%ebp)
  1019ad:	d1 65 f0             	shll   -0x10(%ebp)
  1019b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019b3:	83 f8 17             	cmp    $0x17,%eax
  1019b6:	76 bb                	jbe    101973 <print_trapframe+0x113>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bb:	8b 40 40             	mov    0x40(%eax),%eax
  1019be:	c1 e8 0c             	shr    $0xc,%eax
  1019c1:	83 e0 03             	and    $0x3,%eax
  1019c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c8:	c7 04 24 31 37 10 00 	movl   $0x103731,(%esp)
  1019cf:	e8 88 e8 ff ff       	call   10025c <cprintf>

    if (!trap_in_kernel(tf)) {
  1019d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d7:	89 04 24             	mov    %eax,(%esp)
  1019da:	e8 6c fe ff ff       	call   10184b <trap_in_kernel>
  1019df:	85 c0                	test   %eax,%eax
  1019e1:	75 2d                	jne    101a10 <print_trapframe+0x1b0>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e6:	8b 40 44             	mov    0x44(%eax),%eax
  1019e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ed:	c7 04 24 3a 37 10 00 	movl   $0x10373a,(%esp)
  1019f4:	e8 63 e8 ff ff       	call   10025c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019fc:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a00:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a04:	c7 04 24 49 37 10 00 	movl   $0x103749,(%esp)
  101a0b:	e8 4c e8 ff ff       	call   10025c <cprintf>
    }
}
  101a10:	90                   	nop
  101a11:	c9                   	leave  
  101a12:	c3                   	ret    

00101a13 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a13:	55                   	push   %ebp
  101a14:	89 e5                	mov    %esp,%ebp
  101a16:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a19:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1c:	8b 00                	mov    (%eax),%eax
  101a1e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a22:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  101a29:	e8 2e e8 ff ff       	call   10025c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a31:	8b 40 04             	mov    0x4(%eax),%eax
  101a34:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a38:	c7 04 24 6b 37 10 00 	movl   $0x10376b,(%esp)
  101a3f:	e8 18 e8 ff ff       	call   10025c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a44:	8b 45 08             	mov    0x8(%ebp),%eax
  101a47:	8b 40 08             	mov    0x8(%eax),%eax
  101a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a4e:	c7 04 24 7a 37 10 00 	movl   $0x10377a,(%esp)
  101a55:	e8 02 e8 ff ff       	call   10025c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5d:	8b 40 0c             	mov    0xc(%eax),%eax
  101a60:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a64:	c7 04 24 89 37 10 00 	movl   $0x103789,(%esp)
  101a6b:	e8 ec e7 ff ff       	call   10025c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a70:	8b 45 08             	mov    0x8(%ebp),%eax
  101a73:	8b 40 10             	mov    0x10(%eax),%eax
  101a76:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7a:	c7 04 24 98 37 10 00 	movl   $0x103798,(%esp)
  101a81:	e8 d6 e7 ff ff       	call   10025c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a86:	8b 45 08             	mov    0x8(%ebp),%eax
  101a89:	8b 40 14             	mov    0x14(%eax),%eax
  101a8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a90:	c7 04 24 a7 37 10 00 	movl   $0x1037a7,(%esp)
  101a97:	e8 c0 e7 ff ff       	call   10025c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a9f:	8b 40 18             	mov    0x18(%eax),%eax
  101aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa6:	c7 04 24 b6 37 10 00 	movl   $0x1037b6,(%esp)
  101aad:	e8 aa e7 ff ff       	call   10025c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ab2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab5:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ab8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101abc:	c7 04 24 c5 37 10 00 	movl   $0x1037c5,(%esp)
  101ac3:	e8 94 e7 ff ff       	call   10025c <cprintf>
}
  101ac8:	90                   	nop
  101ac9:	c9                   	leave  
  101aca:	c3                   	ret    

00101acb <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101acb:	55                   	push   %ebp
  101acc:	89 e5                	mov    %esp,%ebp
  101ace:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad4:	8b 40 30             	mov    0x30(%eax),%eax
  101ad7:	83 f8 2f             	cmp    $0x2f,%eax
  101ada:	77 1e                	ja     101afa <trap_dispatch+0x2f>
  101adc:	83 f8 2e             	cmp    $0x2e,%eax
  101adf:	0f 83 bc 00 00 00    	jae    101ba1 <trap_dispatch+0xd6>
  101ae5:	83 f8 21             	cmp    $0x21,%eax
  101ae8:	74 40                	je     101b2a <trap_dispatch+0x5f>
  101aea:	83 f8 24             	cmp    $0x24,%eax
  101aed:	74 15                	je     101b04 <trap_dispatch+0x39>
  101aef:	83 f8 20             	cmp    $0x20,%eax
  101af2:	0f 84 ac 00 00 00    	je     101ba4 <trap_dispatch+0xd9>
  101af8:	eb 72                	jmp    101b6c <trap_dispatch+0xa1>
  101afa:	83 e8 78             	sub    $0x78,%eax
  101afd:	83 f8 01             	cmp    $0x1,%eax
  101b00:	77 6a                	ja     101b6c <trap_dispatch+0xa1>
  101b02:	eb 4c                	jmp    101b50 <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b04:	e8 be fa ff ff       	call   1015c7 <cons_getc>
  101b09:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b0c:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b10:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b14:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1c:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  101b23:	e8 34 e7 ff ff       	call   10025c <cprintf>
        break;
  101b28:	eb 7b                	jmp    101ba5 <trap_dispatch+0xda>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b2a:	e8 98 fa ff ff       	call   1015c7 <cons_getc>
  101b2f:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b32:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b36:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b3a:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b42:	c7 04 24 e6 37 10 00 	movl   $0x1037e6,(%esp)
  101b49:	e8 0e e7 ff ff       	call   10025c <cprintf>
        break;
  101b4e:	eb 55                	jmp    101ba5 <trap_dispatch+0xda>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b50:	c7 44 24 08 f5 37 10 	movl   $0x1037f5,0x8(%esp)
  101b57:	00 
  101b58:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101b5f:	00 
  101b60:	c7 04 24 05 38 10 00 	movl   $0x103805,(%esp)
  101b67:	e8 47 e8 ff ff       	call   1003b3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b73:	83 e0 03             	and    $0x3,%eax
  101b76:	85 c0                	test   %eax,%eax
  101b78:	75 2b                	jne    101ba5 <trap_dispatch+0xda>
            print_trapframe(tf);
  101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7d:	89 04 24             	mov    %eax,(%esp)
  101b80:	e8 db fc ff ff       	call   101860 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101b85:	c7 44 24 08 16 38 10 	movl   $0x103816,0x8(%esp)
  101b8c:	00 
  101b8d:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101b94:	00 
  101b95:	c7 04 24 05 38 10 00 	movl   $0x103805,(%esp)
  101b9c:	e8 12 e8 ff ff       	call   1003b3 <__panic>
        break;
  101ba1:	90                   	nop
  101ba2:	eb 01                	jmp    101ba5 <trap_dispatch+0xda>
        break;
  101ba4:	90                   	nop
        }
    }
}
  101ba5:	90                   	nop
  101ba6:	c9                   	leave  
  101ba7:	c3                   	ret    

00101ba8 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ba8:	55                   	push   %ebp
  101ba9:	89 e5                	mov    %esp,%ebp
  101bab:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	89 04 24             	mov    %eax,(%esp)
  101bb4:	e8 12 ff ff ff       	call   101acb <trap_dispatch>
}
  101bb9:	90                   	nop
  101bba:	c9                   	leave  
  101bbb:	c3                   	ret    

00101bbc <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101bbc:	6a 00                	push   $0x0
  pushl $0
  101bbe:	6a 00                	push   $0x0
  jmp __alltraps
  101bc0:	e9 69 0a 00 00       	jmp    10262e <__alltraps>

00101bc5 <vector1>:
.globl vector1
vector1:
  pushl $0
  101bc5:	6a 00                	push   $0x0
  pushl $1
  101bc7:	6a 01                	push   $0x1
  jmp __alltraps
  101bc9:	e9 60 0a 00 00       	jmp    10262e <__alltraps>

00101bce <vector2>:
.globl vector2
vector2:
  pushl $0
  101bce:	6a 00                	push   $0x0
  pushl $2
  101bd0:	6a 02                	push   $0x2
  jmp __alltraps
  101bd2:	e9 57 0a 00 00       	jmp    10262e <__alltraps>

00101bd7 <vector3>:
.globl vector3
vector3:
  pushl $0
  101bd7:	6a 00                	push   $0x0
  pushl $3
  101bd9:	6a 03                	push   $0x3
  jmp __alltraps
  101bdb:	e9 4e 0a 00 00       	jmp    10262e <__alltraps>

00101be0 <vector4>:
.globl vector4
vector4:
  pushl $0
  101be0:	6a 00                	push   $0x0
  pushl $4
  101be2:	6a 04                	push   $0x4
  jmp __alltraps
  101be4:	e9 45 0a 00 00       	jmp    10262e <__alltraps>

00101be9 <vector5>:
.globl vector5
vector5:
  pushl $0
  101be9:	6a 00                	push   $0x0
  pushl $5
  101beb:	6a 05                	push   $0x5
  jmp __alltraps
  101bed:	e9 3c 0a 00 00       	jmp    10262e <__alltraps>

00101bf2 <vector6>:
.globl vector6
vector6:
  pushl $0
  101bf2:	6a 00                	push   $0x0
  pushl $6
  101bf4:	6a 06                	push   $0x6
  jmp __alltraps
  101bf6:	e9 33 0a 00 00       	jmp    10262e <__alltraps>

00101bfb <vector7>:
.globl vector7
vector7:
  pushl $0
  101bfb:	6a 00                	push   $0x0
  pushl $7
  101bfd:	6a 07                	push   $0x7
  jmp __alltraps
  101bff:	e9 2a 0a 00 00       	jmp    10262e <__alltraps>

00101c04 <vector8>:
.globl vector8
vector8:
  pushl $8
  101c04:	6a 08                	push   $0x8
  jmp __alltraps
  101c06:	e9 23 0a 00 00       	jmp    10262e <__alltraps>

00101c0b <vector9>:
.globl vector9
vector9:
  pushl $0
  101c0b:	6a 00                	push   $0x0
  pushl $9
  101c0d:	6a 09                	push   $0x9
  jmp __alltraps
  101c0f:	e9 1a 0a 00 00       	jmp    10262e <__alltraps>

00101c14 <vector10>:
.globl vector10
vector10:
  pushl $10
  101c14:	6a 0a                	push   $0xa
  jmp __alltraps
  101c16:	e9 13 0a 00 00       	jmp    10262e <__alltraps>

00101c1b <vector11>:
.globl vector11
vector11:
  pushl $11
  101c1b:	6a 0b                	push   $0xb
  jmp __alltraps
  101c1d:	e9 0c 0a 00 00       	jmp    10262e <__alltraps>

00101c22 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c22:	6a 0c                	push   $0xc
  jmp __alltraps
  101c24:	e9 05 0a 00 00       	jmp    10262e <__alltraps>

00101c29 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c29:	6a 0d                	push   $0xd
  jmp __alltraps
  101c2b:	e9 fe 09 00 00       	jmp    10262e <__alltraps>

00101c30 <vector14>:
.globl vector14
vector14:
  pushl $14
  101c30:	6a 0e                	push   $0xe
  jmp __alltraps
  101c32:	e9 f7 09 00 00       	jmp    10262e <__alltraps>

00101c37 <vector15>:
.globl vector15
vector15:
  pushl $0
  101c37:	6a 00                	push   $0x0
  pushl $15
  101c39:	6a 0f                	push   $0xf
  jmp __alltraps
  101c3b:	e9 ee 09 00 00       	jmp    10262e <__alltraps>

00101c40 <vector16>:
.globl vector16
vector16:
  pushl $0
  101c40:	6a 00                	push   $0x0
  pushl $16
  101c42:	6a 10                	push   $0x10
  jmp __alltraps
  101c44:	e9 e5 09 00 00       	jmp    10262e <__alltraps>

00101c49 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c49:	6a 11                	push   $0x11
  jmp __alltraps
  101c4b:	e9 de 09 00 00       	jmp    10262e <__alltraps>

00101c50 <vector18>:
.globl vector18
vector18:
  pushl $0
  101c50:	6a 00                	push   $0x0
  pushl $18
  101c52:	6a 12                	push   $0x12
  jmp __alltraps
  101c54:	e9 d5 09 00 00       	jmp    10262e <__alltraps>

00101c59 <vector19>:
.globl vector19
vector19:
  pushl $0
  101c59:	6a 00                	push   $0x0
  pushl $19
  101c5b:	6a 13                	push   $0x13
  jmp __alltraps
  101c5d:	e9 cc 09 00 00       	jmp    10262e <__alltraps>

00101c62 <vector20>:
.globl vector20
vector20:
  pushl $0
  101c62:	6a 00                	push   $0x0
  pushl $20
  101c64:	6a 14                	push   $0x14
  jmp __alltraps
  101c66:	e9 c3 09 00 00       	jmp    10262e <__alltraps>

00101c6b <vector21>:
.globl vector21
vector21:
  pushl $0
  101c6b:	6a 00                	push   $0x0
  pushl $21
  101c6d:	6a 15                	push   $0x15
  jmp __alltraps
  101c6f:	e9 ba 09 00 00       	jmp    10262e <__alltraps>

00101c74 <vector22>:
.globl vector22
vector22:
  pushl $0
  101c74:	6a 00                	push   $0x0
  pushl $22
  101c76:	6a 16                	push   $0x16
  jmp __alltraps
  101c78:	e9 b1 09 00 00       	jmp    10262e <__alltraps>

00101c7d <vector23>:
.globl vector23
vector23:
  pushl $0
  101c7d:	6a 00                	push   $0x0
  pushl $23
  101c7f:	6a 17                	push   $0x17
  jmp __alltraps
  101c81:	e9 a8 09 00 00       	jmp    10262e <__alltraps>

00101c86 <vector24>:
.globl vector24
vector24:
  pushl $0
  101c86:	6a 00                	push   $0x0
  pushl $24
  101c88:	6a 18                	push   $0x18
  jmp __alltraps
  101c8a:	e9 9f 09 00 00       	jmp    10262e <__alltraps>

00101c8f <vector25>:
.globl vector25
vector25:
  pushl $0
  101c8f:	6a 00                	push   $0x0
  pushl $25
  101c91:	6a 19                	push   $0x19
  jmp __alltraps
  101c93:	e9 96 09 00 00       	jmp    10262e <__alltraps>

00101c98 <vector26>:
.globl vector26
vector26:
  pushl $0
  101c98:	6a 00                	push   $0x0
  pushl $26
  101c9a:	6a 1a                	push   $0x1a
  jmp __alltraps
  101c9c:	e9 8d 09 00 00       	jmp    10262e <__alltraps>

00101ca1 <vector27>:
.globl vector27
vector27:
  pushl $0
  101ca1:	6a 00                	push   $0x0
  pushl $27
  101ca3:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ca5:	e9 84 09 00 00       	jmp    10262e <__alltraps>

00101caa <vector28>:
.globl vector28
vector28:
  pushl $0
  101caa:	6a 00                	push   $0x0
  pushl $28
  101cac:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cae:	e9 7b 09 00 00       	jmp    10262e <__alltraps>

00101cb3 <vector29>:
.globl vector29
vector29:
  pushl $0
  101cb3:	6a 00                	push   $0x0
  pushl $29
  101cb5:	6a 1d                	push   $0x1d
  jmp __alltraps
  101cb7:	e9 72 09 00 00       	jmp    10262e <__alltraps>

00101cbc <vector30>:
.globl vector30
vector30:
  pushl $0
  101cbc:	6a 00                	push   $0x0
  pushl $30
  101cbe:	6a 1e                	push   $0x1e
  jmp __alltraps
  101cc0:	e9 69 09 00 00       	jmp    10262e <__alltraps>

00101cc5 <vector31>:
.globl vector31
vector31:
  pushl $0
  101cc5:	6a 00                	push   $0x0
  pushl $31
  101cc7:	6a 1f                	push   $0x1f
  jmp __alltraps
  101cc9:	e9 60 09 00 00       	jmp    10262e <__alltraps>

00101cce <vector32>:
.globl vector32
vector32:
  pushl $0
  101cce:	6a 00                	push   $0x0
  pushl $32
  101cd0:	6a 20                	push   $0x20
  jmp __alltraps
  101cd2:	e9 57 09 00 00       	jmp    10262e <__alltraps>

00101cd7 <vector33>:
.globl vector33
vector33:
  pushl $0
  101cd7:	6a 00                	push   $0x0
  pushl $33
  101cd9:	6a 21                	push   $0x21
  jmp __alltraps
  101cdb:	e9 4e 09 00 00       	jmp    10262e <__alltraps>

00101ce0 <vector34>:
.globl vector34
vector34:
  pushl $0
  101ce0:	6a 00                	push   $0x0
  pushl $34
  101ce2:	6a 22                	push   $0x22
  jmp __alltraps
  101ce4:	e9 45 09 00 00       	jmp    10262e <__alltraps>

00101ce9 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ce9:	6a 00                	push   $0x0
  pushl $35
  101ceb:	6a 23                	push   $0x23
  jmp __alltraps
  101ced:	e9 3c 09 00 00       	jmp    10262e <__alltraps>

00101cf2 <vector36>:
.globl vector36
vector36:
  pushl $0
  101cf2:	6a 00                	push   $0x0
  pushl $36
  101cf4:	6a 24                	push   $0x24
  jmp __alltraps
  101cf6:	e9 33 09 00 00       	jmp    10262e <__alltraps>

00101cfb <vector37>:
.globl vector37
vector37:
  pushl $0
  101cfb:	6a 00                	push   $0x0
  pushl $37
  101cfd:	6a 25                	push   $0x25
  jmp __alltraps
  101cff:	e9 2a 09 00 00       	jmp    10262e <__alltraps>

00101d04 <vector38>:
.globl vector38
vector38:
  pushl $0
  101d04:	6a 00                	push   $0x0
  pushl $38
  101d06:	6a 26                	push   $0x26
  jmp __alltraps
  101d08:	e9 21 09 00 00       	jmp    10262e <__alltraps>

00101d0d <vector39>:
.globl vector39
vector39:
  pushl $0
  101d0d:	6a 00                	push   $0x0
  pushl $39
  101d0f:	6a 27                	push   $0x27
  jmp __alltraps
  101d11:	e9 18 09 00 00       	jmp    10262e <__alltraps>

00101d16 <vector40>:
.globl vector40
vector40:
  pushl $0
  101d16:	6a 00                	push   $0x0
  pushl $40
  101d18:	6a 28                	push   $0x28
  jmp __alltraps
  101d1a:	e9 0f 09 00 00       	jmp    10262e <__alltraps>

00101d1f <vector41>:
.globl vector41
vector41:
  pushl $0
  101d1f:	6a 00                	push   $0x0
  pushl $41
  101d21:	6a 29                	push   $0x29
  jmp __alltraps
  101d23:	e9 06 09 00 00       	jmp    10262e <__alltraps>

00101d28 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d28:	6a 00                	push   $0x0
  pushl $42
  101d2a:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d2c:	e9 fd 08 00 00       	jmp    10262e <__alltraps>

00101d31 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d31:	6a 00                	push   $0x0
  pushl $43
  101d33:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d35:	e9 f4 08 00 00       	jmp    10262e <__alltraps>

00101d3a <vector44>:
.globl vector44
vector44:
  pushl $0
  101d3a:	6a 00                	push   $0x0
  pushl $44
  101d3c:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d3e:	e9 eb 08 00 00       	jmp    10262e <__alltraps>

00101d43 <vector45>:
.globl vector45
vector45:
  pushl $0
  101d43:	6a 00                	push   $0x0
  pushl $45
  101d45:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d47:	e9 e2 08 00 00       	jmp    10262e <__alltraps>

00101d4c <vector46>:
.globl vector46
vector46:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $46
  101d4e:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d50:	e9 d9 08 00 00       	jmp    10262e <__alltraps>

00101d55 <vector47>:
.globl vector47
vector47:
  pushl $0
  101d55:	6a 00                	push   $0x0
  pushl $47
  101d57:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d59:	e9 d0 08 00 00       	jmp    10262e <__alltraps>

00101d5e <vector48>:
.globl vector48
vector48:
  pushl $0
  101d5e:	6a 00                	push   $0x0
  pushl $48
  101d60:	6a 30                	push   $0x30
  jmp __alltraps
  101d62:	e9 c7 08 00 00       	jmp    10262e <__alltraps>

00101d67 <vector49>:
.globl vector49
vector49:
  pushl $0
  101d67:	6a 00                	push   $0x0
  pushl $49
  101d69:	6a 31                	push   $0x31
  jmp __alltraps
  101d6b:	e9 be 08 00 00       	jmp    10262e <__alltraps>

00101d70 <vector50>:
.globl vector50
vector50:
  pushl $0
  101d70:	6a 00                	push   $0x0
  pushl $50
  101d72:	6a 32                	push   $0x32
  jmp __alltraps
  101d74:	e9 b5 08 00 00       	jmp    10262e <__alltraps>

00101d79 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d79:	6a 00                	push   $0x0
  pushl $51
  101d7b:	6a 33                	push   $0x33
  jmp __alltraps
  101d7d:	e9 ac 08 00 00       	jmp    10262e <__alltraps>

00101d82 <vector52>:
.globl vector52
vector52:
  pushl $0
  101d82:	6a 00                	push   $0x0
  pushl $52
  101d84:	6a 34                	push   $0x34
  jmp __alltraps
  101d86:	e9 a3 08 00 00       	jmp    10262e <__alltraps>

00101d8b <vector53>:
.globl vector53
vector53:
  pushl $0
  101d8b:	6a 00                	push   $0x0
  pushl $53
  101d8d:	6a 35                	push   $0x35
  jmp __alltraps
  101d8f:	e9 9a 08 00 00       	jmp    10262e <__alltraps>

00101d94 <vector54>:
.globl vector54
vector54:
  pushl $0
  101d94:	6a 00                	push   $0x0
  pushl $54
  101d96:	6a 36                	push   $0x36
  jmp __alltraps
  101d98:	e9 91 08 00 00       	jmp    10262e <__alltraps>

00101d9d <vector55>:
.globl vector55
vector55:
  pushl $0
  101d9d:	6a 00                	push   $0x0
  pushl $55
  101d9f:	6a 37                	push   $0x37
  jmp __alltraps
  101da1:	e9 88 08 00 00       	jmp    10262e <__alltraps>

00101da6 <vector56>:
.globl vector56
vector56:
  pushl $0
  101da6:	6a 00                	push   $0x0
  pushl $56
  101da8:	6a 38                	push   $0x38
  jmp __alltraps
  101daa:	e9 7f 08 00 00       	jmp    10262e <__alltraps>

00101daf <vector57>:
.globl vector57
vector57:
  pushl $0
  101daf:	6a 00                	push   $0x0
  pushl $57
  101db1:	6a 39                	push   $0x39
  jmp __alltraps
  101db3:	e9 76 08 00 00       	jmp    10262e <__alltraps>

00101db8 <vector58>:
.globl vector58
vector58:
  pushl $0
  101db8:	6a 00                	push   $0x0
  pushl $58
  101dba:	6a 3a                	push   $0x3a
  jmp __alltraps
  101dbc:	e9 6d 08 00 00       	jmp    10262e <__alltraps>

00101dc1 <vector59>:
.globl vector59
vector59:
  pushl $0
  101dc1:	6a 00                	push   $0x0
  pushl $59
  101dc3:	6a 3b                	push   $0x3b
  jmp __alltraps
  101dc5:	e9 64 08 00 00       	jmp    10262e <__alltraps>

00101dca <vector60>:
.globl vector60
vector60:
  pushl $0
  101dca:	6a 00                	push   $0x0
  pushl $60
  101dcc:	6a 3c                	push   $0x3c
  jmp __alltraps
  101dce:	e9 5b 08 00 00       	jmp    10262e <__alltraps>

00101dd3 <vector61>:
.globl vector61
vector61:
  pushl $0
  101dd3:	6a 00                	push   $0x0
  pushl $61
  101dd5:	6a 3d                	push   $0x3d
  jmp __alltraps
  101dd7:	e9 52 08 00 00       	jmp    10262e <__alltraps>

00101ddc <vector62>:
.globl vector62
vector62:
  pushl $0
  101ddc:	6a 00                	push   $0x0
  pushl $62
  101dde:	6a 3e                	push   $0x3e
  jmp __alltraps
  101de0:	e9 49 08 00 00       	jmp    10262e <__alltraps>

00101de5 <vector63>:
.globl vector63
vector63:
  pushl $0
  101de5:	6a 00                	push   $0x0
  pushl $63
  101de7:	6a 3f                	push   $0x3f
  jmp __alltraps
  101de9:	e9 40 08 00 00       	jmp    10262e <__alltraps>

00101dee <vector64>:
.globl vector64
vector64:
  pushl $0
  101dee:	6a 00                	push   $0x0
  pushl $64
  101df0:	6a 40                	push   $0x40
  jmp __alltraps
  101df2:	e9 37 08 00 00       	jmp    10262e <__alltraps>

00101df7 <vector65>:
.globl vector65
vector65:
  pushl $0
  101df7:	6a 00                	push   $0x0
  pushl $65
  101df9:	6a 41                	push   $0x41
  jmp __alltraps
  101dfb:	e9 2e 08 00 00       	jmp    10262e <__alltraps>

00101e00 <vector66>:
.globl vector66
vector66:
  pushl $0
  101e00:	6a 00                	push   $0x0
  pushl $66
  101e02:	6a 42                	push   $0x42
  jmp __alltraps
  101e04:	e9 25 08 00 00       	jmp    10262e <__alltraps>

00101e09 <vector67>:
.globl vector67
vector67:
  pushl $0
  101e09:	6a 00                	push   $0x0
  pushl $67
  101e0b:	6a 43                	push   $0x43
  jmp __alltraps
  101e0d:	e9 1c 08 00 00       	jmp    10262e <__alltraps>

00101e12 <vector68>:
.globl vector68
vector68:
  pushl $0
  101e12:	6a 00                	push   $0x0
  pushl $68
  101e14:	6a 44                	push   $0x44
  jmp __alltraps
  101e16:	e9 13 08 00 00       	jmp    10262e <__alltraps>

00101e1b <vector69>:
.globl vector69
vector69:
  pushl $0
  101e1b:	6a 00                	push   $0x0
  pushl $69
  101e1d:	6a 45                	push   $0x45
  jmp __alltraps
  101e1f:	e9 0a 08 00 00       	jmp    10262e <__alltraps>

00101e24 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $70
  101e26:	6a 46                	push   $0x46
  jmp __alltraps
  101e28:	e9 01 08 00 00       	jmp    10262e <__alltraps>

00101e2d <vector71>:
.globl vector71
vector71:
  pushl $0
  101e2d:	6a 00                	push   $0x0
  pushl $71
  101e2f:	6a 47                	push   $0x47
  jmp __alltraps
  101e31:	e9 f8 07 00 00       	jmp    10262e <__alltraps>

00101e36 <vector72>:
.globl vector72
vector72:
  pushl $0
  101e36:	6a 00                	push   $0x0
  pushl $72
  101e38:	6a 48                	push   $0x48
  jmp __alltraps
  101e3a:	e9 ef 07 00 00       	jmp    10262e <__alltraps>

00101e3f <vector73>:
.globl vector73
vector73:
  pushl $0
  101e3f:	6a 00                	push   $0x0
  pushl $73
  101e41:	6a 49                	push   $0x49
  jmp __alltraps
  101e43:	e9 e6 07 00 00       	jmp    10262e <__alltraps>

00101e48 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $74
  101e4a:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e4c:	e9 dd 07 00 00       	jmp    10262e <__alltraps>

00101e51 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e51:	6a 00                	push   $0x0
  pushl $75
  101e53:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e55:	e9 d4 07 00 00       	jmp    10262e <__alltraps>

00101e5a <vector76>:
.globl vector76
vector76:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $76
  101e5c:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e5e:	e9 cb 07 00 00       	jmp    10262e <__alltraps>

00101e63 <vector77>:
.globl vector77
vector77:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $77
  101e65:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e67:	e9 c2 07 00 00       	jmp    10262e <__alltraps>

00101e6c <vector78>:
.globl vector78
vector78:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $78
  101e6e:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e70:	e9 b9 07 00 00       	jmp    10262e <__alltraps>

00101e75 <vector79>:
.globl vector79
vector79:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $79
  101e77:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e79:	e9 b0 07 00 00       	jmp    10262e <__alltraps>

00101e7e <vector80>:
.globl vector80
vector80:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $80
  101e80:	6a 50                	push   $0x50
  jmp __alltraps
  101e82:	e9 a7 07 00 00       	jmp    10262e <__alltraps>

00101e87 <vector81>:
.globl vector81
vector81:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $81
  101e89:	6a 51                	push   $0x51
  jmp __alltraps
  101e8b:	e9 9e 07 00 00       	jmp    10262e <__alltraps>

00101e90 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $82
  101e92:	6a 52                	push   $0x52
  jmp __alltraps
  101e94:	e9 95 07 00 00       	jmp    10262e <__alltraps>

00101e99 <vector83>:
.globl vector83
vector83:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $83
  101e9b:	6a 53                	push   $0x53
  jmp __alltraps
  101e9d:	e9 8c 07 00 00       	jmp    10262e <__alltraps>

00101ea2 <vector84>:
.globl vector84
vector84:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $84
  101ea4:	6a 54                	push   $0x54
  jmp __alltraps
  101ea6:	e9 83 07 00 00       	jmp    10262e <__alltraps>

00101eab <vector85>:
.globl vector85
vector85:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $85
  101ead:	6a 55                	push   $0x55
  jmp __alltraps
  101eaf:	e9 7a 07 00 00       	jmp    10262e <__alltraps>

00101eb4 <vector86>:
.globl vector86
vector86:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $86
  101eb6:	6a 56                	push   $0x56
  jmp __alltraps
  101eb8:	e9 71 07 00 00       	jmp    10262e <__alltraps>

00101ebd <vector87>:
.globl vector87
vector87:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $87
  101ebf:	6a 57                	push   $0x57
  jmp __alltraps
  101ec1:	e9 68 07 00 00       	jmp    10262e <__alltraps>

00101ec6 <vector88>:
.globl vector88
vector88:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $88
  101ec8:	6a 58                	push   $0x58
  jmp __alltraps
  101eca:	e9 5f 07 00 00       	jmp    10262e <__alltraps>

00101ecf <vector89>:
.globl vector89
vector89:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $89
  101ed1:	6a 59                	push   $0x59
  jmp __alltraps
  101ed3:	e9 56 07 00 00       	jmp    10262e <__alltraps>

00101ed8 <vector90>:
.globl vector90
vector90:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $90
  101eda:	6a 5a                	push   $0x5a
  jmp __alltraps
  101edc:	e9 4d 07 00 00       	jmp    10262e <__alltraps>

00101ee1 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $91
  101ee3:	6a 5b                	push   $0x5b
  jmp __alltraps
  101ee5:	e9 44 07 00 00       	jmp    10262e <__alltraps>

00101eea <vector92>:
.globl vector92
vector92:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $92
  101eec:	6a 5c                	push   $0x5c
  jmp __alltraps
  101eee:	e9 3b 07 00 00       	jmp    10262e <__alltraps>

00101ef3 <vector93>:
.globl vector93
vector93:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $93
  101ef5:	6a 5d                	push   $0x5d
  jmp __alltraps
  101ef7:	e9 32 07 00 00       	jmp    10262e <__alltraps>

00101efc <vector94>:
.globl vector94
vector94:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $94
  101efe:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f00:	e9 29 07 00 00       	jmp    10262e <__alltraps>

00101f05 <vector95>:
.globl vector95
vector95:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $95
  101f07:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f09:	e9 20 07 00 00       	jmp    10262e <__alltraps>

00101f0e <vector96>:
.globl vector96
vector96:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $96
  101f10:	6a 60                	push   $0x60
  jmp __alltraps
  101f12:	e9 17 07 00 00       	jmp    10262e <__alltraps>

00101f17 <vector97>:
.globl vector97
vector97:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $97
  101f19:	6a 61                	push   $0x61
  jmp __alltraps
  101f1b:	e9 0e 07 00 00       	jmp    10262e <__alltraps>

00101f20 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $98
  101f22:	6a 62                	push   $0x62
  jmp __alltraps
  101f24:	e9 05 07 00 00       	jmp    10262e <__alltraps>

00101f29 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $99
  101f2b:	6a 63                	push   $0x63
  jmp __alltraps
  101f2d:	e9 fc 06 00 00       	jmp    10262e <__alltraps>

00101f32 <vector100>:
.globl vector100
vector100:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $100
  101f34:	6a 64                	push   $0x64
  jmp __alltraps
  101f36:	e9 f3 06 00 00       	jmp    10262e <__alltraps>

00101f3b <vector101>:
.globl vector101
vector101:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $101
  101f3d:	6a 65                	push   $0x65
  jmp __alltraps
  101f3f:	e9 ea 06 00 00       	jmp    10262e <__alltraps>

00101f44 <vector102>:
.globl vector102
vector102:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $102
  101f46:	6a 66                	push   $0x66
  jmp __alltraps
  101f48:	e9 e1 06 00 00       	jmp    10262e <__alltraps>

00101f4d <vector103>:
.globl vector103
vector103:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $103
  101f4f:	6a 67                	push   $0x67
  jmp __alltraps
  101f51:	e9 d8 06 00 00       	jmp    10262e <__alltraps>

00101f56 <vector104>:
.globl vector104
vector104:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $104
  101f58:	6a 68                	push   $0x68
  jmp __alltraps
  101f5a:	e9 cf 06 00 00       	jmp    10262e <__alltraps>

00101f5f <vector105>:
.globl vector105
vector105:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $105
  101f61:	6a 69                	push   $0x69
  jmp __alltraps
  101f63:	e9 c6 06 00 00       	jmp    10262e <__alltraps>

00101f68 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $106
  101f6a:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f6c:	e9 bd 06 00 00       	jmp    10262e <__alltraps>

00101f71 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $107
  101f73:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f75:	e9 b4 06 00 00       	jmp    10262e <__alltraps>

00101f7a <vector108>:
.globl vector108
vector108:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $108
  101f7c:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f7e:	e9 ab 06 00 00       	jmp    10262e <__alltraps>

00101f83 <vector109>:
.globl vector109
vector109:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $109
  101f85:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f87:	e9 a2 06 00 00       	jmp    10262e <__alltraps>

00101f8c <vector110>:
.globl vector110
vector110:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $110
  101f8e:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f90:	e9 99 06 00 00       	jmp    10262e <__alltraps>

00101f95 <vector111>:
.globl vector111
vector111:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $111
  101f97:	6a 6f                	push   $0x6f
  jmp __alltraps
  101f99:	e9 90 06 00 00       	jmp    10262e <__alltraps>

00101f9e <vector112>:
.globl vector112
vector112:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $112
  101fa0:	6a 70                	push   $0x70
  jmp __alltraps
  101fa2:	e9 87 06 00 00       	jmp    10262e <__alltraps>

00101fa7 <vector113>:
.globl vector113
vector113:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $113
  101fa9:	6a 71                	push   $0x71
  jmp __alltraps
  101fab:	e9 7e 06 00 00       	jmp    10262e <__alltraps>

00101fb0 <vector114>:
.globl vector114
vector114:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $114
  101fb2:	6a 72                	push   $0x72
  jmp __alltraps
  101fb4:	e9 75 06 00 00       	jmp    10262e <__alltraps>

00101fb9 <vector115>:
.globl vector115
vector115:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $115
  101fbb:	6a 73                	push   $0x73
  jmp __alltraps
  101fbd:	e9 6c 06 00 00       	jmp    10262e <__alltraps>

00101fc2 <vector116>:
.globl vector116
vector116:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $116
  101fc4:	6a 74                	push   $0x74
  jmp __alltraps
  101fc6:	e9 63 06 00 00       	jmp    10262e <__alltraps>

00101fcb <vector117>:
.globl vector117
vector117:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $117
  101fcd:	6a 75                	push   $0x75
  jmp __alltraps
  101fcf:	e9 5a 06 00 00       	jmp    10262e <__alltraps>

00101fd4 <vector118>:
.globl vector118
vector118:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $118
  101fd6:	6a 76                	push   $0x76
  jmp __alltraps
  101fd8:	e9 51 06 00 00       	jmp    10262e <__alltraps>

00101fdd <vector119>:
.globl vector119
vector119:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $119
  101fdf:	6a 77                	push   $0x77
  jmp __alltraps
  101fe1:	e9 48 06 00 00       	jmp    10262e <__alltraps>

00101fe6 <vector120>:
.globl vector120
vector120:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $120
  101fe8:	6a 78                	push   $0x78
  jmp __alltraps
  101fea:	e9 3f 06 00 00       	jmp    10262e <__alltraps>

00101fef <vector121>:
.globl vector121
vector121:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $121
  101ff1:	6a 79                	push   $0x79
  jmp __alltraps
  101ff3:	e9 36 06 00 00       	jmp    10262e <__alltraps>

00101ff8 <vector122>:
.globl vector122
vector122:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $122
  101ffa:	6a 7a                	push   $0x7a
  jmp __alltraps
  101ffc:	e9 2d 06 00 00       	jmp    10262e <__alltraps>

00102001 <vector123>:
.globl vector123
vector123:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $123
  102003:	6a 7b                	push   $0x7b
  jmp __alltraps
  102005:	e9 24 06 00 00       	jmp    10262e <__alltraps>

0010200a <vector124>:
.globl vector124
vector124:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $124
  10200c:	6a 7c                	push   $0x7c
  jmp __alltraps
  10200e:	e9 1b 06 00 00       	jmp    10262e <__alltraps>

00102013 <vector125>:
.globl vector125
vector125:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $125
  102015:	6a 7d                	push   $0x7d
  jmp __alltraps
  102017:	e9 12 06 00 00       	jmp    10262e <__alltraps>

0010201c <vector126>:
.globl vector126
vector126:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $126
  10201e:	6a 7e                	push   $0x7e
  jmp __alltraps
  102020:	e9 09 06 00 00       	jmp    10262e <__alltraps>

00102025 <vector127>:
.globl vector127
vector127:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $127
  102027:	6a 7f                	push   $0x7f
  jmp __alltraps
  102029:	e9 00 06 00 00       	jmp    10262e <__alltraps>

0010202e <vector128>:
.globl vector128
vector128:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $128
  102030:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102035:	e9 f4 05 00 00       	jmp    10262e <__alltraps>

0010203a <vector129>:
.globl vector129
vector129:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $129
  10203c:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102041:	e9 e8 05 00 00       	jmp    10262e <__alltraps>

00102046 <vector130>:
.globl vector130
vector130:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $130
  102048:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10204d:	e9 dc 05 00 00       	jmp    10262e <__alltraps>

00102052 <vector131>:
.globl vector131
vector131:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $131
  102054:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102059:	e9 d0 05 00 00       	jmp    10262e <__alltraps>

0010205e <vector132>:
.globl vector132
vector132:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $132
  102060:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102065:	e9 c4 05 00 00       	jmp    10262e <__alltraps>

0010206a <vector133>:
.globl vector133
vector133:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $133
  10206c:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102071:	e9 b8 05 00 00       	jmp    10262e <__alltraps>

00102076 <vector134>:
.globl vector134
vector134:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $134
  102078:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10207d:	e9 ac 05 00 00       	jmp    10262e <__alltraps>

00102082 <vector135>:
.globl vector135
vector135:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $135
  102084:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102089:	e9 a0 05 00 00       	jmp    10262e <__alltraps>

0010208e <vector136>:
.globl vector136
vector136:
  pushl $0
  10208e:	6a 00                	push   $0x0
  pushl $136
  102090:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102095:	e9 94 05 00 00       	jmp    10262e <__alltraps>

0010209a <vector137>:
.globl vector137
vector137:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $137
  10209c:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020a1:	e9 88 05 00 00       	jmp    10262e <__alltraps>

001020a6 <vector138>:
.globl vector138
vector138:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $138
  1020a8:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020ad:	e9 7c 05 00 00       	jmp    10262e <__alltraps>

001020b2 <vector139>:
.globl vector139
vector139:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $139
  1020b4:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1020b9:	e9 70 05 00 00       	jmp    10262e <__alltraps>

001020be <vector140>:
.globl vector140
vector140:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $140
  1020c0:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020c5:	e9 64 05 00 00       	jmp    10262e <__alltraps>

001020ca <vector141>:
.globl vector141
vector141:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $141
  1020cc:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020d1:	e9 58 05 00 00       	jmp    10262e <__alltraps>

001020d6 <vector142>:
.globl vector142
vector142:
  pushl $0
  1020d6:	6a 00                	push   $0x0
  pushl $142
  1020d8:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1020dd:	e9 4c 05 00 00       	jmp    10262e <__alltraps>

001020e2 <vector143>:
.globl vector143
vector143:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $143
  1020e4:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1020e9:	e9 40 05 00 00       	jmp    10262e <__alltraps>

001020ee <vector144>:
.globl vector144
vector144:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $144
  1020f0:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1020f5:	e9 34 05 00 00       	jmp    10262e <__alltraps>

001020fa <vector145>:
.globl vector145
vector145:
  pushl $0
  1020fa:	6a 00                	push   $0x0
  pushl $145
  1020fc:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102101:	e9 28 05 00 00       	jmp    10262e <__alltraps>

00102106 <vector146>:
.globl vector146
vector146:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $146
  102108:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10210d:	e9 1c 05 00 00       	jmp    10262e <__alltraps>

00102112 <vector147>:
.globl vector147
vector147:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $147
  102114:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102119:	e9 10 05 00 00       	jmp    10262e <__alltraps>

0010211e <vector148>:
.globl vector148
vector148:
  pushl $0
  10211e:	6a 00                	push   $0x0
  pushl $148
  102120:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102125:	e9 04 05 00 00       	jmp    10262e <__alltraps>

0010212a <vector149>:
.globl vector149
vector149:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $149
  10212c:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102131:	e9 f8 04 00 00       	jmp    10262e <__alltraps>

00102136 <vector150>:
.globl vector150
vector150:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $150
  102138:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10213d:	e9 ec 04 00 00       	jmp    10262e <__alltraps>

00102142 <vector151>:
.globl vector151
vector151:
  pushl $0
  102142:	6a 00                	push   $0x0
  pushl $151
  102144:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102149:	e9 e0 04 00 00       	jmp    10262e <__alltraps>

0010214e <vector152>:
.globl vector152
vector152:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $152
  102150:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102155:	e9 d4 04 00 00       	jmp    10262e <__alltraps>

0010215a <vector153>:
.globl vector153
vector153:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $153
  10215c:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102161:	e9 c8 04 00 00       	jmp    10262e <__alltraps>

00102166 <vector154>:
.globl vector154
vector154:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $154
  102168:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10216d:	e9 bc 04 00 00       	jmp    10262e <__alltraps>

00102172 <vector155>:
.globl vector155
vector155:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $155
  102174:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102179:	e9 b0 04 00 00       	jmp    10262e <__alltraps>

0010217e <vector156>:
.globl vector156
vector156:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $156
  102180:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102185:	e9 a4 04 00 00       	jmp    10262e <__alltraps>

0010218a <vector157>:
.globl vector157
vector157:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $157
  10218c:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102191:	e9 98 04 00 00       	jmp    10262e <__alltraps>

00102196 <vector158>:
.globl vector158
vector158:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $158
  102198:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10219d:	e9 8c 04 00 00       	jmp    10262e <__alltraps>

001021a2 <vector159>:
.globl vector159
vector159:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $159
  1021a4:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021a9:	e9 80 04 00 00       	jmp    10262e <__alltraps>

001021ae <vector160>:
.globl vector160
vector160:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $160
  1021b0:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1021b5:	e9 74 04 00 00       	jmp    10262e <__alltraps>

001021ba <vector161>:
.globl vector161
vector161:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $161
  1021bc:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021c1:	e9 68 04 00 00       	jmp    10262e <__alltraps>

001021c6 <vector162>:
.globl vector162
vector162:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $162
  1021c8:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021cd:	e9 5c 04 00 00       	jmp    10262e <__alltraps>

001021d2 <vector163>:
.globl vector163
vector163:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $163
  1021d4:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1021d9:	e9 50 04 00 00       	jmp    10262e <__alltraps>

001021de <vector164>:
.globl vector164
vector164:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $164
  1021e0:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1021e5:	e9 44 04 00 00       	jmp    10262e <__alltraps>

001021ea <vector165>:
.globl vector165
vector165:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $165
  1021ec:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1021f1:	e9 38 04 00 00       	jmp    10262e <__alltraps>

001021f6 <vector166>:
.globl vector166
vector166:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $166
  1021f8:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1021fd:	e9 2c 04 00 00       	jmp    10262e <__alltraps>

00102202 <vector167>:
.globl vector167
vector167:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $167
  102204:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102209:	e9 20 04 00 00       	jmp    10262e <__alltraps>

0010220e <vector168>:
.globl vector168
vector168:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $168
  102210:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102215:	e9 14 04 00 00       	jmp    10262e <__alltraps>

0010221a <vector169>:
.globl vector169
vector169:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $169
  10221c:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102221:	e9 08 04 00 00       	jmp    10262e <__alltraps>

00102226 <vector170>:
.globl vector170
vector170:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $170
  102228:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10222d:	e9 fc 03 00 00       	jmp    10262e <__alltraps>

00102232 <vector171>:
.globl vector171
vector171:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $171
  102234:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102239:	e9 f0 03 00 00       	jmp    10262e <__alltraps>

0010223e <vector172>:
.globl vector172
vector172:
  pushl $0
  10223e:	6a 00                	push   $0x0
  pushl $172
  102240:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102245:	e9 e4 03 00 00       	jmp    10262e <__alltraps>

0010224a <vector173>:
.globl vector173
vector173:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $173
  10224c:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102251:	e9 d8 03 00 00       	jmp    10262e <__alltraps>

00102256 <vector174>:
.globl vector174
vector174:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $174
  102258:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10225d:	e9 cc 03 00 00       	jmp    10262e <__alltraps>

00102262 <vector175>:
.globl vector175
vector175:
  pushl $0
  102262:	6a 00                	push   $0x0
  pushl $175
  102264:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102269:	e9 c0 03 00 00       	jmp    10262e <__alltraps>

0010226e <vector176>:
.globl vector176
vector176:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $176
  102270:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102275:	e9 b4 03 00 00       	jmp    10262e <__alltraps>

0010227a <vector177>:
.globl vector177
vector177:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $177
  10227c:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102281:	e9 a8 03 00 00       	jmp    10262e <__alltraps>

00102286 <vector178>:
.globl vector178
vector178:
  pushl $0
  102286:	6a 00                	push   $0x0
  pushl $178
  102288:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10228d:	e9 9c 03 00 00       	jmp    10262e <__alltraps>

00102292 <vector179>:
.globl vector179
vector179:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $179
  102294:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102299:	e9 90 03 00 00       	jmp    10262e <__alltraps>

0010229e <vector180>:
.globl vector180
vector180:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $180
  1022a0:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022a5:	e9 84 03 00 00       	jmp    10262e <__alltraps>

001022aa <vector181>:
.globl vector181
vector181:
  pushl $0
  1022aa:	6a 00                	push   $0x0
  pushl $181
  1022ac:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022b1:	e9 78 03 00 00       	jmp    10262e <__alltraps>

001022b6 <vector182>:
.globl vector182
vector182:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $182
  1022b8:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022bd:	e9 6c 03 00 00       	jmp    10262e <__alltraps>

001022c2 <vector183>:
.globl vector183
vector183:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $183
  1022c4:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022c9:	e9 60 03 00 00       	jmp    10262e <__alltraps>

001022ce <vector184>:
.globl vector184
vector184:
  pushl $0
  1022ce:	6a 00                	push   $0x0
  pushl $184
  1022d0:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022d5:	e9 54 03 00 00       	jmp    10262e <__alltraps>

001022da <vector185>:
.globl vector185
vector185:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $185
  1022dc:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1022e1:	e9 48 03 00 00       	jmp    10262e <__alltraps>

001022e6 <vector186>:
.globl vector186
vector186:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $186
  1022e8:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1022ed:	e9 3c 03 00 00       	jmp    10262e <__alltraps>

001022f2 <vector187>:
.globl vector187
vector187:
  pushl $0
  1022f2:	6a 00                	push   $0x0
  pushl $187
  1022f4:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1022f9:	e9 30 03 00 00       	jmp    10262e <__alltraps>

001022fe <vector188>:
.globl vector188
vector188:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $188
  102300:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102305:	e9 24 03 00 00       	jmp    10262e <__alltraps>

0010230a <vector189>:
.globl vector189
vector189:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $189
  10230c:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102311:	e9 18 03 00 00       	jmp    10262e <__alltraps>

00102316 <vector190>:
.globl vector190
vector190:
  pushl $0
  102316:	6a 00                	push   $0x0
  pushl $190
  102318:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10231d:	e9 0c 03 00 00       	jmp    10262e <__alltraps>

00102322 <vector191>:
.globl vector191
vector191:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $191
  102324:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102329:	e9 00 03 00 00       	jmp    10262e <__alltraps>

0010232e <vector192>:
.globl vector192
vector192:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $192
  102330:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102335:	e9 f4 02 00 00       	jmp    10262e <__alltraps>

0010233a <vector193>:
.globl vector193
vector193:
  pushl $0
  10233a:	6a 00                	push   $0x0
  pushl $193
  10233c:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102341:	e9 e8 02 00 00       	jmp    10262e <__alltraps>

00102346 <vector194>:
.globl vector194
vector194:
  pushl $0
  102346:	6a 00                	push   $0x0
  pushl $194
  102348:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10234d:	e9 dc 02 00 00       	jmp    10262e <__alltraps>

00102352 <vector195>:
.globl vector195
vector195:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $195
  102354:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102359:	e9 d0 02 00 00       	jmp    10262e <__alltraps>

0010235e <vector196>:
.globl vector196
vector196:
  pushl $0
  10235e:	6a 00                	push   $0x0
  pushl $196
  102360:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102365:	e9 c4 02 00 00       	jmp    10262e <__alltraps>

0010236a <vector197>:
.globl vector197
vector197:
  pushl $0
  10236a:	6a 00                	push   $0x0
  pushl $197
  10236c:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102371:	e9 b8 02 00 00       	jmp    10262e <__alltraps>

00102376 <vector198>:
.globl vector198
vector198:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $198
  102378:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10237d:	e9 ac 02 00 00       	jmp    10262e <__alltraps>

00102382 <vector199>:
.globl vector199
vector199:
  pushl $0
  102382:	6a 00                	push   $0x0
  pushl $199
  102384:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102389:	e9 a0 02 00 00       	jmp    10262e <__alltraps>

0010238e <vector200>:
.globl vector200
vector200:
  pushl $0
  10238e:	6a 00                	push   $0x0
  pushl $200
  102390:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102395:	e9 94 02 00 00       	jmp    10262e <__alltraps>

0010239a <vector201>:
.globl vector201
vector201:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $201
  10239c:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023a1:	e9 88 02 00 00       	jmp    10262e <__alltraps>

001023a6 <vector202>:
.globl vector202
vector202:
  pushl $0
  1023a6:	6a 00                	push   $0x0
  pushl $202
  1023a8:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023ad:	e9 7c 02 00 00       	jmp    10262e <__alltraps>

001023b2 <vector203>:
.globl vector203
vector203:
  pushl $0
  1023b2:	6a 00                	push   $0x0
  pushl $203
  1023b4:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1023b9:	e9 70 02 00 00       	jmp    10262e <__alltraps>

001023be <vector204>:
.globl vector204
vector204:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $204
  1023c0:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023c5:	e9 64 02 00 00       	jmp    10262e <__alltraps>

001023ca <vector205>:
.globl vector205
vector205:
  pushl $0
  1023ca:	6a 00                	push   $0x0
  pushl $205
  1023cc:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023d1:	e9 58 02 00 00       	jmp    10262e <__alltraps>

001023d6 <vector206>:
.globl vector206
vector206:
  pushl $0
  1023d6:	6a 00                	push   $0x0
  pushl $206
  1023d8:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1023dd:	e9 4c 02 00 00       	jmp    10262e <__alltraps>

001023e2 <vector207>:
.globl vector207
vector207:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $207
  1023e4:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1023e9:	e9 40 02 00 00       	jmp    10262e <__alltraps>

001023ee <vector208>:
.globl vector208
vector208:
  pushl $0
  1023ee:	6a 00                	push   $0x0
  pushl $208
  1023f0:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1023f5:	e9 34 02 00 00       	jmp    10262e <__alltraps>

001023fa <vector209>:
.globl vector209
vector209:
  pushl $0
  1023fa:	6a 00                	push   $0x0
  pushl $209
  1023fc:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102401:	e9 28 02 00 00       	jmp    10262e <__alltraps>

00102406 <vector210>:
.globl vector210
vector210:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $210
  102408:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10240d:	e9 1c 02 00 00       	jmp    10262e <__alltraps>

00102412 <vector211>:
.globl vector211
vector211:
  pushl $0
  102412:	6a 00                	push   $0x0
  pushl $211
  102414:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102419:	e9 10 02 00 00       	jmp    10262e <__alltraps>

0010241e <vector212>:
.globl vector212
vector212:
  pushl $0
  10241e:	6a 00                	push   $0x0
  pushl $212
  102420:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102425:	e9 04 02 00 00       	jmp    10262e <__alltraps>

0010242a <vector213>:
.globl vector213
vector213:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $213
  10242c:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102431:	e9 f8 01 00 00       	jmp    10262e <__alltraps>

00102436 <vector214>:
.globl vector214
vector214:
  pushl $0
  102436:	6a 00                	push   $0x0
  pushl $214
  102438:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10243d:	e9 ec 01 00 00       	jmp    10262e <__alltraps>

00102442 <vector215>:
.globl vector215
vector215:
  pushl $0
  102442:	6a 00                	push   $0x0
  pushl $215
  102444:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102449:	e9 e0 01 00 00       	jmp    10262e <__alltraps>

0010244e <vector216>:
.globl vector216
vector216:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $216
  102450:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102455:	e9 d4 01 00 00       	jmp    10262e <__alltraps>

0010245a <vector217>:
.globl vector217
vector217:
  pushl $0
  10245a:	6a 00                	push   $0x0
  pushl $217
  10245c:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102461:	e9 c8 01 00 00       	jmp    10262e <__alltraps>

00102466 <vector218>:
.globl vector218
vector218:
  pushl $0
  102466:	6a 00                	push   $0x0
  pushl $218
  102468:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10246d:	e9 bc 01 00 00       	jmp    10262e <__alltraps>

00102472 <vector219>:
.globl vector219
vector219:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $219
  102474:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102479:	e9 b0 01 00 00       	jmp    10262e <__alltraps>

0010247e <vector220>:
.globl vector220
vector220:
  pushl $0
  10247e:	6a 00                	push   $0x0
  pushl $220
  102480:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102485:	e9 a4 01 00 00       	jmp    10262e <__alltraps>

0010248a <vector221>:
.globl vector221
vector221:
  pushl $0
  10248a:	6a 00                	push   $0x0
  pushl $221
  10248c:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102491:	e9 98 01 00 00       	jmp    10262e <__alltraps>

00102496 <vector222>:
.globl vector222
vector222:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $222
  102498:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10249d:	e9 8c 01 00 00       	jmp    10262e <__alltraps>

001024a2 <vector223>:
.globl vector223
vector223:
  pushl $0
  1024a2:	6a 00                	push   $0x0
  pushl $223
  1024a4:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024a9:	e9 80 01 00 00       	jmp    10262e <__alltraps>

001024ae <vector224>:
.globl vector224
vector224:
  pushl $0
  1024ae:	6a 00                	push   $0x0
  pushl $224
  1024b0:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1024b5:	e9 74 01 00 00       	jmp    10262e <__alltraps>

001024ba <vector225>:
.globl vector225
vector225:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $225
  1024bc:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024c1:	e9 68 01 00 00       	jmp    10262e <__alltraps>

001024c6 <vector226>:
.globl vector226
vector226:
  pushl $0
  1024c6:	6a 00                	push   $0x0
  pushl $226
  1024c8:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024cd:	e9 5c 01 00 00       	jmp    10262e <__alltraps>

001024d2 <vector227>:
.globl vector227
vector227:
  pushl $0
  1024d2:	6a 00                	push   $0x0
  pushl $227
  1024d4:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1024d9:	e9 50 01 00 00       	jmp    10262e <__alltraps>

001024de <vector228>:
.globl vector228
vector228:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $228
  1024e0:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1024e5:	e9 44 01 00 00       	jmp    10262e <__alltraps>

001024ea <vector229>:
.globl vector229
vector229:
  pushl $0
  1024ea:	6a 00                	push   $0x0
  pushl $229
  1024ec:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1024f1:	e9 38 01 00 00       	jmp    10262e <__alltraps>

001024f6 <vector230>:
.globl vector230
vector230:
  pushl $0
  1024f6:	6a 00                	push   $0x0
  pushl $230
  1024f8:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1024fd:	e9 2c 01 00 00       	jmp    10262e <__alltraps>

00102502 <vector231>:
.globl vector231
vector231:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $231
  102504:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102509:	e9 20 01 00 00       	jmp    10262e <__alltraps>

0010250e <vector232>:
.globl vector232
vector232:
  pushl $0
  10250e:	6a 00                	push   $0x0
  pushl $232
  102510:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102515:	e9 14 01 00 00       	jmp    10262e <__alltraps>

0010251a <vector233>:
.globl vector233
vector233:
  pushl $0
  10251a:	6a 00                	push   $0x0
  pushl $233
  10251c:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102521:	e9 08 01 00 00       	jmp    10262e <__alltraps>

00102526 <vector234>:
.globl vector234
vector234:
  pushl $0
  102526:	6a 00                	push   $0x0
  pushl $234
  102528:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10252d:	e9 fc 00 00 00       	jmp    10262e <__alltraps>

00102532 <vector235>:
.globl vector235
vector235:
  pushl $0
  102532:	6a 00                	push   $0x0
  pushl $235
  102534:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102539:	e9 f0 00 00 00       	jmp    10262e <__alltraps>

0010253e <vector236>:
.globl vector236
vector236:
  pushl $0
  10253e:	6a 00                	push   $0x0
  pushl $236
  102540:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102545:	e9 e4 00 00 00       	jmp    10262e <__alltraps>

0010254a <vector237>:
.globl vector237
vector237:
  pushl $0
  10254a:	6a 00                	push   $0x0
  pushl $237
  10254c:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102551:	e9 d8 00 00 00       	jmp    10262e <__alltraps>

00102556 <vector238>:
.globl vector238
vector238:
  pushl $0
  102556:	6a 00                	push   $0x0
  pushl $238
  102558:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10255d:	e9 cc 00 00 00       	jmp    10262e <__alltraps>

00102562 <vector239>:
.globl vector239
vector239:
  pushl $0
  102562:	6a 00                	push   $0x0
  pushl $239
  102564:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102569:	e9 c0 00 00 00       	jmp    10262e <__alltraps>

0010256e <vector240>:
.globl vector240
vector240:
  pushl $0
  10256e:	6a 00                	push   $0x0
  pushl $240
  102570:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102575:	e9 b4 00 00 00       	jmp    10262e <__alltraps>

0010257a <vector241>:
.globl vector241
vector241:
  pushl $0
  10257a:	6a 00                	push   $0x0
  pushl $241
  10257c:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102581:	e9 a8 00 00 00       	jmp    10262e <__alltraps>

00102586 <vector242>:
.globl vector242
vector242:
  pushl $0
  102586:	6a 00                	push   $0x0
  pushl $242
  102588:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10258d:	e9 9c 00 00 00       	jmp    10262e <__alltraps>

00102592 <vector243>:
.globl vector243
vector243:
  pushl $0
  102592:	6a 00                	push   $0x0
  pushl $243
  102594:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102599:	e9 90 00 00 00       	jmp    10262e <__alltraps>

0010259e <vector244>:
.globl vector244
vector244:
  pushl $0
  10259e:	6a 00                	push   $0x0
  pushl $244
  1025a0:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025a5:	e9 84 00 00 00       	jmp    10262e <__alltraps>

001025aa <vector245>:
.globl vector245
vector245:
  pushl $0
  1025aa:	6a 00                	push   $0x0
  pushl $245
  1025ac:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025b1:	e9 78 00 00 00       	jmp    10262e <__alltraps>

001025b6 <vector246>:
.globl vector246
vector246:
  pushl $0
  1025b6:	6a 00                	push   $0x0
  pushl $246
  1025b8:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025bd:	e9 6c 00 00 00       	jmp    10262e <__alltraps>

001025c2 <vector247>:
.globl vector247
vector247:
  pushl $0
  1025c2:	6a 00                	push   $0x0
  pushl $247
  1025c4:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025c9:	e9 60 00 00 00       	jmp    10262e <__alltraps>

001025ce <vector248>:
.globl vector248
vector248:
  pushl $0
  1025ce:	6a 00                	push   $0x0
  pushl $248
  1025d0:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025d5:	e9 54 00 00 00       	jmp    10262e <__alltraps>

001025da <vector249>:
.globl vector249
vector249:
  pushl $0
  1025da:	6a 00                	push   $0x0
  pushl $249
  1025dc:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1025e1:	e9 48 00 00 00       	jmp    10262e <__alltraps>

001025e6 <vector250>:
.globl vector250
vector250:
  pushl $0
  1025e6:	6a 00                	push   $0x0
  pushl $250
  1025e8:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1025ed:	e9 3c 00 00 00       	jmp    10262e <__alltraps>

001025f2 <vector251>:
.globl vector251
vector251:
  pushl $0
  1025f2:	6a 00                	push   $0x0
  pushl $251
  1025f4:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1025f9:	e9 30 00 00 00       	jmp    10262e <__alltraps>

001025fe <vector252>:
.globl vector252
vector252:
  pushl $0
  1025fe:	6a 00                	push   $0x0
  pushl $252
  102600:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102605:	e9 24 00 00 00       	jmp    10262e <__alltraps>

0010260a <vector253>:
.globl vector253
vector253:
  pushl $0
  10260a:	6a 00                	push   $0x0
  pushl $253
  10260c:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102611:	e9 18 00 00 00       	jmp    10262e <__alltraps>

00102616 <vector254>:
.globl vector254
vector254:
  pushl $0
  102616:	6a 00                	push   $0x0
  pushl $254
  102618:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10261d:	e9 0c 00 00 00       	jmp    10262e <__alltraps>

00102622 <vector255>:
.globl vector255
vector255:
  pushl $0
  102622:	6a 00                	push   $0x0
  pushl $255
  102624:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102629:	e9 00 00 00 00       	jmp    10262e <__alltraps>

0010262e <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10262e:	1e                   	push   %ds
    pushl %es
  10262f:	06                   	push   %es
    pushl %fs
  102630:	0f a0                	push   %fs
    pushl %gs
  102632:	0f a8                	push   %gs
    pushal
  102634:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102635:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10263a:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10263c:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10263e:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10263f:	e8 64 f5 ff ff       	call   101ba8 <trap>

    # pop the pushed stack pointer
    popl %esp
  102644:	5c                   	pop    %esp

00102645 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102645:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102646:	0f a9                	pop    %gs
    popl %fs
  102648:	0f a1                	pop    %fs
    popl %es
  10264a:	07                   	pop    %es
    popl %ds
  10264b:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10264c:	83 c4 08             	add    $0x8,%esp
    iret
  10264f:	cf                   	iret   

00102650 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102650:	55                   	push   %ebp
  102651:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102653:	8b 45 08             	mov    0x8(%ebp),%eax
  102656:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102659:	b8 23 00 00 00       	mov    $0x23,%eax
  10265e:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102660:	b8 23 00 00 00       	mov    $0x23,%eax
  102665:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102667:	b8 10 00 00 00       	mov    $0x10,%eax
  10266c:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10266e:	b8 10 00 00 00       	mov    $0x10,%eax
  102673:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102675:	b8 10 00 00 00       	mov    $0x10,%eax
  10267a:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10267c:	ea 83 26 10 00 08 00 	ljmp   $0x8,$0x102683
}
  102683:	90                   	nop
  102684:	5d                   	pop    %ebp
  102685:	c3                   	ret    

00102686 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102686:	55                   	push   %ebp
  102687:	89 e5                	mov    %esp,%ebp
  102689:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10268c:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102691:	05 00 04 00 00       	add    $0x400,%eax
  102696:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10269b:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1026a2:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1026a4:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1026ab:	68 00 
  1026ad:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026b2:	0f b7 c0             	movzwl %ax,%eax
  1026b5:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1026bb:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026c0:	c1 e8 10             	shr    $0x10,%eax
  1026c3:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1026c8:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026cf:	24 f0                	and    $0xf0,%al
  1026d1:	0c 09                	or     $0x9,%al
  1026d3:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026d8:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026df:	0c 10                	or     $0x10,%al
  1026e1:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026e6:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026ed:	24 9f                	and    $0x9f,%al
  1026ef:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026f4:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026fb:	0c 80                	or     $0x80,%al
  1026fd:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102702:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102709:	24 f0                	and    $0xf0,%al
  10270b:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102710:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102717:	24 ef                	and    $0xef,%al
  102719:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10271e:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102725:	24 df                	and    $0xdf,%al
  102727:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10272c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102733:	0c 40                	or     $0x40,%al
  102735:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10273a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102741:	24 7f                	and    $0x7f,%al
  102743:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102748:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10274d:	c1 e8 18             	shr    $0x18,%eax
  102750:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102755:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10275c:	24 ef                	and    $0xef,%al
  10275e:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102763:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  10276a:	e8 e1 fe ff ff       	call   102650 <lgdt>
  10276f:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102775:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102779:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  10277c:	90                   	nop
  10277d:	c9                   	leave  
  10277e:	c3                   	ret    

0010277f <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10277f:	55                   	push   %ebp
  102780:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102782:	e8 ff fe ff ff       	call   102686 <gdt_init>
}
  102787:	90                   	nop
  102788:	5d                   	pop    %ebp
  102789:	c3                   	ret    

0010278a <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10278a:	55                   	push   %ebp
  10278b:	89 e5                	mov    %esp,%ebp
  10278d:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102790:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102797:	eb 03                	jmp    10279c <strlen+0x12>
        cnt ++;
  102799:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  10279c:	8b 45 08             	mov    0x8(%ebp),%eax
  10279f:	8d 50 01             	lea    0x1(%eax),%edx
  1027a2:	89 55 08             	mov    %edx,0x8(%ebp)
  1027a5:	0f b6 00             	movzbl (%eax),%eax
  1027a8:	84 c0                	test   %al,%al
  1027aa:	75 ed                	jne    102799 <strlen+0xf>
    }
    return cnt;
  1027ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027af:	c9                   	leave  
  1027b0:	c3                   	ret    

001027b1 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1027b1:	55                   	push   %ebp
  1027b2:	89 e5                	mov    %esp,%ebp
  1027b4:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1027be:	eb 03                	jmp    1027c3 <strnlen+0x12>
        cnt ++;
  1027c0:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1027c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1027c6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1027c9:	73 10                	jae    1027db <strnlen+0x2a>
  1027cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1027ce:	8d 50 01             	lea    0x1(%eax),%edx
  1027d1:	89 55 08             	mov    %edx,0x8(%ebp)
  1027d4:	0f b6 00             	movzbl (%eax),%eax
  1027d7:	84 c0                	test   %al,%al
  1027d9:	75 e5                	jne    1027c0 <strnlen+0xf>
    }
    return cnt;
  1027db:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027de:	c9                   	leave  
  1027df:	c3                   	ret    

001027e0 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1027e0:	55                   	push   %ebp
  1027e1:	89 e5                	mov    %esp,%ebp
  1027e3:	57                   	push   %edi
  1027e4:	56                   	push   %esi
  1027e5:	83 ec 20             	sub    $0x20,%esp
  1027e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1027eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1027f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1027f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027fa:	89 d1                	mov    %edx,%ecx
  1027fc:	89 c2                	mov    %eax,%edx
  1027fe:	89 ce                	mov    %ecx,%esi
  102800:	89 d7                	mov    %edx,%edi
  102802:	ac                   	lods   %ds:(%esi),%al
  102803:	aa                   	stos   %al,%es:(%edi)
  102804:	84 c0                	test   %al,%al
  102806:	75 fa                	jne    102802 <strcpy+0x22>
  102808:	89 fa                	mov    %edi,%edx
  10280a:	89 f1                	mov    %esi,%ecx
  10280c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10280f:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102812:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102815:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102818:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102819:	83 c4 20             	add    $0x20,%esp
  10281c:	5e                   	pop    %esi
  10281d:	5f                   	pop    %edi
  10281e:	5d                   	pop    %ebp
  10281f:	c3                   	ret    

00102820 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102820:	55                   	push   %ebp
  102821:	89 e5                	mov    %esp,%ebp
  102823:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102826:	8b 45 08             	mov    0x8(%ebp),%eax
  102829:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10282c:	eb 1e                	jmp    10284c <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  10282e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102831:	0f b6 10             	movzbl (%eax),%edx
  102834:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102837:	88 10                	mov    %dl,(%eax)
  102839:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10283c:	0f b6 00             	movzbl (%eax),%eax
  10283f:	84 c0                	test   %al,%al
  102841:	74 03                	je     102846 <strncpy+0x26>
            src ++;
  102843:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102846:	ff 45 fc             	incl   -0x4(%ebp)
  102849:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  10284c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102850:	75 dc                	jne    10282e <strncpy+0xe>
    }
    return dst;
  102852:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102855:	c9                   	leave  
  102856:	c3                   	ret    

00102857 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102857:	55                   	push   %ebp
  102858:	89 e5                	mov    %esp,%ebp
  10285a:	57                   	push   %edi
  10285b:	56                   	push   %esi
  10285c:	83 ec 20             	sub    $0x20,%esp
  10285f:	8b 45 08             	mov    0x8(%ebp),%eax
  102862:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102865:	8b 45 0c             	mov    0xc(%ebp),%eax
  102868:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  10286b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10286e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102871:	89 d1                	mov    %edx,%ecx
  102873:	89 c2                	mov    %eax,%edx
  102875:	89 ce                	mov    %ecx,%esi
  102877:	89 d7                	mov    %edx,%edi
  102879:	ac                   	lods   %ds:(%esi),%al
  10287a:	ae                   	scas   %es:(%edi),%al
  10287b:	75 08                	jne    102885 <strcmp+0x2e>
  10287d:	84 c0                	test   %al,%al
  10287f:	75 f8                	jne    102879 <strcmp+0x22>
  102881:	31 c0                	xor    %eax,%eax
  102883:	eb 04                	jmp    102889 <strcmp+0x32>
  102885:	19 c0                	sbb    %eax,%eax
  102887:	0c 01                	or     $0x1,%al
  102889:	89 fa                	mov    %edi,%edx
  10288b:	89 f1                	mov    %esi,%ecx
  10288d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102890:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102893:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102896:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102899:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10289a:	83 c4 20             	add    $0x20,%esp
  10289d:	5e                   	pop    %esi
  10289e:	5f                   	pop    %edi
  10289f:	5d                   	pop    %ebp
  1028a0:	c3                   	ret    

001028a1 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1028a1:	55                   	push   %ebp
  1028a2:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028a4:	eb 09                	jmp    1028af <strncmp+0xe>
        n --, s1 ++, s2 ++;
  1028a6:	ff 4d 10             	decl   0x10(%ebp)
  1028a9:	ff 45 08             	incl   0x8(%ebp)
  1028ac:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028af:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028b3:	74 1a                	je     1028cf <strncmp+0x2e>
  1028b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b8:	0f b6 00             	movzbl (%eax),%eax
  1028bb:	84 c0                	test   %al,%al
  1028bd:	74 10                	je     1028cf <strncmp+0x2e>
  1028bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c2:	0f b6 10             	movzbl (%eax),%edx
  1028c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028c8:	0f b6 00             	movzbl (%eax),%eax
  1028cb:	38 c2                	cmp    %al,%dl
  1028cd:	74 d7                	je     1028a6 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1028cf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028d3:	74 18                	je     1028ed <strncmp+0x4c>
  1028d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d8:	0f b6 00             	movzbl (%eax),%eax
  1028db:	0f b6 d0             	movzbl %al,%edx
  1028de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028e1:	0f b6 00             	movzbl (%eax),%eax
  1028e4:	0f b6 c0             	movzbl %al,%eax
  1028e7:	29 c2                	sub    %eax,%edx
  1028e9:	89 d0                	mov    %edx,%eax
  1028eb:	eb 05                	jmp    1028f2 <strncmp+0x51>
  1028ed:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1028f2:	5d                   	pop    %ebp
  1028f3:	c3                   	ret    

001028f4 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1028f4:	55                   	push   %ebp
  1028f5:	89 e5                	mov    %esp,%ebp
  1028f7:	83 ec 04             	sub    $0x4,%esp
  1028fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028fd:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102900:	eb 13                	jmp    102915 <strchr+0x21>
        if (*s == c) {
  102902:	8b 45 08             	mov    0x8(%ebp),%eax
  102905:	0f b6 00             	movzbl (%eax),%eax
  102908:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10290b:	75 05                	jne    102912 <strchr+0x1e>
            return (char *)s;
  10290d:	8b 45 08             	mov    0x8(%ebp),%eax
  102910:	eb 12                	jmp    102924 <strchr+0x30>
        }
        s ++;
  102912:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102915:	8b 45 08             	mov    0x8(%ebp),%eax
  102918:	0f b6 00             	movzbl (%eax),%eax
  10291b:	84 c0                	test   %al,%al
  10291d:	75 e3                	jne    102902 <strchr+0xe>
    }
    return NULL;
  10291f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102924:	c9                   	leave  
  102925:	c3                   	ret    

00102926 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102926:	55                   	push   %ebp
  102927:	89 e5                	mov    %esp,%ebp
  102929:	83 ec 04             	sub    $0x4,%esp
  10292c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10292f:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102932:	eb 0e                	jmp    102942 <strfind+0x1c>
        if (*s == c) {
  102934:	8b 45 08             	mov    0x8(%ebp),%eax
  102937:	0f b6 00             	movzbl (%eax),%eax
  10293a:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10293d:	74 0f                	je     10294e <strfind+0x28>
            break;
        }
        s ++;
  10293f:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102942:	8b 45 08             	mov    0x8(%ebp),%eax
  102945:	0f b6 00             	movzbl (%eax),%eax
  102948:	84 c0                	test   %al,%al
  10294a:	75 e8                	jne    102934 <strfind+0xe>
  10294c:	eb 01                	jmp    10294f <strfind+0x29>
            break;
  10294e:	90                   	nop
    }
    return (char *)s;
  10294f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102952:	c9                   	leave  
  102953:	c3                   	ret    

00102954 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102954:	55                   	push   %ebp
  102955:	89 e5                	mov    %esp,%ebp
  102957:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10295a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102961:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102968:	eb 03                	jmp    10296d <strtol+0x19>
        s ++;
  10296a:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  10296d:	8b 45 08             	mov    0x8(%ebp),%eax
  102970:	0f b6 00             	movzbl (%eax),%eax
  102973:	3c 20                	cmp    $0x20,%al
  102975:	74 f3                	je     10296a <strtol+0x16>
  102977:	8b 45 08             	mov    0x8(%ebp),%eax
  10297a:	0f b6 00             	movzbl (%eax),%eax
  10297d:	3c 09                	cmp    $0x9,%al
  10297f:	74 e9                	je     10296a <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102981:	8b 45 08             	mov    0x8(%ebp),%eax
  102984:	0f b6 00             	movzbl (%eax),%eax
  102987:	3c 2b                	cmp    $0x2b,%al
  102989:	75 05                	jne    102990 <strtol+0x3c>
        s ++;
  10298b:	ff 45 08             	incl   0x8(%ebp)
  10298e:	eb 14                	jmp    1029a4 <strtol+0x50>
    }
    else if (*s == '-') {
  102990:	8b 45 08             	mov    0x8(%ebp),%eax
  102993:	0f b6 00             	movzbl (%eax),%eax
  102996:	3c 2d                	cmp    $0x2d,%al
  102998:	75 0a                	jne    1029a4 <strtol+0x50>
        s ++, neg = 1;
  10299a:	ff 45 08             	incl   0x8(%ebp)
  10299d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1029a4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029a8:	74 06                	je     1029b0 <strtol+0x5c>
  1029aa:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1029ae:	75 22                	jne    1029d2 <strtol+0x7e>
  1029b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b3:	0f b6 00             	movzbl (%eax),%eax
  1029b6:	3c 30                	cmp    $0x30,%al
  1029b8:	75 18                	jne    1029d2 <strtol+0x7e>
  1029ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1029bd:	40                   	inc    %eax
  1029be:	0f b6 00             	movzbl (%eax),%eax
  1029c1:	3c 78                	cmp    $0x78,%al
  1029c3:	75 0d                	jne    1029d2 <strtol+0x7e>
        s += 2, base = 16;
  1029c5:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1029c9:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1029d0:	eb 29                	jmp    1029fb <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  1029d2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029d6:	75 16                	jne    1029ee <strtol+0x9a>
  1029d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029db:	0f b6 00             	movzbl (%eax),%eax
  1029de:	3c 30                	cmp    $0x30,%al
  1029e0:	75 0c                	jne    1029ee <strtol+0x9a>
        s ++, base = 8;
  1029e2:	ff 45 08             	incl   0x8(%ebp)
  1029e5:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1029ec:	eb 0d                	jmp    1029fb <strtol+0xa7>
    }
    else if (base == 0) {
  1029ee:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f2:	75 07                	jne    1029fb <strtol+0xa7>
        base = 10;
  1029f4:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1029fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fe:	0f b6 00             	movzbl (%eax),%eax
  102a01:	3c 2f                	cmp    $0x2f,%al
  102a03:	7e 1b                	jle    102a20 <strtol+0xcc>
  102a05:	8b 45 08             	mov    0x8(%ebp),%eax
  102a08:	0f b6 00             	movzbl (%eax),%eax
  102a0b:	3c 39                	cmp    $0x39,%al
  102a0d:	7f 11                	jg     102a20 <strtol+0xcc>
            dig = *s - '0';
  102a0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a12:	0f b6 00             	movzbl (%eax),%eax
  102a15:	0f be c0             	movsbl %al,%eax
  102a18:	83 e8 30             	sub    $0x30,%eax
  102a1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a1e:	eb 48                	jmp    102a68 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102a20:	8b 45 08             	mov    0x8(%ebp),%eax
  102a23:	0f b6 00             	movzbl (%eax),%eax
  102a26:	3c 60                	cmp    $0x60,%al
  102a28:	7e 1b                	jle    102a45 <strtol+0xf1>
  102a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a2d:	0f b6 00             	movzbl (%eax),%eax
  102a30:	3c 7a                	cmp    $0x7a,%al
  102a32:	7f 11                	jg     102a45 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102a34:	8b 45 08             	mov    0x8(%ebp),%eax
  102a37:	0f b6 00             	movzbl (%eax),%eax
  102a3a:	0f be c0             	movsbl %al,%eax
  102a3d:	83 e8 57             	sub    $0x57,%eax
  102a40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a43:	eb 23                	jmp    102a68 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102a45:	8b 45 08             	mov    0x8(%ebp),%eax
  102a48:	0f b6 00             	movzbl (%eax),%eax
  102a4b:	3c 40                	cmp    $0x40,%al
  102a4d:	7e 3b                	jle    102a8a <strtol+0x136>
  102a4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a52:	0f b6 00             	movzbl (%eax),%eax
  102a55:	3c 5a                	cmp    $0x5a,%al
  102a57:	7f 31                	jg     102a8a <strtol+0x136>
            dig = *s - 'A' + 10;
  102a59:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5c:	0f b6 00             	movzbl (%eax),%eax
  102a5f:	0f be c0             	movsbl %al,%eax
  102a62:	83 e8 37             	sub    $0x37,%eax
  102a65:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102a68:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a6b:	3b 45 10             	cmp    0x10(%ebp),%eax
  102a6e:	7d 19                	jge    102a89 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102a70:	ff 45 08             	incl   0x8(%ebp)
  102a73:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a76:	0f af 45 10          	imul   0x10(%ebp),%eax
  102a7a:	89 c2                	mov    %eax,%edx
  102a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a7f:	01 d0                	add    %edx,%eax
  102a81:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102a84:	e9 72 ff ff ff       	jmp    1029fb <strtol+0xa7>
            break;
  102a89:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102a8a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a8e:	74 08                	je     102a98 <strtol+0x144>
        *endptr = (char *) s;
  102a90:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a93:	8b 55 08             	mov    0x8(%ebp),%edx
  102a96:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102a98:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102a9c:	74 07                	je     102aa5 <strtol+0x151>
  102a9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102aa1:	f7 d8                	neg    %eax
  102aa3:	eb 03                	jmp    102aa8 <strtol+0x154>
  102aa5:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102aa8:	c9                   	leave  
  102aa9:	c3                   	ret    

00102aaa <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102aaa:	55                   	push   %ebp
  102aab:	89 e5                	mov    %esp,%ebp
  102aad:	57                   	push   %edi
  102aae:	83 ec 24             	sub    $0x24,%esp
  102ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ab4:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102ab7:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102abb:	8b 55 08             	mov    0x8(%ebp),%edx
  102abe:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ac1:	88 45 f7             	mov    %al,-0x9(%ebp)
  102ac4:	8b 45 10             	mov    0x10(%ebp),%eax
  102ac7:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102aca:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102acd:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102ad1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102ad4:	89 d7                	mov    %edx,%edi
  102ad6:	f3 aa                	rep stos %al,%es:(%edi)
  102ad8:	89 fa                	mov    %edi,%edx
  102ada:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102add:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102ae0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ae3:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102ae4:	83 c4 24             	add    $0x24,%esp
  102ae7:	5f                   	pop    %edi
  102ae8:	5d                   	pop    %ebp
  102ae9:	c3                   	ret    

00102aea <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102aea:	55                   	push   %ebp
  102aeb:	89 e5                	mov    %esp,%ebp
  102aed:	57                   	push   %edi
  102aee:	56                   	push   %esi
  102aef:	53                   	push   %ebx
  102af0:	83 ec 30             	sub    $0x30,%esp
  102af3:	8b 45 08             	mov    0x8(%ebp),%eax
  102af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102af9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102afc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102aff:	8b 45 10             	mov    0x10(%ebp),%eax
  102b02:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102b05:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b08:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102b0b:	73 42                	jae    102b4f <memmove+0x65>
  102b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102b13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b16:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102b19:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102b1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b22:	c1 e8 02             	shr    $0x2,%eax
  102b25:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102b27:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b2d:	89 d7                	mov    %edx,%edi
  102b2f:	89 c6                	mov    %eax,%esi
  102b31:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102b33:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102b36:	83 e1 03             	and    $0x3,%ecx
  102b39:	74 02                	je     102b3d <memmove+0x53>
  102b3b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b3d:	89 f0                	mov    %esi,%eax
  102b3f:	89 fa                	mov    %edi,%edx
  102b41:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102b44:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102b47:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102b4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102b4d:	eb 36                	jmp    102b85 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102b4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b52:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b55:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b58:	01 c2                	add    %eax,%edx
  102b5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b5d:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102b60:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b63:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102b66:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b69:	89 c1                	mov    %eax,%ecx
  102b6b:	89 d8                	mov    %ebx,%eax
  102b6d:	89 d6                	mov    %edx,%esi
  102b6f:	89 c7                	mov    %eax,%edi
  102b71:	fd                   	std    
  102b72:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b74:	fc                   	cld    
  102b75:	89 f8                	mov    %edi,%eax
  102b77:	89 f2                	mov    %esi,%edx
  102b79:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102b7c:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102b7f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102b82:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102b85:	83 c4 30             	add    $0x30,%esp
  102b88:	5b                   	pop    %ebx
  102b89:	5e                   	pop    %esi
  102b8a:	5f                   	pop    %edi
  102b8b:	5d                   	pop    %ebp
  102b8c:	c3                   	ret    

00102b8d <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102b8d:	55                   	push   %ebp
  102b8e:	89 e5                	mov    %esp,%ebp
  102b90:	57                   	push   %edi
  102b91:	56                   	push   %esi
  102b92:	83 ec 20             	sub    $0x20,%esp
  102b95:	8b 45 08             	mov    0x8(%ebp),%eax
  102b98:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ba1:	8b 45 10             	mov    0x10(%ebp),%eax
  102ba4:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ba7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102baa:	c1 e8 02             	shr    $0x2,%eax
  102bad:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102baf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bb5:	89 d7                	mov    %edx,%edi
  102bb7:	89 c6                	mov    %eax,%esi
  102bb9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102bbb:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102bbe:	83 e1 03             	and    $0x3,%ecx
  102bc1:	74 02                	je     102bc5 <memcpy+0x38>
  102bc3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102bc5:	89 f0                	mov    %esi,%eax
  102bc7:	89 fa                	mov    %edi,%edx
  102bc9:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bcc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102bcf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102bd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102bd5:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102bd6:	83 c4 20             	add    $0x20,%esp
  102bd9:	5e                   	pop    %esi
  102bda:	5f                   	pop    %edi
  102bdb:	5d                   	pop    %ebp
  102bdc:	c3                   	ret    

00102bdd <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102bdd:	55                   	push   %ebp
  102bde:	89 e5                	mov    %esp,%ebp
  102be0:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102be3:	8b 45 08             	mov    0x8(%ebp),%eax
  102be6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102be9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bec:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102bef:	eb 2e                	jmp    102c1f <memcmp+0x42>
        if (*s1 != *s2) {
  102bf1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bf4:	0f b6 10             	movzbl (%eax),%edx
  102bf7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bfa:	0f b6 00             	movzbl (%eax),%eax
  102bfd:	38 c2                	cmp    %al,%dl
  102bff:	74 18                	je     102c19 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c01:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c04:	0f b6 00             	movzbl (%eax),%eax
  102c07:	0f b6 d0             	movzbl %al,%edx
  102c0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c0d:	0f b6 00             	movzbl (%eax),%eax
  102c10:	0f b6 c0             	movzbl %al,%eax
  102c13:	29 c2                	sub    %eax,%edx
  102c15:	89 d0                	mov    %edx,%eax
  102c17:	eb 18                	jmp    102c31 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102c19:	ff 45 fc             	incl   -0x4(%ebp)
  102c1c:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102c1f:	8b 45 10             	mov    0x10(%ebp),%eax
  102c22:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c25:	89 55 10             	mov    %edx,0x10(%ebp)
  102c28:	85 c0                	test   %eax,%eax
  102c2a:	75 c5                	jne    102bf1 <memcmp+0x14>
    }
    return 0;
  102c2c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c31:	c9                   	leave  
  102c32:	c3                   	ret    

00102c33 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102c33:	55                   	push   %ebp
  102c34:	89 e5                	mov    %esp,%ebp
  102c36:	83 ec 58             	sub    $0x58,%esp
  102c39:	8b 45 10             	mov    0x10(%ebp),%eax
  102c3c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102c3f:	8b 45 14             	mov    0x14(%ebp),%eax
  102c42:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102c45:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102c48:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102c4b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c4e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102c51:	8b 45 18             	mov    0x18(%ebp),%eax
  102c54:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c57:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c5a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c5d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c60:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c69:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102c6d:	74 1c                	je     102c8b <printnum+0x58>
  102c6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c72:	ba 00 00 00 00       	mov    $0x0,%edx
  102c77:	f7 75 e4             	divl   -0x1c(%ebp)
  102c7a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c80:	ba 00 00 00 00       	mov    $0x0,%edx
  102c85:	f7 75 e4             	divl   -0x1c(%ebp)
  102c88:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c8e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c91:	f7 75 e4             	divl   -0x1c(%ebp)
  102c94:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c97:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102c9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c9d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ca0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ca3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102ca6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ca9:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102cac:	8b 45 18             	mov    0x18(%ebp),%eax
  102caf:	ba 00 00 00 00       	mov    $0x0,%edx
  102cb4:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102cb7:	72 56                	jb     102d0f <printnum+0xdc>
  102cb9:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102cbc:	77 05                	ja     102cc3 <printnum+0x90>
  102cbe:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102cc1:	72 4c                	jb     102d0f <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102cc3:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102cc6:	8d 50 ff             	lea    -0x1(%eax),%edx
  102cc9:	8b 45 20             	mov    0x20(%ebp),%eax
  102ccc:	89 44 24 18          	mov    %eax,0x18(%esp)
  102cd0:	89 54 24 14          	mov    %edx,0x14(%esp)
  102cd4:	8b 45 18             	mov    0x18(%ebp),%eax
  102cd7:	89 44 24 10          	mov    %eax,0x10(%esp)
  102cdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cde:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ce1:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ce5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102ce9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cec:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf3:	89 04 24             	mov    %eax,(%esp)
  102cf6:	e8 38 ff ff ff       	call   102c33 <printnum>
  102cfb:	eb 1b                	jmp    102d18 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d00:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d04:	8b 45 20             	mov    0x20(%ebp),%eax
  102d07:	89 04 24             	mov    %eax,(%esp)
  102d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0d:	ff d0                	call   *%eax
        while (-- width > 0)
  102d0f:	ff 4d 1c             	decl   0x1c(%ebp)
  102d12:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102d16:	7f e5                	jg     102cfd <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102d18:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102d1b:	05 50 3a 10 00       	add    $0x103a50,%eax
  102d20:	0f b6 00             	movzbl (%eax),%eax
  102d23:	0f be c0             	movsbl %al,%eax
  102d26:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d29:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d2d:	89 04 24             	mov    %eax,(%esp)
  102d30:	8b 45 08             	mov    0x8(%ebp),%eax
  102d33:	ff d0                	call   *%eax
}
  102d35:	90                   	nop
  102d36:	c9                   	leave  
  102d37:	c3                   	ret    

00102d38 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102d38:	55                   	push   %ebp
  102d39:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d3b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d3f:	7e 14                	jle    102d55 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102d41:	8b 45 08             	mov    0x8(%ebp),%eax
  102d44:	8b 00                	mov    (%eax),%eax
  102d46:	8d 48 08             	lea    0x8(%eax),%ecx
  102d49:	8b 55 08             	mov    0x8(%ebp),%edx
  102d4c:	89 0a                	mov    %ecx,(%edx)
  102d4e:	8b 50 04             	mov    0x4(%eax),%edx
  102d51:	8b 00                	mov    (%eax),%eax
  102d53:	eb 30                	jmp    102d85 <getuint+0x4d>
    }
    else if (lflag) {
  102d55:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d59:	74 16                	je     102d71 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102d5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5e:	8b 00                	mov    (%eax),%eax
  102d60:	8d 48 04             	lea    0x4(%eax),%ecx
  102d63:	8b 55 08             	mov    0x8(%ebp),%edx
  102d66:	89 0a                	mov    %ecx,(%edx)
  102d68:	8b 00                	mov    (%eax),%eax
  102d6a:	ba 00 00 00 00       	mov    $0x0,%edx
  102d6f:	eb 14                	jmp    102d85 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102d71:	8b 45 08             	mov    0x8(%ebp),%eax
  102d74:	8b 00                	mov    (%eax),%eax
  102d76:	8d 48 04             	lea    0x4(%eax),%ecx
  102d79:	8b 55 08             	mov    0x8(%ebp),%edx
  102d7c:	89 0a                	mov    %ecx,(%edx)
  102d7e:	8b 00                	mov    (%eax),%eax
  102d80:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102d85:	5d                   	pop    %ebp
  102d86:	c3                   	ret    

00102d87 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102d87:	55                   	push   %ebp
  102d88:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d8a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d8e:	7e 14                	jle    102da4 <getint+0x1d>
        return va_arg(*ap, long long);
  102d90:	8b 45 08             	mov    0x8(%ebp),%eax
  102d93:	8b 00                	mov    (%eax),%eax
  102d95:	8d 48 08             	lea    0x8(%eax),%ecx
  102d98:	8b 55 08             	mov    0x8(%ebp),%edx
  102d9b:	89 0a                	mov    %ecx,(%edx)
  102d9d:	8b 50 04             	mov    0x4(%eax),%edx
  102da0:	8b 00                	mov    (%eax),%eax
  102da2:	eb 28                	jmp    102dcc <getint+0x45>
    }
    else if (lflag) {
  102da4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102da8:	74 12                	je     102dbc <getint+0x35>
        return va_arg(*ap, long);
  102daa:	8b 45 08             	mov    0x8(%ebp),%eax
  102dad:	8b 00                	mov    (%eax),%eax
  102daf:	8d 48 04             	lea    0x4(%eax),%ecx
  102db2:	8b 55 08             	mov    0x8(%ebp),%edx
  102db5:	89 0a                	mov    %ecx,(%edx)
  102db7:	8b 00                	mov    (%eax),%eax
  102db9:	99                   	cltd   
  102dba:	eb 10                	jmp    102dcc <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102dbc:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbf:	8b 00                	mov    (%eax),%eax
  102dc1:	8d 48 04             	lea    0x4(%eax),%ecx
  102dc4:	8b 55 08             	mov    0x8(%ebp),%edx
  102dc7:	89 0a                	mov    %ecx,(%edx)
  102dc9:	8b 00                	mov    (%eax),%eax
  102dcb:	99                   	cltd   
    }
}
  102dcc:	5d                   	pop    %ebp
  102dcd:	c3                   	ret    

00102dce <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102dce:	55                   	push   %ebp
  102dcf:	89 e5                	mov    %esp,%ebp
  102dd1:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102dd4:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ddd:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102de1:	8b 45 10             	mov    0x10(%ebp),%eax
  102de4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102de8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102deb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102def:	8b 45 08             	mov    0x8(%ebp),%eax
  102df2:	89 04 24             	mov    %eax,(%esp)
  102df5:	e8 03 00 00 00       	call   102dfd <vprintfmt>
    va_end(ap);
}
  102dfa:	90                   	nop
  102dfb:	c9                   	leave  
  102dfc:	c3                   	ret    

00102dfd <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102dfd:	55                   	push   %ebp
  102dfe:	89 e5                	mov    %esp,%ebp
  102e00:	56                   	push   %esi
  102e01:	53                   	push   %ebx
  102e02:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e05:	eb 17                	jmp    102e1e <vprintfmt+0x21>
            if (ch == '\0') {
  102e07:	85 db                	test   %ebx,%ebx
  102e09:	0f 84 bf 03 00 00    	je     1031ce <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102e0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e12:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e16:	89 1c 24             	mov    %ebx,(%esp)
  102e19:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1c:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e1e:	8b 45 10             	mov    0x10(%ebp),%eax
  102e21:	8d 50 01             	lea    0x1(%eax),%edx
  102e24:	89 55 10             	mov    %edx,0x10(%ebp)
  102e27:	0f b6 00             	movzbl (%eax),%eax
  102e2a:	0f b6 d8             	movzbl %al,%ebx
  102e2d:	83 fb 25             	cmp    $0x25,%ebx
  102e30:	75 d5                	jne    102e07 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102e32:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102e36:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102e3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e40:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102e43:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102e4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e4d:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102e50:	8b 45 10             	mov    0x10(%ebp),%eax
  102e53:	8d 50 01             	lea    0x1(%eax),%edx
  102e56:	89 55 10             	mov    %edx,0x10(%ebp)
  102e59:	0f b6 00             	movzbl (%eax),%eax
  102e5c:	0f b6 d8             	movzbl %al,%ebx
  102e5f:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102e62:	83 f8 55             	cmp    $0x55,%eax
  102e65:	0f 87 37 03 00 00    	ja     1031a2 <vprintfmt+0x3a5>
  102e6b:	8b 04 85 74 3a 10 00 	mov    0x103a74(,%eax,4),%eax
  102e72:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102e74:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102e78:	eb d6                	jmp    102e50 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102e7a:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102e7e:	eb d0                	jmp    102e50 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102e80:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102e87:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e8a:	89 d0                	mov    %edx,%eax
  102e8c:	c1 e0 02             	shl    $0x2,%eax
  102e8f:	01 d0                	add    %edx,%eax
  102e91:	01 c0                	add    %eax,%eax
  102e93:	01 d8                	add    %ebx,%eax
  102e95:	83 e8 30             	sub    $0x30,%eax
  102e98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102e9b:	8b 45 10             	mov    0x10(%ebp),%eax
  102e9e:	0f b6 00             	movzbl (%eax),%eax
  102ea1:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102ea4:	83 fb 2f             	cmp    $0x2f,%ebx
  102ea7:	7e 38                	jle    102ee1 <vprintfmt+0xe4>
  102ea9:	83 fb 39             	cmp    $0x39,%ebx
  102eac:	7f 33                	jg     102ee1 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102eae:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102eb1:	eb d4                	jmp    102e87 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102eb3:	8b 45 14             	mov    0x14(%ebp),%eax
  102eb6:	8d 50 04             	lea    0x4(%eax),%edx
  102eb9:	89 55 14             	mov    %edx,0x14(%ebp)
  102ebc:	8b 00                	mov    (%eax),%eax
  102ebe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102ec1:	eb 1f                	jmp    102ee2 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102ec3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ec7:	79 87                	jns    102e50 <vprintfmt+0x53>
                width = 0;
  102ec9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102ed0:	e9 7b ff ff ff       	jmp    102e50 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102ed5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102edc:	e9 6f ff ff ff       	jmp    102e50 <vprintfmt+0x53>
            goto process_precision;
  102ee1:	90                   	nop

        process_precision:
            if (width < 0)
  102ee2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ee6:	0f 89 64 ff ff ff    	jns    102e50 <vprintfmt+0x53>
                width = precision, precision = -1;
  102eec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102eef:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ef2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102ef9:	e9 52 ff ff ff       	jmp    102e50 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102efe:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102f01:	e9 4a ff ff ff       	jmp    102e50 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102f06:	8b 45 14             	mov    0x14(%ebp),%eax
  102f09:	8d 50 04             	lea    0x4(%eax),%edx
  102f0c:	89 55 14             	mov    %edx,0x14(%ebp)
  102f0f:	8b 00                	mov    (%eax),%eax
  102f11:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f14:	89 54 24 04          	mov    %edx,0x4(%esp)
  102f18:	89 04 24             	mov    %eax,(%esp)
  102f1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1e:	ff d0                	call   *%eax
            break;
  102f20:	e9 a4 02 00 00       	jmp    1031c9 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102f25:	8b 45 14             	mov    0x14(%ebp),%eax
  102f28:	8d 50 04             	lea    0x4(%eax),%edx
  102f2b:	89 55 14             	mov    %edx,0x14(%ebp)
  102f2e:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102f30:	85 db                	test   %ebx,%ebx
  102f32:	79 02                	jns    102f36 <vprintfmt+0x139>
                err = -err;
  102f34:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102f36:	83 fb 06             	cmp    $0x6,%ebx
  102f39:	7f 0b                	jg     102f46 <vprintfmt+0x149>
  102f3b:	8b 34 9d 34 3a 10 00 	mov    0x103a34(,%ebx,4),%esi
  102f42:	85 f6                	test   %esi,%esi
  102f44:	75 23                	jne    102f69 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102f46:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102f4a:	c7 44 24 08 61 3a 10 	movl   $0x103a61,0x8(%esp)
  102f51:	00 
  102f52:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f55:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f59:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5c:	89 04 24             	mov    %eax,(%esp)
  102f5f:	e8 6a fe ff ff       	call   102dce <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102f64:	e9 60 02 00 00       	jmp    1031c9 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102f69:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102f6d:	c7 44 24 08 6a 3a 10 	movl   $0x103a6a,0x8(%esp)
  102f74:	00 
  102f75:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f78:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f7f:	89 04 24             	mov    %eax,(%esp)
  102f82:	e8 47 fe ff ff       	call   102dce <printfmt>
            break;
  102f87:	e9 3d 02 00 00       	jmp    1031c9 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102f8c:	8b 45 14             	mov    0x14(%ebp),%eax
  102f8f:	8d 50 04             	lea    0x4(%eax),%edx
  102f92:	89 55 14             	mov    %edx,0x14(%ebp)
  102f95:	8b 30                	mov    (%eax),%esi
  102f97:	85 f6                	test   %esi,%esi
  102f99:	75 05                	jne    102fa0 <vprintfmt+0x1a3>
                p = "(null)";
  102f9b:	be 6d 3a 10 00       	mov    $0x103a6d,%esi
            }
            if (width > 0 && padc != '-') {
  102fa0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fa4:	7e 76                	jle    10301c <vprintfmt+0x21f>
  102fa6:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102faa:	74 70                	je     10301c <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102fac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102faf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fb3:	89 34 24             	mov    %esi,(%esp)
  102fb6:	e8 f6 f7 ff ff       	call   1027b1 <strnlen>
  102fbb:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102fbe:	29 c2                	sub    %eax,%edx
  102fc0:	89 d0                	mov    %edx,%eax
  102fc2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fc5:	eb 16                	jmp    102fdd <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102fc7:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102fcb:	8b 55 0c             	mov    0xc(%ebp),%edx
  102fce:	89 54 24 04          	mov    %edx,0x4(%esp)
  102fd2:	89 04 24             	mov    %eax,(%esp)
  102fd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd8:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102fda:	ff 4d e8             	decl   -0x18(%ebp)
  102fdd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fe1:	7f e4                	jg     102fc7 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102fe3:	eb 37                	jmp    10301c <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102fe5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102fe9:	74 1f                	je     10300a <vprintfmt+0x20d>
  102feb:	83 fb 1f             	cmp    $0x1f,%ebx
  102fee:	7e 05                	jle    102ff5 <vprintfmt+0x1f8>
  102ff0:	83 fb 7e             	cmp    $0x7e,%ebx
  102ff3:	7e 15                	jle    10300a <vprintfmt+0x20d>
                    putch('?', putdat);
  102ff5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ff8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ffc:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103003:	8b 45 08             	mov    0x8(%ebp),%eax
  103006:	ff d0                	call   *%eax
  103008:	eb 0f                	jmp    103019 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  10300a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10300d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103011:	89 1c 24             	mov    %ebx,(%esp)
  103014:	8b 45 08             	mov    0x8(%ebp),%eax
  103017:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103019:	ff 4d e8             	decl   -0x18(%ebp)
  10301c:	89 f0                	mov    %esi,%eax
  10301e:	8d 70 01             	lea    0x1(%eax),%esi
  103021:	0f b6 00             	movzbl (%eax),%eax
  103024:	0f be d8             	movsbl %al,%ebx
  103027:	85 db                	test   %ebx,%ebx
  103029:	74 27                	je     103052 <vprintfmt+0x255>
  10302b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10302f:	78 b4                	js     102fe5 <vprintfmt+0x1e8>
  103031:	ff 4d e4             	decl   -0x1c(%ebp)
  103034:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103038:	79 ab                	jns    102fe5 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  10303a:	eb 16                	jmp    103052 <vprintfmt+0x255>
                putch(' ', putdat);
  10303c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10303f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103043:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10304a:	8b 45 08             	mov    0x8(%ebp),%eax
  10304d:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10304f:	ff 4d e8             	decl   -0x18(%ebp)
  103052:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103056:	7f e4                	jg     10303c <vprintfmt+0x23f>
            }
            break;
  103058:	e9 6c 01 00 00       	jmp    1031c9 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10305d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103060:	89 44 24 04          	mov    %eax,0x4(%esp)
  103064:	8d 45 14             	lea    0x14(%ebp),%eax
  103067:	89 04 24             	mov    %eax,(%esp)
  10306a:	e8 18 fd ff ff       	call   102d87 <getint>
  10306f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103072:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103075:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103078:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10307b:	85 d2                	test   %edx,%edx
  10307d:	79 26                	jns    1030a5 <vprintfmt+0x2a8>
                putch('-', putdat);
  10307f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103082:	89 44 24 04          	mov    %eax,0x4(%esp)
  103086:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  10308d:	8b 45 08             	mov    0x8(%ebp),%eax
  103090:	ff d0                	call   *%eax
                num = -(long long)num;
  103092:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103095:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103098:	f7 d8                	neg    %eax
  10309a:	83 d2 00             	adc    $0x0,%edx
  10309d:	f7 da                	neg    %edx
  10309f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1030a5:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1030ac:	e9 a8 00 00 00       	jmp    103159 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1030b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030b8:	8d 45 14             	lea    0x14(%ebp),%eax
  1030bb:	89 04 24             	mov    %eax,(%esp)
  1030be:	e8 75 fc ff ff       	call   102d38 <getuint>
  1030c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1030c9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1030d0:	e9 84 00 00 00       	jmp    103159 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1030d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1030df:	89 04 24             	mov    %eax,(%esp)
  1030e2:	e8 51 fc ff ff       	call   102d38 <getuint>
  1030e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1030ed:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1030f4:	eb 63                	jmp    103159 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  1030f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030fd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103104:	8b 45 08             	mov    0x8(%ebp),%eax
  103107:	ff d0                	call   *%eax
            putch('x', putdat);
  103109:	8b 45 0c             	mov    0xc(%ebp),%eax
  10310c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103110:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103117:	8b 45 08             	mov    0x8(%ebp),%eax
  10311a:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10311c:	8b 45 14             	mov    0x14(%ebp),%eax
  10311f:	8d 50 04             	lea    0x4(%eax),%edx
  103122:	89 55 14             	mov    %edx,0x14(%ebp)
  103125:	8b 00                	mov    (%eax),%eax
  103127:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10312a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103131:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103138:	eb 1f                	jmp    103159 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10313a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10313d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103141:	8d 45 14             	lea    0x14(%ebp),%eax
  103144:	89 04 24             	mov    %eax,(%esp)
  103147:	e8 ec fb ff ff       	call   102d38 <getuint>
  10314c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10314f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103152:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103159:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10315d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103160:	89 54 24 18          	mov    %edx,0x18(%esp)
  103164:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103167:	89 54 24 14          	mov    %edx,0x14(%esp)
  10316b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10316f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103172:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103175:	89 44 24 08          	mov    %eax,0x8(%esp)
  103179:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10317d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103180:	89 44 24 04          	mov    %eax,0x4(%esp)
  103184:	8b 45 08             	mov    0x8(%ebp),%eax
  103187:	89 04 24             	mov    %eax,(%esp)
  10318a:	e8 a4 fa ff ff       	call   102c33 <printnum>
            break;
  10318f:	eb 38                	jmp    1031c9 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103191:	8b 45 0c             	mov    0xc(%ebp),%eax
  103194:	89 44 24 04          	mov    %eax,0x4(%esp)
  103198:	89 1c 24             	mov    %ebx,(%esp)
  10319b:	8b 45 08             	mov    0x8(%ebp),%eax
  10319e:	ff d0                	call   *%eax
            break;
  1031a0:	eb 27                	jmp    1031c9 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1031a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031a9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1031b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b3:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1031b5:	ff 4d 10             	decl   0x10(%ebp)
  1031b8:	eb 03                	jmp    1031bd <vprintfmt+0x3c0>
  1031ba:	ff 4d 10             	decl   0x10(%ebp)
  1031bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1031c0:	48                   	dec    %eax
  1031c1:	0f b6 00             	movzbl (%eax),%eax
  1031c4:	3c 25                	cmp    $0x25,%al
  1031c6:	75 f2                	jne    1031ba <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  1031c8:	90                   	nop
    while (1) {
  1031c9:	e9 37 fc ff ff       	jmp    102e05 <vprintfmt+0x8>
                return;
  1031ce:	90                   	nop
        }
    }
}
  1031cf:	83 c4 40             	add    $0x40,%esp
  1031d2:	5b                   	pop    %ebx
  1031d3:	5e                   	pop    %esi
  1031d4:	5d                   	pop    %ebp
  1031d5:	c3                   	ret    

001031d6 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1031d6:	55                   	push   %ebp
  1031d7:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1031d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031dc:	8b 40 08             	mov    0x8(%eax),%eax
  1031df:	8d 50 01             	lea    0x1(%eax),%edx
  1031e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031e5:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1031e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031eb:	8b 10                	mov    (%eax),%edx
  1031ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031f0:	8b 40 04             	mov    0x4(%eax),%eax
  1031f3:	39 c2                	cmp    %eax,%edx
  1031f5:	73 12                	jae    103209 <sprintputch+0x33>
        *b->buf ++ = ch;
  1031f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031fa:	8b 00                	mov    (%eax),%eax
  1031fc:	8d 48 01             	lea    0x1(%eax),%ecx
  1031ff:	8b 55 0c             	mov    0xc(%ebp),%edx
  103202:	89 0a                	mov    %ecx,(%edx)
  103204:	8b 55 08             	mov    0x8(%ebp),%edx
  103207:	88 10                	mov    %dl,(%eax)
    }
}
  103209:	90                   	nop
  10320a:	5d                   	pop    %ebp
  10320b:	c3                   	ret    

0010320c <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10320c:	55                   	push   %ebp
  10320d:	89 e5                	mov    %esp,%ebp
  10320f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103212:	8d 45 14             	lea    0x14(%ebp),%eax
  103215:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103218:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10321b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10321f:	8b 45 10             	mov    0x10(%ebp),%eax
  103222:	89 44 24 08          	mov    %eax,0x8(%esp)
  103226:	8b 45 0c             	mov    0xc(%ebp),%eax
  103229:	89 44 24 04          	mov    %eax,0x4(%esp)
  10322d:	8b 45 08             	mov    0x8(%ebp),%eax
  103230:	89 04 24             	mov    %eax,(%esp)
  103233:	e8 08 00 00 00       	call   103240 <vsnprintf>
  103238:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10323b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10323e:	c9                   	leave  
  10323f:	c3                   	ret    

00103240 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103240:	55                   	push   %ebp
  103241:	89 e5                	mov    %esp,%ebp
  103243:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103246:	8b 45 08             	mov    0x8(%ebp),%eax
  103249:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10324c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10324f:	8d 50 ff             	lea    -0x1(%eax),%edx
  103252:	8b 45 08             	mov    0x8(%ebp),%eax
  103255:	01 d0                	add    %edx,%eax
  103257:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10325a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103261:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103265:	74 0a                	je     103271 <vsnprintf+0x31>
  103267:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10326a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10326d:	39 c2                	cmp    %eax,%edx
  10326f:	76 07                	jbe    103278 <vsnprintf+0x38>
        return -E_INVAL;
  103271:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103276:	eb 2a                	jmp    1032a2 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103278:	8b 45 14             	mov    0x14(%ebp),%eax
  10327b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10327f:	8b 45 10             	mov    0x10(%ebp),%eax
  103282:	89 44 24 08          	mov    %eax,0x8(%esp)
  103286:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103289:	89 44 24 04          	mov    %eax,0x4(%esp)
  10328d:	c7 04 24 d6 31 10 00 	movl   $0x1031d6,(%esp)
  103294:	e8 64 fb ff ff       	call   102dfd <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103299:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10329c:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10329f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1032a2:	c9                   	leave  
  1032a3:	c3                   	ret    
