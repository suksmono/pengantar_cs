
% --------------------------------------
% progam menghitung koherensi dan
% batas sparsitas basis acak Gauss
% --------------------------------------
clear;close all;clc;
N=64;M=1024; %dimensi kamus basis
%buat basis acak Gauss MxN 
D=orth(randn(N,M)')';
%hitung koherensi kamus basis D 
mu=mu_PHI(D);
disp(sprintf('koherensi kamus-basis = %f\n', mu));
%Tentukan batas sparsity 
N_sparse=floor(0.5*(1+1/mu)); 
disp(sprintf('batas sparsity = %d', N_sparse));
%

