%  -----------------------------------------------	
% Script Matlab untuk menunjukkan 
% prinsip ketidakpastian
%  -----------------------------------------------	
% clear;clc;
%
t=-5:0.1:5; w=t; % koordinat waktu dan frekuensi. 
sigma1=1; sigma2=0.5; sigma3=0.25; % var

% Hitung Fungsi Gauss 
g1=normal_baku(sigma1,t); 
g2=normal_baku(sigma2,t); 
g3=normal_baku(sigma3,t);

% Hitung transform Fourier-nya 
G1=F_normal_baku(sigma1, w); 
G2=F_normal_baku(sigma2,w); 
G3=F_normal_baku(sigma3,w);

figure(1);plot(t,g1,t,g2,t,g3, 'LineWidth',2);
legend('\sigma=1','\sigma=0.5','\sigma=0.25');
xlabel('t');
ylabel('g(t)'); 

figure(2);plot(w,G1,w,G2,w,G3, 'LineWidth',2);
legend('\sigma=1','\sigma=0.5','\sigma=0.25')
xlabel('w');
ylabel('|G(w)|'); 
% 
% -------------------------------------
% Fungsi yang dipanggil
% didefinisikan dalam file yang berbeda
% -------------------------------------
% Fungsi untuk menghitung nilai fs Gauss
% "normal_baku.m" 
%
% function [g]= normal_baku(sigma,t)
%   g=(1/sqrt(2*pi*sigma*sigma))* ...
%     exp(-t.*t/(sigma*sigma));
%	
% Transform Fourier dari fungsi Gauss
% "F_normal_baku.m" 
%	 
% function [G] = F_normal_baku(sigma,w)
%   G = exp(-w.*w*(sigma*sigma));
%%

