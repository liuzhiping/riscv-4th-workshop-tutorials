/*======================================================================*/
/* Proxy kernel linker script                                           */
/*======================================================================*/
/* This is the linker script used when building the proxy kernel. */

/*----------------------------------------------------------------------*/
/* Setup                                                                */
/*----------------------------------------------------------------------*/

/* The OUTPUT_ARCH command specifies the machine architecture where the
   argument is one of the names used in the BFD library. More
   specifically one of the entires in bfd/cpu-mips.c */

OUTPUT_ARCH( "riscv" )
MEMORY
{
 BMEM : ORIGIN =  0K, LENGTH = 32K 
 FMEM : ORIGIN = 32K, LENGTH = 200K
}
/*----------------------------------------------------------------------*/
/* Sections                                                             */
/*----------------------------------------------------------------------*/
ENTRY(_start)

SECTIONS
{

  /* text: test code section */
  . = 0x100;
  .init . :
  {
	  *(.init)
  }>BMEM
  .text :
  {
    *(.text)
  }>BMEM
  /* data segment */
  .data : { *(.data) }>BMEM
  .rodata : { *(.rodata) }>FMEM

  .sdata : {
    _gp = . + 0x800;
    *(.srodata.cst16) *(.srodata.cst8) *(.srodata.cst4) *(.srodata.cst2) *(.srodata*)
    *(.sdata .sdata.* .gnu.linkonce.s.*)
  }>BMEM

  /* bss segment */
  .sbss : {
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
  }>BMEM
  .bss : { *(.bss) }>BMEM

  /* thread-local data segment */
  .tdata :
  {
    _tls_data = .;
    *(.tdata)
  }>BMEM
  .tbss :
  {
    *(.tbss)
  }>BMEM



  /* End of uninitalized data segement */
  _end = .;

  _end_of_memory = 32K;
}
