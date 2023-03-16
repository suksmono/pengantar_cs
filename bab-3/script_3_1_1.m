
% ------------------------------------------
% Sinyal pada Basis Impuls dan DCT
% ------------------------------------------
N=64; %dimensi vektor basis
x=1:N; %buat sumbu x 
PHI=eye(N,N); %Basis Impulse 
PSI=dct(eye(N,N)); %Basis DCT
%
figure(1);
plot(x,PHI(2,:),x,1+PHI(4,:),x,2+PHI(8,:),...
  x,3+PHI(16,:),x,4+PHI(32,:),x,5+PHI(60,:),...
  'LineWidth',2);
title('Vektor basis impuls'); figure(2);
%
plot(x,PSI(2,:),x,0.5+PSI(4,:),x,1+PSI(8,:), ...
  x,1.5+PSI(16,:),x,2+PSI(32,:),x,2.5+PSI(60,:), ...
  'LineWidth',2);
title('Vektor basis DCT'); 
