% -----------------------------------------------------------
% Simulasikan Digital Micromirror Device
% N: jumlah cermin dlm DMD
% M_sub: jumlah sub-sample yang diinginkan
% x_0: intensitas cahaya yg tertangkap sensor
% -----------------------------------------------------------
%
% randomize mirror in DMD
rp=randperm(N); 
act_cell(1:M_sub)=rp(1:M_sub);
PHI=zeros(M_sub,N);
for k=1:M_sub; 
  PHI(k,act_cell(k))=1;
end;
PHI=orth(randn(M_sub,N)')'>0;
% *** Lakukan pengukuran x_sub=PHI*x0 ***
x_sub=PHI*x0; 