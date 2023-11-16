clear all;
close all;

%% STANDARD FIBER

filename = 'group1SMF.pmd';
delimiterIn = ',';
headerlinesIn = 16;
data = importdata(filename,delimiterIn,headerlinesIn);

lambda = data.data(:,1);
pmd = data.data(:,2);
s1 = data.data(:,3);
s2 = data.data(:,4);
s3 = data.data(:,5);

figure
plot(lambda,s1,lambda,s2,lambda,s3)
grid on
xlabel('Lambda [nm]');
ylabel('s');
title('STANDARD FIBER')
legend('s1','s2','s3')

figure
plot(lambda,pmd)
grid on
xlabel('Lambda [nm]');
ylabel('PMD [ps]');
ylim([0 5])
title('PMD STANDARD FIBER')
