
% -----------------------------------------
% pemrograman linier untuk masalah sederhana
% min c'x s.t. Ax<=b; x1>=1, x2>=1
% -----------------------------------------
%	 
c=[1;-1]; % koefisien fungsi obyektif 
A=[1 1; 1 -1]; %matriks Z
b=[10; 5]; % kendala
lb=[1 1] ; %batas bawah x1 dan x2
[x, fval,exitflag,output,lambda]= ...
   linprog(c,A,b,[],[],lb); 
disp(sprintf('x1= %f x2=%f\n',x(1),x(2))); %tampilkan

