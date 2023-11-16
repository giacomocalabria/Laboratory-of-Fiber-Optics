clear all;
%close all;

%% Standard fiber

filename = 'PMD.xlsx';
sheetname = 'SMF - SOP 1';

lambda=xlsread(filename,sheetname,'A2:A84');
s1=xlsread(filename,sheetname,'B2:B84');
s2=xlsread(filename,sheetname,'C2:C84');
s3=xlsread(filename,sheetname,'D2:D84');

figure
plot(lambda,s1,lambda,s2,lambda,s3)
grid on
xlabel('Lambda [nm]');
ylabel('s');
title('STANDARD FIBER')
legend('s1','s2','s3')

