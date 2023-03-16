% Transform Fourier dari fungsi Gauss
% "F_normal_baku.m" 
function [G] = F_normal_baku(sigma,w)
  G = exp(-w.*w*(sigma*sigma));
%%
