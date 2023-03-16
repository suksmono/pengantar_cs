% Fungsi untuk menghitung nilai fs Gauss
% "normal_baku.m" 
function [g]= fgauss(sigma,mu,t)
  g=(1/sqrt(2*pi*sigma*sigma))* ...
    exp(-(t-mu).*(t-mu)/(sigma*sigma));
