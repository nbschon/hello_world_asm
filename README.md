# hello_world_asm

A Hello World and Fizzbuzz example program written in x86_64 Assembly.
Using macOS syscalls, from 
[this list](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master).

# Building

Run `make` inside the project directory, or copy this and run it in 
your terminal to do everything in one go:

```
$ git clone https://github.com/nbschon/hello_world_asm.git && cd hello_world_asm && make
```

There's a constant for the upper bound of the main loop, defined in 
the data section. By default it's set to 100, but it can be changed
to something else and it'll work as expected.

This runs on modern (i.e. 64 bit) Intel MacBooks, since that's what it was written on. It might work for desktop Macs, and it might work on Linux / Windows if you change syscalls.