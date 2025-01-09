% Leukemia data for 130 patients
% A(indT,:) matrix with 13 patients * 22282 measurements, type T cancer
% A(indB,:) matrix with 117 patients* 22282 measurements, type B cancer

clear;  close all; rng(2)
load cancer

indT = 1:13;    % Leukemia type T
indB = 14:130;  % Leukemia type B
nrpat = 130;
nrmeas = 22282;

%% Choose best way to preprocess this data, the choice is not obvious

% 1) No preprocessing
A = data; 

% 2) Make mean = 0 in each column
% colmeans = mean(data,1);
% A = data - repmat(colmeans,nrpat,1);  % mean=0 in each column

% 3) Make standard deviation = 1 for each column
% colstds = std(A,1);
% A = A ./ repmat(colstds,nrpat,1);     % std = 1 in each column

% 4) Combination of 2 and 3

%% SVD decomposition of A

[U,S,V]= svd(A,'econ');   

%% Plot patient data in 2D using SVD

figure(1)
Tx = randn(nrmeas,1);   % Replace these transformations. Use the SVD somehow.
Ty = randn(nrmeas,1);
plot(A(indT,:)*Tx, A(indT,:)*Ty,'bx','markersize',8); hold on
plot(A(indB,:)*Tx, A(indB,:)*Ty,'ro','markersize',8)

%% Classify patient1 and patient2  (vectors with 1*22282 numbers)
%  from the information seen in the figure

pat1 = patient1;  % Don't forget to do relevant preprocessing of patient data
pat2 = patient2;  

plot(pat1*Tx , pat1*Ty,'k*','markersize',16)
plot(pat2*Tx , pat2*Ty,'k+','markersize',16)
legend('type T','type B','patient1','patient2')
