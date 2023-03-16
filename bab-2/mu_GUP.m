% fungsi yang dipanggil
% "mu_GUP.m"
function [mu_value]= mu_GUP(PHI, PSI);
% fungsi koherensi dua buah sistem basis
% untuk memperlihatkan GUP 
% masukan: PHI, PSI matriks berdimensi sama 
[M,N]=size(PHI);
G=PHI'*conj(PSI);
mu_value = sqrt(M)*max(max(abs(G)));