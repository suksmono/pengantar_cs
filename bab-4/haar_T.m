
% ------------------------------------------------------------------
% ** fungsi membentuk matriks transformasi Haar **
% ------------------------------------------------------------------
function [H]=haar_T(h_size);
n=ceil(log2(h_size));N=2^n;
H=zeros(N,N);
norm_factor=1/sqrt(N);

% define z-axis
z=(0:1:N-1)/N;
H(1,:)=1;
for p=0:n-1;
  for q=1:2^p;
   k=2^p+q-1;
    % disp(sprintf('k=%d , p=%d, 
    %  q= %d \n',k,p,q)); % debug p and q
    hk=zeros(N,1);
    hk_1=2^(p/2); hk_2=-(2^(p/2));
    lb_1=ceil(N*(q-1)/2^p);
    ub_1=ceil(N*(q-0.5)/2^p);
    lb_2=ceil(N*(q-0.5)/2^p);
    ub_2=ceil(N*q/2^p);
    % *debug z-bound
    % disp(sprintf('lb_1=%d , ub_1=%d, 
    % lb_2= %d, ub_2= d\n',...
    %  lb_1,ub_1,lb_2,ub_2));
    H(k+1,lb_1+1:ub_1)=hk_1;
    H(k+1,lb_2+1:ub_2)=hk_2;
  end
end;
H=H*norm_factor

