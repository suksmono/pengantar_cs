% -----------------------------------------------
% progam menghitung koherensi dan batas sparsitas
% antara basis DCT dengan basis acak Gauss 
% -----------------------------------------------
clear;close all;clc;
N=512; %panjang sinyal yang diasumsikan

% buat basis DCT berdimensi NxN 
THETA=dct(eye(N,N));
% buat basis acak Gauss NxN 
PSI=orth(randn(N,N)')';

% hitung koherensi antara DCT dengan Gauss 
mu_DCT_Gauss=mu_THETA_PSI(THETA,PSI); 
disp(sprintf('koherensi DCT-Gauss = %f\n', ... 
 mu_DCT_Gauss));

% Tentukan batas sparsity
% kasus-1: DHB (Donoho-Huo bound) 
N_DHB=floor(0.5*(1+1/mu_DCT_Gauss)); 
disp(sprintf('batas sparsity Donoho-Huo= %d\n', ...
 N_DHB));
% kasus-2: EBB (Elad-Bruckstein bound) 
N_EBB=floor((sqrt(2)-0.5)/mu_DCT_Gauss); 
disp(sprintf('batas sparsity Elad-Bruckstein= %d', ...
 N_EBB));
