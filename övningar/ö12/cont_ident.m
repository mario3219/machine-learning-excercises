close all
clear
%% Our system
h = 0.001;
N = 20000;
z = tf('z',h);
s = tf('s');
K1 = 1; T1 = 1; 
G = K1/(1+s*T1)^3
Gd = c2d(G,h);
tvec = h*(0:N-1)';

[bd,fd] = tfdata(Gd,'v');

sig2 = 0.0001;
sys = idpoly(1,bd,1,1,fd,sig2,h);   % Outpout Error

u = idinput(N,'rbs',[0 0.005]);
%u(end/2:end)=1;          % This will get the DC gain correctly identified
y = sim(sys,u,simOptions('AddNoise',true));
z = iddata(y,u,h);

figure(1)
subplot(211)
plot(h*(1:N),y)
subplot(212)
plot(h*(1:N),u)


%%
%Find best model structure
%NN = [3 3 1]
NN = struc(1:10,1:10,1);
V = arxstruc(z,z,NN);%
%Nbest = selstruc(V)        % use this for interactive choice
Nbest = selstruc(V,'mdl') % use this for automatic choice
arxbest = arx(z,Nbest)

%% 


%% Bode diagrams
figure(3)
bode(Gd,arxbest)
hold on


%% Continuous Time Identification
wb = 0.5;    
L = wb^3/(s+wb)^3;

uf = lsim(L,u,tvec);
y0 = lsim(L,y,tvec);
y1 = lsim(s*L,y,tvec);
y2 = lsim(s^2*L,y,tvec);
y3 = lsim(s^3*L,y,tvec);
theta = [-y2 -y1 -y0 uf]\y3

Gest = theta(4)/(s^3+theta(1)*s^2+theta(2)*s+theta(3))

bode(Gest)

%% Understanding the filters s^k*L(s)
figure(4)
bode(L,s*L,s^2*L,s^3*L,{1e-2, pi*1e3})


