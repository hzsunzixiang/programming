


// https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#Common-Variable-Attributes
//section ("section-name")
//    Normally, the compiler places the objects it generates in sections like data and bss. Sometimes, however, you need additional sections, or you need certain particular variables to appear in special sections, for example to map to special hardware. The section attribute specifies that a variable (or function) lives in a particular section. For example, this small program uses several specific section names:
//
//              struct duart a __attribute__ ((section ("DUART_A"))) = { 0 };
//              struct duart b __attribute__ ((section ("DUART_B"))) = { 0 };
//              char stack[10000] __attribute__ ((section ("STACK"))) = { 0 };
//              int init_data __attribute__ ((section ("INITDATA")));
//              
//              main()
//              {
//                /* Initialize stack pointer */
//                init_sp (stack + sizeof (stack));
//              
//                /* Initialize initialized data */
//                memcpy (&init_data, &data, &edata - &data);
//              
//                /* Turn on the serial ports */
//                init_duart (&a);
//                init_duart (&b);
//              }
//
//    Use the section attribute with global variables and not local variables, as shown in the example.
//
//    You may use the section attribute with initialized or uninitialized global variables but the linker requires each object be defined once, with the exception that uninitialized variables tentatively go in the common (or bss) section and can be multiply “defined”. Using the section attribute changes what section the variable goes into and may cause the linker to issue an error if an uninitialized variable has multiple definitions. You can force a variable to be initialized with the -fno-common flag or the nocommon attribute.
//
//    Some file formats do not support arbitrary sections so the section attribute is not available on all platforms. If you need to map the entire contents of a module to a particular section, consider using the facilities of the linker instead. 


//https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes
//section ("section-name")
//    Normally, the compiler places the code it generates in the text section. Sometimes, however, you need additional sections, or you need certain particular functions to appear in special sections. The section attribute specifies that a function lives in a particular section. For example, the declaration:
//
//              extern void foobar (void) __attribute__ ((section ("bar")));
//
//    puts the function foobar in the bar section.
//
//    Some file formats do not support arbitrary sections so the section attribute is not available on all platforms. If you need to map the entire contents of a module to a particular section, consider using the facilities of the linker instead. 

// 目前无法通过编译。。。。。 
struct duart
{
	int a;
};
struct duart a __attribute__ ((section ("DUART_A"))) = { 0 };
struct duart b __attribute__ ((section ("DUART_B"))) = { 0 };
char stack[10000] __attribute__ ((section ("STACK"))) = { 0 };
int init_data __attribute__ ((section ("INITDATA")));

main()
{
	/* Initialize stack pointer */
	init_sp (stack + sizeof (stack));

	/* Initialize initialized data */
	//memcpy (&init_data, &data, &edata - &data);

	/* Turn on the serial ports */
	init_duart (&a);
	init_duart (&b);
}
