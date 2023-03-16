% fungsi membuat citra "H"
% "gen_H.m"
function [imgCKB]=gen_checkerboard 
 imgCKB=255*ones(16,16);
 imgCKB(1:8,1:8)=0;
 imgCKB(9:16,9:16)=0;
 %--
 imagesc(imgCKB);

