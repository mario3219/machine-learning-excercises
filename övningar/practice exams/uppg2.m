clc,clear

load sysid02.mat

sys = idss(drss(4,1,1)); sys.D=zeros(1,1); % skapar en random 4th order state-space model med två input två output, D=0
z = iddata(y,u); % skapar data objekt

% Estimera en 4th order state space modell
ms = n4sid(z,4)
compare(iddata(y,u),ms)

%P = bodeoptions;
%P.FreqUnits = 'Hz'
figure
bode(ms,'b-')
%print -depsc ident01_bode.eps
covMatrix = getcov(ms);
param_std = sqrt(diag(covMatrix));
disp('Covariance matrix of parameters:');
disp(covMatrix);
disp('Standard deviations of parameters:');
disp(param_std);
figure
pzmap(ms)
figure
resid(iddata(y,u),ms)

%%
clc
[sysg,g] = balreal(ms);
G1 = modred(sysg,g < g(1))
G2 = modred(sysg,g < g(2))
G3 = modred(sysg,g < g(3))
bode(ms,G1,G2)
figure
compare(iddata(y,u),ms,G1,G2,G3)