%
% ------------------------------------------
% Pencarian basis 
% ------------------------------------------
clear;%close all;clc;
N=64; %dimensi vektor basis 
x=1:N; %buat sumbu x 
PHI=eye(N,N); %Basis Impulse 
PSI=dct(eye(N,N)); %Basis DCT
% bentuk sinyal dari basis DCT saja 
s1=zeros(N,1);s1=zeros(N,1); 
s1=(PHI(4,:)+PHI(32,:))';
s2=(PSI(8,:)+PSI(60,:))';
s=zeros(N,1); s=s1+s2;
%
figure(1);plot(x,s,'LineWidth',2); 
title('sinyal kombinasi impuls dan DCT'); 
xlabel('n');ylabel('s(n)');
S1=PHI*s; S2=PSI*s; %cari koefisien

% urutkan koefisien dan ambil dua terbesar 
[S1_oval,S1_oidx]= sort(abs(S1),'descend'); 
[S2_oval,S2_oidx]= sort(abs(S2),'descend');

% rekonstruksi sinyal 
s_hat1=zeros(N,1); s_hat2=zeros(N,1);
for k=1:8; 
 s_hat1=s_hat1+(S1(S1_oidx(k))*PHI(S1_oidx(k),:))'; 
end; 
for k=1:8; 
 s_hat2=s_hat2+(S2(S2_oidx(k))*PSI(S2_oidx(k),:))'; 
end;

% hitung nilai kesalahan
e1=s-s_hat1;e_rms1=sqrt(e1'*e1)/N;
disp(sprintf('rms error-Impulse%f',...
  e_rms1));
e2=s-s_hat2;e_rms2=sqrt(e2'*e2)/N;
disp(sprintf('rms error-DCT %f',e_rms2));

figure(2); plot(x,S1_oval,'r-', x,S2_oval,'b-', ...
    'LineWidth',2); 
title('magnitudo koefisien terurut'); 
xlabel('index');ylabel('|S|-terurut'); 
legend('proyeksi Impuls','proyeksi DCT');

figure(3);plot(x,s,'k.',x,s_hat1,'b:', ...
    x,s_hat2,'r-', 'LineWidth',2);
title('perbandingan hasil rekonstruksi');
xlabel('n');ylabel('s(n)'); 
legend('asli','rek. impuls','rek. DCT');

figure(4);plot(x,e1,'r-',x,e2,'b--', ...
    'LineWidth',2);
title('sinyal kesalahan'); 
xlabel('n');ylabel('e(n)');
legend('sinyal error impulse','sinyal error DCT');

% data error untuk beberapa nilai k 
x_e=[2 4 8 16 32 64]';
e_PHI=[2.18e-2 2.05e-2 1.78e-2 1.33e-2 5.94e-3 0.0]';
e_PSI=[2.16e-2 2.02e-2 1.77e-2 1.32e-2 6.28e-3 0.0]';
figure(5);
plot(x_e,e_PHI,'r-',x_e,e_PSI,'b-', ...
    'LineWidth',2); 
title('kinerja RMSE pengkodean'); 
xlabel('jumlah koefisien');ylabel('RMS Error'); 
legend('Impulse','DCT');