/* Entry Point */
ENTRY(default_handler)

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM); /* 0x20010000; end of 64K RAM */

/* Generate a link error if heap and stack don't fit into RAM */
/*_Min_Heap_Size = 0x200;      /* required amount of heap  */
/*_Min_Stack_Size = 0x400; /* required amount of stack */

/* Specify the memory areas */
MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 512K  /*Without bootstarter*/
  RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 64K
/*  CCMRAM (rwx)    : ORIGIN = 0x10000000, LENGTH = 16K */
/*  MEMORY_B1 (rx)  : ORIGIN = 0x60000000, LENGTH = 0K */
}
