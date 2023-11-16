%% PART 2 %%

clear all;
close all;

%%  BACK-TO-BACK CONFIGURATION  %% 

filename= 'W0014.txt';
delimiterIn = ',';
headerlinesIn = 3;
dataB2B = importdata(filename,delimiterIn,headerlinesIn);
lambdaB2B = dataB2B.data(:,1);
attB2B = dataB2B.data(:,2);

[upB2B,lowB2B] = envelope(attB2B,3,'peak')

%%  FIBER 1  YELLOW - G655 NZD L = 10.5 KM  %% 

filename= 'W0015.txt';
data1 = importdata(filename,delimiterIn,headerlinesIn);
lambda1 = data1.data(:,1);
att1 = data1.data(:,2);

[up1,low1] = envelope(att1,5,'peak')

%%  FIBER 2 GREEN - G652 - L = 4.88 KM  %% 

filename= 'W0016.txt';
data2 = importdata(filename,delimiterIn,headerlinesIn);
lambda2 = data2.data(:,1);
att2 = data2.data(:,2);

[up2,low2] = envelope(att2,5,'peak')

%%  FIBER 2 GREEN - G652 - L = 4.88 KM  BIS%% 

filename= 'W0017.txt';
data2bis = importdata(filename,delimiterIn,headerlinesIn);
lambda2 = data2bis.data(:,1);
att2bis = data2bis.data(:,2);

[up2bis,low2bis] = envelope(att2bis,5,'peak')


%%  FIBER 3 RED - G657 - L = 2.2 KM  %%

filename= 'W0018.txt';
data3 = importdata(filename,delimiterIn,headerlinesIn);
lambda3 = data3.data(:,1);
att3 = data3.data(:,2);

[up3,low3] = envelope(att3,5,'peak')



% normal plot 
figure
plot(lambdaB2B,attB2B,lambdaB2B,att1,lambdaB2B,att2,lambdaB2B,att2bis,lambdaB2B,att3);
grid on
xlabel('Wavelength [nm]','interpreter','latex');
ylabel('Attenuation [dB]','interpreter','latex');
title('SPECTRAL ATTENUATION','interpreter','latex')
legend('Back to back','Fiber 1','Fiber 2', 'Fiber 2', 'Fiber 3') 


% envelope plot 
figure
plot(lambdaB2B,upB2B,lambdaB2B,up1,lambdaB2B,up2,lambdaB2B,up2bis,lambdaB2B,up3);
grid on
xlabel('Wavelength [nm]','interpreter','latex');
ylabel('Attenuation [dB]','interpreter','latex');
title('SPECTRAL ATTENUATION','interpreter','latex')
legend('Back to back','Fiber 1','Fiber 2', 'Fiber 2', 'Fiber 3') 










