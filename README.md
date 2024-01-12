# Assembly

## Table of Contents

- [About Assembly Language](#about-assembly-language)

- [Assembly Program Structure](#assembly-program-structure)
    - [Text](#1-text-section)
    - [BSS](#bss-section-block-starting-symbol)
    - [Data](#data-section)
    - [Program Entrypoint](#program-entrypoint)

- [Memory Segments](#memory-segments)

- [Assembly Language Statements](#assembly-language-statements)
    - [Executable Instructions](#executable-instructions)
    - [Assembler Directives or Pseudo-Ops](#assembler-directives-or-pseudo-ops)
    - [Macros](#macros)

- [Compilation and Execution](#compilation-and-execution)
    - [Compile with NASM](#compile-with-nasm)
    - [Link with ld](#link-with-ld)
    - [Execution](#execution)

## About Assembly Language

Assembly language is a low-level programming language that is specific to a particular CPU architecture, such as ARM or x86. This repository provides information on how to work with assembly code using NASM (Netwide Assembler) for x86 chips.

## Assembly Program Structure

An assembly program typically consists of three main sections:

### Text Section
   - Contains the actual logic for the program.
   - Conventionally includes an entry point called `start` where the code begins execution.

### BSS Section (Block Starting Symbol)
   - Holds variables that may change throughout the lifecycle of the program.

### Data Section
   - Used for initializing constants or data that does not change.

#### Program Entrypoint

The `start` label is often used as the entry point as mentioned before. The `global` keyword is utilized to make an identifier accessible to the linker. Labels are essential for naming locations in the code, providing structure to the program.

## Memory Segments

As discussed above, there are three sections of an assembly program, which also represent various memory segments.
Interestingly, if you replace the `section` keyword with `segment`, you will get the same result.

A segmented memory model divides the system memory into groups of independent segments referenced by pointers located in the segment registers. Each segment is used to contain a specific type of data. One segment is used to contain instruction codes, another segment stores the data elements, and a third segment keeps the program stack.

In the light of the above discussion, we can specify various memory segments as

### Data segment

It is represented by .data section and the .bss.

### Code segment

It is represented by .text section.

### Stack

This segment contains data values passed to functions and procedures within the program. Data may be initialized at run-time. It acts as temporary storage and follows the Last In First Out protocol, which means that elements are only added or removed from the top.

## Assembly Language Statements

Assembly language programs consist of three types of statements:

### Executable Instructions

#### Syntax

Instructions are entered one statement per line. Each one follows the following format:

\[label\] mnemonic \[operands\] ;comment

The fields in the square brackets are optional. A basic instruction has two parts: the first one is the name of the instruction (or the mnemonic), which is to be executed, and the second are the operands or the parameters of the command.

   - These executable instructions, or simply instructions, tell the processor what to do.
   - Each instruction consists of an operation code (opcode).
   - Each executable instruction generates one machine language instruction.

```assembly
   mov eax, 5        ; Move the value 5 into register eax
   add ebx, eax      ; Add the value in eax to the value in ebx
```

### Assembler Directives or Pseudo-Ops
   - These directives or pseudo-ops inform the assembler about various aspects of the assembly process.
   - They are non-executable and do not generate machine language instructions.

```assembly
section .data        ; Start the data section
    variable db 10   ; Define a byte variable with initial value 10
```

### Macros
   - Macros are a text substitution mechanism.
   - They allow for code reuse and simplification by substituting predefined text in place of the macro call.

```assembly
; A macro with two parameters
; Implements the write system call
%macro write_string 2 
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section	.text
   global _start     ; must be declared for using gcc
	
_start:              ; tell linker entry point
   write_string msg, len

   mov eax, 1        ; system call number (sys_exit)
   int 0x80          ; call kernel

section .data
    msg db "Hello, world!", 0x0a
    len equ $ - msg
```

## Compilation and Execution

These are the commands you can use to compile and run assembly code:

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
