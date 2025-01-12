close all
clear
%% Our system
h = 0.1;
s=tf('s');
z = tf('z',h);
w0 = 1;
zeta0 = 0.05;
w1 = 4;
zeta1 = 0.1;
T = 6;
G = (s^2+ + 2*zeta0*w0*s + w0^2)/w0^2*w1^2/(s^2+zeta1*w1^2*s+w1^2)/(1+s*T);
Gd = c2d(G,h)
[bd,ad] = tfdata(Gd,'v')

%%
figure(1)
bode(G,Gd)

% print -depsc robotarm01.eps

figure(2)
step(G)
hold on
step(Gd)

%%
% Identification
rng(1)
figure(3)
Tsimu = 100;
N = Tsimu / h;
u = idinput(N,'rbs',[0 0.3]);
x = lsim(Gd,u);
noiselevel = 0.1;   % change noise level here 
y = x + noiselevel*std(x)*randn(N,1);

% Use this code if you want to simulate with a true system of ARX structure
% arxtrue = idpoly(ad,bd,1,1,1,0.01,h);
% y = sim(arxtrue,u,simOptions('AddNoise',true));

% Split data into train and test 
ytrain = y(1:N/2);
utrain = u(1:N/2);
ytest = y(N/2+1:end);
utest = u(N/2+1:end);
ztrain = iddata(ytrain,utrain,h);
ztest = iddata(ytest,utest,h);

T1 = (1:100)'
subplot(211)
plot(h*(T1-1),x(T1),'b')
hold on
plot(h*(T1-1),y(T1),'r')
subplot(212)
plot(h*(T1-1),u(T1),'k')

%%
% arxstruc(ZE, ZV, NN)

NN = [1 1 1 ; 2 2 1 ; 3 3 1; 4 4 1 ; 5 5 1 ; 6 6 1 ; 7 7 1; 8 8 1; 9 9 1; 10 10 1; 11 11 1; 12 12 1; 13 13 1; 14 14 1; 15 15 1];
V = arxstruc(ztrain,ztest,NN);
Nbest = selstruc(V,'aic')

%%
arx3 = arx(ztrain,[3 3 1]);
arx9 = arx(ztrain,[9 9 1]);
arx15 = arx(ztrain,[15 15 1]);
figure(4)
bode(Gd,arx3,arx9,arx15)


%%
figure(5)
oe3 = oe(ztrain,[3 3 1])
opt = oeOptions;
opt.WeightingFilter = [0.1 10];  % use "doc oeoptions"
oe3w = oe(ztrain,[3 3 1],opt);
bode(Gd,oe3,oe3w)

%%
figure(6)
[ypred50, FIT50, X0] = compare(ztest, oe3, 50);
FIT50
tplot = min(length(ytest),200);
subplot(211)
plot(h*(1:tplot)',ytest(1:tplot),'b-')
hold on
plot(h*(1:tplot)',ypred50.OutputData(1:tplot),'r-')
legend('ytest','ypred50','Location','best')
subplot(212)
plot(h*(1:tplot)',utest(1:tplot),'b-')

%%
% Redo the previous plot, but with oe3w instead of oe3:
% Just uncomment these lines: 
% figure(7)
% [ypred50w, FIT50w, X0w] = compare(ztest, oe3w, 50);
% FIT50w
% tplot = min(length(ytest),200);
% subplot(211)
% plot(h*(1:tplot)',ytest(1:tplot),'b-')
% hold on
% plot(h*(1:tplot)',ypred50w.OutputData(1:tplot),'r-')
% legend('ytest','ypred50w','Location','best')
% subplot(212)
% plot(h*(1:tplot)',utest(1:tplot),'b-')
% 






