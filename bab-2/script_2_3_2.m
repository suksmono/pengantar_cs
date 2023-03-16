
% -----------------------------------------
% cara-1: kalikan sinyal dengan matriks DFT 
% -----------------------------------------
s=[2 3 7]',	% sinyal asli
N=length(s);
U=fft(eye(N,N))/sqrt(N); % matriks DFT 3x3 
S1= U*s,	% hasil transformasi Fourier
% -----------------------------------------
% cara-2: langsung dengan perintah fft 
% -----------------------------------------
S2=fft(s)/sqrt(N), % hasil sama dengan S1

