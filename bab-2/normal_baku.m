% Fungsi untuk menghitung nilai fs Gauss
% "normal_baku.m" 
function [g]= normal_baku(sigma,t)
  g=(1/sqrt(2*pi*sigma*sigma))* ...
    exp(-t.*t/(sigma*sigma));
