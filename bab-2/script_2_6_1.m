
% -------------------------------------------
% Mengitung koherensi beberapa pasangan basis 
% -------------------------------------------
N=4; %dimensi basis
I=eye(N,N); %basis identitas / waktu 
DFT=fft(eye(N,N))/(sqrt(N)); %basis DFT 
H2=[1 1 1 1; 1 -1 1 -1; 1 1 -1 -1; 1 -1 -1 1]/2;
mu1=mu_GUP(I,DFT); %koherensi waktu-frekuensi 
disp(sprintf('Koherensi basis waktu-frekuensi %f\n', ...
   mu1)); 
mu2=mu_GUP(H2,DFT); %koherensi Hadamard-Fourier 
disp(sprintf('Koherensi basis Hadamard-Fourier %f\n',...
   mu2));

