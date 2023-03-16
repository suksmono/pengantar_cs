
% --------------------------------
% sebaran energi pada kawasan waktu 
% dan kawasan frekuensi
% --------------------------------
S=S1; % hal yang sama untuk S=S2
% Cek sifat uniter, T. Parseval, dan sebaran 
conj(transpose(U))*U; % jika uniter, hasilnya I
% Energi kawasan waktu
E_waktu=sum(conj(transpose(s))*s); 
% Energi kawasan frekuensi 
E_frekuensi=sum(conj(transpose(S))*S);
E_dist_frek = S.*conj(S), % sebaran energi
