% simulasi A-scan dengan monocyle 
% asumsikan ada 2 target pemantul
%
%-- definisikan koordinat waktu --
dt=0.01;
t= 0:dt:1;
% target pertama
sigma1=2*dt;
mu1=20*dt;
%
% target kedua
sigma2=4*dt;
mu2=50*dt;
% generate fungsi gauss 
g1=fgauss(sigma1,mu1,t);
g2=fgauss(sigma2,mu2,t);
g=0.5*(g1+g2);
% monocycle= turunan pertama fs gauss
s=diff(g); % generate monocycle
%% add noise
n=randn(length(s),1);
s=s';
sn=s+0.25*n;

figure(1);
subplot(3,1,1); plot(g); title('gaussian');
subplot(3,1,2); plot(s);title('monocycle');
subplot(3,1,3); plot(sn); title('noisy monocycle');