clear

load current
y = i4r;
ymean = mean(y);

figure(1)
Ts = 0.001;
z = iddata(y,[],Ts);
z = detrend(z);
plot(z)

%%
% There is a clear periodic behavior with significant correlation even
% after 400 samples (0.4s)
% The signal has nonzero mean so we remove that before applying covf
% We check that the covariance of y is correctly estimated

figure(2)
R = covf(z,500);
subplot(211)
plot(R)
ylabel('Covariance function')
subplot(212)
plot(R/R(1))
ylabel('Autocorrelation')
xlabel('lag')

vary = var(y)
R0 = R(1)



%%
% The spectrum is not well estimated using the default values (Phi)
% The widest possible window (600=length(y)-1 in this case) seems to give
% the best resolution for seeing the spectral components

figure(3)
Nw = 1024; % nr of frequency points
wv = linspace(0,pi/Ts,Nw);
M = 400;
Phi = spa(z,M,wv);   % try different window widths M
% Phi200 = spa(z,200,wv);
% Phi600 = spa(z,600,wv);

PLOPTOPTIONS = spectrumoptions;
PLOPTOPTIONS.Freqscale = 'linear';
PLOPTOPTIONS.FreqUnits = 'Hz';
PLOPTOPTIONS.XLim = {[0 500]};

spectrumplot(Phi,PLOPTOPTIONS)