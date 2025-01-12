close all ; clear; 

%% Problem a)
A = [-1 0 0 ; 0 -0.1 0 ; 0 0 -0.101];
B = [1;1;-1];
C = [1 1 1 ];
D = 0;
G = ss(A,B,C,D);
[sysg,g] = balreal(G);
g=g

% Keep DC-gain:
figure(1)
G1 = modred(sysg,g < g(1))
G2 = modred(sysg,g < g(2))
bode(G,G1,G2)
% Truncate states
figure(2)
G1t = modred(sysg,g < g(1),'truncate')
G2t = modred(sysg,g < g(2),'truncate')
bode(G,G1t,G2t)
shg
% Poles and zeros
figure(3)
pzmap(G)
axis([-2 2 -2 2])

%% Problem b) 

A = [-1 0 0 ; 0 -0.1 0 ; 0 0 -0.101];
B = [1;1;1];
C = [1 1 1 ];
D = 0;
G = ss(A,B,C,D);
[sysg,g] = balreal(G);
g=g
% Keep DC-gain:
figure(4)
G1 = modred(sysg,g < g(1))
G2 = modred(sysg,g < g(2))
bode(G,G1,G2)
% Truncate states
figure(5)
G1t = modred(sysg,g < g(1),'truncate')
G2t = modred(sysg,g < g(2),'truncate')
bode(G,G1t,G2t)
shg
% Poles and zeros
figure(6)
pzmap(G)
axis([-2 2 -2 2])

%% Problem b) fast med balred
figure(7)
G12 = balred(G,[1,2]); 
bode(G,'b')
hold on
bode(G12,'r--')

figure(8)
G12t = balred(G,[1,2],'StateElimMethod','Truncate');
bode(G,'b')
hold on
bode(G12t,'r--')

%%
%modelReducer




%% Problem c
figure(10)
s=tf('s')
G = (s+2)*(s+4)*(s+6)*(s+8)/(s+1)/(s+3)/(s+5)/(s+7)

hsvd(G)
G1 = balred(G,1);
G2 = balred(G,2);
bode(G,G1,G2)
shg
G1t = balred(G,1,'StateElimMethod','Truncate');
G2t = balred(G,2,'StateElimMethod','Truncate');




%% Problem d
s = hsvd(G)
err1 = 2*(s(2)+s(3)+s(4))
err2 = 2*(s(3)+s(4))

figure(11)
opt = bodeoptions;
opt.MagUnits='abs';
bodemag(G-G1t,opt)
shg
hold on
bodemag(G-G2t,opt)
%%
hinfnorm(G-G1t)
hinfnorm(G-G2t)

% Good correspondence between error estimates and true error



