clc,clear

syms s M T k
A = [0 1 0; 0 0 1/M; 0 0 -1/T]
B = [0 0 k/T]'
C = [1 0 0]'
D = 0
I = [s 0 0; 0 s 0; 0 0 s]

C*(inv(I-A)*B+D