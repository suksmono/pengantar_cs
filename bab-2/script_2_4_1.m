
% --------------------------------------------
% Transformasi ortogonal: DCT dan Hadamard
% --------------------------------------------
s=[2 3 7 11]', % sinyal asli
N=length(s);
% buat matriks transformasi
D=dct(eye(N,N)); % DCT 4x4
H2=[1 1 1 1; 1 -1 1 -1; 1 1 -1 -1; 1 -1 -1 1]/2;
S_dct= D*s, % hasil transformasi DCT
S_had= H2*s, % hasil transformasi Hadamard
E_asli= sum(transpose(s)*s), % energi sinyal asal
% Energi kawasan DCT
E_dct =sum(transpose(S_dct)*S_dct) ,
E_hadamard =sum(transpose(S_had)*S_had) ,
% Energi kawasan Hadamard
% sebaran energi DCT
E_dist_dct = S_dct.*S_dct, 
% sebaran energi Hadamard
E_dist_had = S_had.*S_had, 
%
% gambarkan sebaran energi
figure(1); bar(E_dist_dct);
xlabel('k'); ylabel('E(k)'); 
title('Sebaran energi di kawasan DCT');
%
figure(2); bar(E_dist_had);
xlabel('k'); ylabel('E(k)'); 
title('Sebaran energi di kawasan Hadamard');

