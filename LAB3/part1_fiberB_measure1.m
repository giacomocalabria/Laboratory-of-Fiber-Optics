clear all;
close all;

%%  MEASURE 1 - VERY BENDED FIBER  %% 

% trace A
filenameA= 'W0006.txt';
delimiterIn = ',';
headerlinesIn = 3;
dataA = importdata(filenameA,delimiterIn,headerlinesIn);
lambdaA = dataA.data(:,1);
attA = dataA.data(:,2);

% trace B
filenameB = 'W0007.txt';
delimiterIn = ',';
headerlinesIn = 3;
dataB = importdata(filenameB,delimiterIn,headerlinesIn);
lambdaB = dataB.data(:,1);
attB = dataB.data(:,2);

% normal plot 
figure
plot(lambdaA,attA,lambdaB,attB);
grid on
xlabel('Wavelength [nm]');
ylabel('Attenuation [dBm]');
title('FIBER A')
legend('trace A', 'trace B')

% finding 0.1 dB value 
db0line = zeros(length(attB),1) + 0.1;

%finding the intersection between line at 0.1db and the function
[up,low] = envelope(attA-attB,5,'peak'); %up --> upper envelope of the function

int01x = [];
int01y = [];
[int01x,int01y] = polyxpoly(lambdaA,up,lambdaA,db0line); %intersections with envelope

int01xN = [];
int01yN = [];
[int01xN,int01yN] = polyxpoly(lambdaA,attA-attB,lambdaA,db0line); %intersections with normal function

%plot with envelope 
figure
plot(lambdaA,up,lambdaA,attA-attB);
grid on
xlabel('Wavelength [nm]');
ylabel('RX power [dB]');
yline(db0line,'--','0.1 dB line');
xline(int01x(2:5),'-.')
title('Trace A - trace B');


%plot without envelope 
figure
plot(lambdaA,attA-attB);
grid on
xlabel('Wavelength [nm]');
ylabel('RX power [dB]');
yline(db0line,'--','0.1 dB line');
xline(int01xN(2:5),'-.')
title('Trace A - trace B');

%results (printing the intersections values with envelope)
disp('Interrsections at λ [nm] = ')
disp(int01x(2:5))

%results (printing the intersections values WITHOUT envelope)
disp('Interrsections at λ [nm] = ')
disp(int01xN(2:5))





