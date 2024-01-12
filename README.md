# Assembly

## How to Run ?

### Compile with NASM

```bash
nasm -f <elf-format> source/<filename>.asm -o <object-name>.o
```

### Link with ld

```bash
ld <object-name>.o -o <executable-name>
```

You can check supported elf formats with `nasm -hf`

### Execution

```bash
./<executable-name>
```
