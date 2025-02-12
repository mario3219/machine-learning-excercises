close all; clear
fs = 100;
T = 1/fs;
N = 1e4;      
t = T*(0:N-1)';
df = 1/N/T;
fvec = (0:N/2)*df;

%%%%%  Create chirp signal as input
f0 = 0.01;
f1 = 50;               % Start at 0.1Hz go up to 50 Hz
%u = chirp(t,f0,N*T,f1,'logarithmic');
% spectrogram(u,256,200,256,fs);

a1 = 1, a2 = 1, w1=2*pi, w2=2*pi*10, u = a1*sin(w1*t) + a2*cos(w2*t)
% u = idinput(N,'rbs',[f0 f1]/(fs/2));
% u = randn(N,1);

% simulate system
z = tf('z',T);
G = 0.15*(1+z^(-1))/(1-1.6*z^(-1) + 0.9*z^(-2));
e = randn(N,1);  


y = lsim(G,u,t) + 0.000*e; % try different noise levels here 
figure(1)
subplot(211)
plot(t,y,'linewidth',1.5)
ylabel('output y')
set(gca,'fontsize',16)
subplot(212)
plot(t,u,'linewidth',1.5)
ylabel('input u')
set(gca,'fontsize',16)

% Empirical Transfer Function Estimate
Y = T*fft(y);
U = T*fft(u);
Ghat = Y ./ U;
Gw = squeeze(freqresp(G,2*pi*fvec));
figure(2)
loglog(fvec,abs(Ghat(1:N/2+1)),'b','linewidth',2);
hold on
loglog(fvec,abs(Gw),'r--','linewidth',1.5)
axis([f0 f1 1e-3 10])
xlabel('Frequency [Hz]')
ylabel('abs(G)')
legend('abs(Ghat)','True abs(G)','Location','best')
set(gca,'fontsize',16)
title('ETFE','fontsize',18)





