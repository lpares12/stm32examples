## Minimal

This example contains the minimal code in assembly to run on an ARM Cortex-M4 device. It was tested in a STM32F303RE Nucleo board which has an integrated ST-Link debugger and flasher.

### Compilation instructions

First of all we need to create an object file from `core.S`

```
arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -mcpu=cortex-m4 -mthumb -Wall core.S -o core.o
```

Now we create an Executable and Linkable Format (ELF) file. This is the file we will upload to the chip.

```
arm-none-eabi-gcc core.o -mcpu=cortex-m4 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./linker.ld -o main.elf
```

### Running instructions

After plugging the device, `st-util` application must be run, which will open gdbserver. Then, we run gdb client and connect to gdbserver:

```
gdb-multiarch main.elf
target extended-remote localhost:4242
```

Now we have to flash the program by running the command `load`.

Once the program is flashed into the device, gdb can be used as usual.

### References

["Bare Metal" STM32 Programming (Part 1): Hello, ARM!](https://vivonomicon.com/2018/04/02/bare-metal-stm32-programming-part-1-hello-arm/)

[STM32Cube Examples](https://github.com/eleciawhite/STM32Cube/tree/master/STM32Cube_FW_F3_V1.3.0/Projects/STM32F303RE-Nucleo/Examples/FLASH/FLASH_EraseProgram/TrueSTUDIO)
