
_estack = 0x20010000;

MEMORY
{
FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 256K
RAM (xrw)   : ORIGIN = 0x20000000, LENGTH = 16K
}


SECTIONS
{

.text : {
      *(.text)
}>FLASH

_flash_dstart = .;

.data :  {
      _dstart = .;
      *(.data)
      _dend = .;
}>RAM AT> FLASH  /* Load into FLASH, but live in RAM */


} /* SECTIONS END */
