clear

run('init_quadcopter_model')
run('init_quadcopter_states_2')
addpath ('models')
run('initialize_wind_dist')
run('design_pid')
y_ref = 0

%%
disp('starting sim')
out = sim('closed_loop','StopTime', '50')
disp('done sim')
%% From wind
R = 7;%TODO might be needed to change
y_acc = out.acc.data(:,2);
Ft = out.T.data.*sin(out.eta.data(:,1));
wind_force_est = m*y_acc-Ft;
dat = iddata(wind_force_est(1:R:end),[],sample_time*R);
opts = armaxOptions;
na = 2
nc = 1
armax2 = armax(dat,[na nc]) %TODO select suitable model structure
figure(1)
clf
compare(dat,armax2,3)

figure(2)
clf
wnyq = pi*1/sample_time/R;
wvec = logspace(-1,log10(wnyq),10000);
p = bodeoptions;
set(p,'MagUnits','abs','MagScale','log')
bode(Gwindd*wind_power^(1/2)/(sqrt(2*wnyq)),wvec,'b',p);
grid on
hold on

Harmax2 = tf(armax2.C,armax2.A,armax2.Ts);
sigma2 = armax2.NoiseVariance;
bode(Harmax2*sqrt(sigma2),'r');
fig2 = gcf;
ax = findall (fig2, 'type', 'axes');
set(ax(3),'YLim', [1e-4 1e2])
legend('reference', 'estimate')

%% Converting to Continuous time
wind_est = d2c(Harmax2)
wind_denum = wind.denum
%% Plotting - Inspect position.
figure(3)
clf
plot(out.p)
title('Position')
legend('x','y','z')


