clear, close all
rng('default')
pi1 = 0.75;
pi2 = 0.25;
mu1 = [-1;3];
mu2 = [1; 5];
Sigma1 = [2 -1; -1 2];
Sigma2 = 0.2*[1 1 ; 1 2];
N = 100;
figure(1)
hold on
n1 = 0;
n2 = 0;
pi1hat = 0*pi1;
pi2hat = 0*pi2;
mu1hat = 0*mu1;
mu2hat = 0*mu2;
Sigma1hat = 0*Sigma1;
Sigma2hat = 0*Sigma2;
for i=1:N
    if rand < pi1
        z = mu1 + chol(Sigma1,'lower')*randn(2,1);
        plot(z(1),z(2),'b.','Markersize',15)
        n1 = n1 + 1;
        mu1hat = mu1hat + z;
        Sigma1hat = Sigma1hat + z*z';
    else
        z = mu2 + chol(Sigma2,'lower')*randn(2,1);
        plot(z(1),z(2),'r.','Markersize',15);
        n2 = n2 + 1;
        mu2hat = mu2hat + z;
        Sigma2hat = Sigma2hat + z*z';
    end
end
%Estimate parameters:
%pi1hat =  insert equation here 
%pi2hat =  insert equation here 
%mu1hat =  insert equation here 
%mu2hat =  insert equation here 
%Sigma1hat =  insert equation here 
%Sigma2hat =  insert equation here 


%%%%%%%%%%%%%%%%%%%%%%%%%

phi = 0:0.01:2*pi;
for r=[0.5 1 2]
  ellips1 = repmat(mu1,1,length(phi)) + r*chol(Sigma1,'lower')*[cos(phi);sin(phi)];
  plot(ellips1(1,:), ellips1(2,:),'b-')
  ellips2 = repmat(mu2,1,length(phi)) + r*chol(Sigma2,'lower')*[cos(phi);sin(phi)];
  plot(ellips2(1,:), ellips2(2,:),'r-')
  % also uncomment the following 4 lines
%  ellips1 = repmat(mu1,1,length(phi)) + r*chol(Sigma1hat,'lower')*[cos(phi);sin(phi)];
%  plot(ellips1(1,:), ellips1(2,:),'k--')
%  ellips2 = repmat(mu2,1,length(phi)) + r*chol(Sigma2hat,'lower')*[cos(phi);sin(phi)];
%  plot(ellips2(1,:), ellips2(2,:),'k--')
end





    