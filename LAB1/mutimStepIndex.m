clear all;
close all;

%% STEP INDEX FIBER (L = 2.51km)

filename = 'Spectral response\Data_20231107_040019.xls';
filename = 'Data_sif.xlsx';

matrixData = readmatrix(filename);
xaxis1 = matrixData(:,1);
yaxis1 = -matrixData(:,2);

%3db bandwidth
M1 = max(yaxis1);
band3db = M1 - 3;

vector3db = zeros(length(yaxis1),1) + band3db;

[band3dbx,band3dby] = polyxpoly(xaxis1,yaxis1,xaxis1,vector3db)

disp('3dB bandwidth at f= : ')
disp(band3dbx)

%6db bandwidth
M2 = max(yaxis1);
band6db = M2 - 6;

vector6db = zeros(length(yaxis1),1) + band6db;

[band6dbx,band6dby] = polyxpoly(xaxis1,yaxis1,xaxis1,vector6db)

disp('6dB bandwidth at f= : ')
disp(band6dbx)

fig1 = figure;
grid on;
plot(xaxis1,yaxis1)

yline(band3dby,'--r','3-dB bandwidth','interpreter','latex');
xline(band3dbx,'--r')

yline(band6dby,'--m','6-dB bandwidth','interpreter','latex');
xline(band6dbx,'--m')
xlabel('Frequency [Hz]','interpreter','latex');
ylabel('[dB]','interpreter','latex');
xticks([xaxis1(1) xaxis1(64) xaxis1(128) xaxis1(192) xaxis1(256)])
title('STEP INDEX FIBER','interpreter','latex')
grid on


saveas(fig1,"StepIndex.svg");
saveas(fig1,"StepIndex.png");
