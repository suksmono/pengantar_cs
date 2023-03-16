% -------------------------------------
%** Transformasi sinyal ** 
% -------------------------------------
s=[2 3 7]',	% sinyal asli
% ** Definisikan matriks transformasi **
T=[cos(pi/4) -sin(pi/4) 0; ... 
  sin(pi/4) cos(pi/4) 0; ...
  0 0 1]; 
S=T*s,	% sinyal hasil transformasi