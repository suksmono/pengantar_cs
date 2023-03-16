 %==FUNGSI ===
% fungsi menghitung koherensi dua orto basis 
function [mu]=mu_THETA_PSI(THETA,PSI);
  [M,N]=size(PSI); % THETA diasumsikan berdimensi sama 
  CORR=transpose(conj(THETA))*PSI; 
  mu=max(max(CORR));