#!/bin/bash

if test hello.c -nt hello.o; then
    gcc -c hello.c
fi

if test utils.c -nt utils.o; then
    gcc -c utils.c
fi

if test hello.o -nt hello || test utils.o -nt hello; then
    gcc -o hello hello.c utils.c
fi

