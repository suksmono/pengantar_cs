
% -------------------------------------------	
% Sifat Invarian Sisir Dirac (Dirac Comb)
% terhadap Transformasi Fourier
% -------------------------------------------	
%	 clear; clc;
N=16; s=zeros(N,1); 
sqrt_N = round(sqrt(N)); 
maxIdx = floor(N/sqrt_N);
for m=1:maxIdx; s(m*sqrt_N) =1; end 
figure(1);stem(s,'LineWidth',2);
title('Time-domain Dirac Comb'); 
xlabel('Time');ylabel('Amplitude');
%Dirac Comb in Frequency Domain 
S=fft(s)/sqrt(N);
figure(2);stem(abs(S),'LineWidth',2);
title('Frequency domain abs(Dirac Comb)') 
xlabel('Frequency');ylabel('Magnitude');
