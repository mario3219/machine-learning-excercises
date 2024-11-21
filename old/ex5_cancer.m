% according to medical jargong:
%   positive case = has cancer
%   negative case = is healthy
close all
mean_pos = 20;
std_pos = 5;
mean_neg = 10;
std_neg = 4;
a = 0.01;  % prior probability for cancer

figure(1)
for t=0:0.05:30
    % Patient has cancer, and measurement is above t
    TP = a*normcdf((mean_pos-t)/std_pos);
    % Patient has cancer, but measurement is below t
    FN = a*normcdf((t-mean_pos)/std_pos);
    % Patient is healthy, but measurement is above t
    FP = (1-a)*normcdf((mean_neg-t)/std_neg);
    % Patient is healthy, and measurement is below t
    TN = (1-a)*normcdf((t-mean_neg)/std_neg);
    
    P = TP + FN;
    Phat = TP+FP;
    precision = TP/Phat;
    recall = TP/(TP+FN);  

    if t<10
      plot(recall,precision,'r.') % for visualisation
    else
      plot(recall,precision,'b.')
    end
    hold on
end
title('Precision vs Recall curve')
xlabel('Recall = TP/(TP+FN)')
ylabel('Precision = TP/(TP+FP)')
grid on

figure(2)
for t=0:0.05:30
    % Patient has cancer, and measurement is above t
    TP = a*normcdf((mean_pos-t)/std_pos);
    % Patient has cancer, but measurement is below t
    FN = a*normcdf((t-mean_pos)/std_pos);
    % Patient is healthy, but measurement is above t
    FP = (1-a)*normcdf((mean_neg-t)/std_neg);
    % Patient is healthy, and measurement is below t
    TN = (1-a)*normcdf((t-mean_neg)/std_neg);

    FPR = FP/(FP+TN); 
    TPR = TP/(TP+FN); % = Recall

    if t<10
      plot(FPR,TPR,'r.')
    else
      plot(FPR,TPR,'b.')
    end
    hold on
end
title('ROC curve')
xlabel('FPR = FP/(FP+TN)')
ylabel('TPR = TP/(TP+FN)')
grid on
