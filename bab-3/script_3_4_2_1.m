% -----------------------------------------	
% Basis pursuit pada basis overcomplete
% menggunakan Matlab Optimization Toolbox
% -----------------------------------------	
% 	
% length of signal 
clear;close all;clc;
N=64; %signal dimension 
over_factor=2; %over complete factor 
nAtoms=N*over_factor;

% create pair of orto-basis dictionary 
D1=eye(N,N); D2=dct(eye(N,N)); D=[D1;D2]';

% create a signal with N_support 
N_support=4;
pN=[8 32 73 125]; %dpt diganti dng indeks acak
x=zeros(N,1); 
X=zeros(nAtoms,1);%'transformed-domain signal 
for k=1:N_support;
  x=x+D(:,pN(k)); X(pN(k))=1; 
end; 
x0=x;

figure(1);plot(x0,'LineWidth',2);
xlabel('n');ylabel('s(n)');
title('Original Signal');

% perform measurement, >> add noise 
derau=randn(N,1);
y = x0 + 5*derau/(derau'*derau); 
min_y=min(y);
D_pos=-D;
% define dictionary A 
A=zeros(N,2*over_factor*N); 
A(:,1:over_factor*N)=D; 
A(:,over_factor*N+1:2*over_factor*N)=D_pos;

% Basis Pursuit on random basis 
f=ones(2*nAtoms,1); lb=zeros(2*nAtoms,1);
alpha=linprog(f,[],[],A,y,lb);

figure(2);
plot(1:nAtoms,X,'r:',1:nAtoms, ...
  alpha(1:nAtoms),'b--','LineWidth',2); 
  legend('original','alpha');


% get a few largest component by sorting alpha 
[z,imax]=sort(alpha(1:nAtoms));

% Reconstruct estimated signal 
x_hat=zeros(N,1);
for k=1:N_support;
  x_hat=x_hat+ D(:,imax(nAtoms-k+1)); 
end;
x_hat1=D*alpha(1:nAtoms);
figure(3);
plot(1:N,x0,'k.',1:N,y,'b-',1:N,x_hat,'r:',...
 1:N,y-x0,'g-',1:N,x_hat1,'k--', 'LineWidth',2); 
legend('original','noisy','estimated',...
 'noise-level','D*alpha');
xlabel('n');ylabel('s(n)');
%
figure(4);
plot(1:N,y-x0,'r-',1:N,x_hat-x0,'b-', ...
  1:N,x_hat1-x0,'k-', 'LineWidth',2); 
legend('initial error','estimation error', ...
  'D*alpha error');
xlabel('n');ylabel('e(n)');

