# osplayground
Learning about x86 Assembly and OS stuff, just for fun.

# Compiling and running the Assembly code
The ```.asm```files can be compiled with ```nasm``` "Netwide Assembler". The command to do this is:
```
nasm *file*.asm -f bin -o *output*.bin
```
output would usually be ```boot.bin```
These can then be run in qemu by running:
```
qemu-system-x86_64 boot.bin
```
and connecting to the vnc server on the loopback adapter (```localhost```, ```127.0.0.1```, ```::1```). The address and port i get by default is ```::1:5900```

Have fun!
