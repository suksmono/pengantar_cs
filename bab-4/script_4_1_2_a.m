
%---------------------------------------------
% Pencitraan Kompresif: kamera satu piksel(sensor)
%----------------------------------------------
clear;%
close all;clc;
% read original image
%I=double(imread('IMG\H.bmp','bmp'));
I=double(gen_H);

% tampilkan citra asal;
figure(1); 
imagesc(I); colormap(gray); 
title('citra asli');
[N_col,N_row]=size(I);
N=N_col*N_row; %panjang sinyal

% Pembentukan basis sparsity /DCT --> Haar
%PSI=dct(eye(N,N)); %buat matriks DCT
PSI = haar_T(N)'; % buat matriks transf Haar
K_sparse=2*round(sqrt(N));%tingkat sparsity
x = reshape(I,N,1); %ubah menjadi vektor
x0=(x-mean(x))/(max(x)-min(x));%normalisasi

% proses pengamatan/pengukuran
% estimasikan minimal jumlah cuplikan M>CKlog(N)
mu=1*(1/sqrt(N)); %tentukan koherensi->perkiraan
% koherensi tak ternormalisasi=sqrt(N)*koh
C=sqrt(N)*mu;
M_sub=ceil(C*K_sparse*log(N));

% *** Simulasikan Digital Micromirror Device ***
%randomize mirror in DMD
rp=randperm(N); 
act_cell(1:M_sub)=rp(1:M_sub);
PHI=zeros(M_sub,N);
for k=1:M_sub; 
  PHI(k,act_cell(k))=1;
end;
PHI=orth(randn(M_sub,N)')'>0;
% *** Lakukan pengukuran x_sub=PHI*x0 ***
x_sub=PHI*x0;
x_obs=zeros(N,1);
x_obs(act_cell)=x0(act_cell);

%Lakukan recovery
%Bentuk kamus basis D=PHI*PSI
D=PHI*PSI;
%x_sub=D*x0;
figure(2);
imagesc(reshape(x_obs,N_row,N_col));
colormap(gray);title('Citra hasil observasi');
[D_row,D_col]=size(D);
D_pos=-D;

% ubah L1 menjadi LP
A=zeros(D_row,2*D_col);
A(:,1:D_col)=D;
A(:,D_col+1:2*D_col)=D_pos;
f=ones(2*D_col,1);
lb=zeros(2*D_col,1);
f1=ones(2*D_col,1);
lb1=zeros(2*D_col,1);
A1=-A;
x_sub1=x_sub;

%*******************************
%* Jalankan algoritma simpleks *
%*******************************
% get positive part
alpha0=linprog(f,[],[],A,x_sub,lb); 
% get negative part
alpha1=linprog(f1,[],[],A1,x_sub1,lb1);
alpha=alpha0-alpha1;
% Urutkan
[z,imax]=sort(abs(alpha(1:D_col)),'descend');
x_abs=1:D_col;
figure(3);
plot(x_abs, z,'b-','LineWidth',2);
xlabel('n');ylabel('|\alpha|');


%Reconstrusi Citra
%===
x_hat=zeros(N,1);
for k=1:K_sparse;
 x_hat=x_hat+alpha(imax(k))*PSI(:,imax(k));
end;
Ip = reshape(x_hat, N_row, N_col);
%% check
%%--post-processing--
% binarisasi citra
Ip1=double(Ip>0);
% kembalikan ke gray scale
Ip1=255*Ip1;
%%
figure(4);
subplot(121); imagesc(Ip);colormap(gray);
title('citra rekonstruksi');
subplot(122); imagesc(Ip1);colormap(gray);
title('buinarisasi citra hasil');
