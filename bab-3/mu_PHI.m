% === fungsi yang dipakai ===
%fungsi menghitung koherensi kamus basis
% "mu_PHI.m"
function [mu]=mu_PHI(PHI); 
  [M,N]=size(PHI);
  CORR=transpose(conj(PHI))*PHI; 
  mu=max(max(CORR));