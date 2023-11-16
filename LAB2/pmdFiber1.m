clear all;
close all;

%% Polarization-Mantaining fiber

filename = 'PMD.xlsx';
sheetname = 'PMF - SOP 1';

lambda=xlsread(filename,sheetname,'A2:A84');
s1=xlsread(filename,sheetname,'B2:B84');
s2=xlsread(filename,sheetname,'C2:C84');
s3=xlsread(filename,sheetname,'D2:D84');

fig = figure
plot(lambda,s1,lambda,s2,lambda,s3)
grid on
xlabel('$$\lambda$$ [nm]','Interpreter','latex');
ylabel('s','Interpreter','latex');
title('POLARIZATION MANTAINING FIBER','Interpreter','latex')
legend('s1','s2','s3','Interpreter','latex')
saveas(fig,"pmdFiber1.png")
