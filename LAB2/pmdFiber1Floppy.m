clear all;
close all;

%% POLARIZATION MANTAINING FIBER

filename = 'group1PMF.pmd';
delimiterIn = ',';
headerlinesIn = 16;
data = importdata(filename,delimiterIn,headerlinesIn);

lambda = data.data(:,1);
pmd = mag2db(data.data(:,2));
s1 = data.data(:,3);
s2 = data.data(:,4);
s3 = data.data(:,5);

fig1 = figure
plot(lambda,s1,lambda,s2,lambda,s3)
grid on
xlabel('$$\lambda$$ [nm]','Interpreter','latex');
ylabel('s','Interpreter','latex');
title('POLARIZATION MANTAINING FIBER','Interpreter','latex')
legend('s1','s2','s3','Interpreter','latex')

fig2 = figure
plot(lambda,pmd)
grid on
xlabel('$$\lambda$$ [nm]','Interpreter','latex');
ylabel('PMD [ps]','Interpreter','latex');
ylim([0 5])
title('PMD POLARIZATION MANTAINING FIBER','Interpreter','latex')
