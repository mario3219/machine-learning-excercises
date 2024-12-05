% Cross covariance function
% Study choice of 
%   - input signal u1 or u2
%   - data length N
%   - prewhitening filter order NA

close all; clear
z = tf('z',1);
G = (z+0.5)/(z^2 - 1.5*z + 0.7);

N = 1000;
u1 = randn(N,1);
u2 = filter(1,[1 -1 0.99],u1);

M = 50;
NA = 0;    % try  NA =1,2,5
y1 = lsim(G,u1);
y2 = lsim(G,u2);
ir = impulse(G,M);
z1 = iddata(y1,u1);
z2 = iddata(y2,u2);


figure(1)
[i1hat,R1,CL1] = cra(z1,M,NA,2);
figure(2)
[i2hat,R2,CL2] = cra(z2,M,NA,2);

%%

figure(3)
subplot(211)
pwelch(u1)
subplot(212)
pwelch(u2)

%%

figure(4)
subplot(211)
plot([i1hat ir])
legend('i1hat','true ir')
subplot(212)
plot([i2hat ir])
legend('i2hat','true ir')


