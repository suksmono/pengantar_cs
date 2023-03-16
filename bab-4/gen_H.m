% fungsi membuat citra "H"
% "gen_H.m"
function [imgH]=gen_H 
 imgH=255*ones(16,16);
 imgH(1:5,5:12)=0;
 imgH(12:16,5:12)=0;
 %--
 imagesc(imgH);

