# Matlab Graphics

%%%U-NET SCRATCH
load unetScratch.mat   % cabeza nucleo acrosoma
dice{1}=unetSratch{1}';
dice{2}=unetSratch{3}'; 
dice{3}=unetSratch{2}';

%%%UNET HELA
load unetHela.mat   % cabeza nucleo acrosoma
dice{4}=cell2mat(data{1})';
dice{5}=cell2mat(data{2})'; 
dice{6}=cell2mat(data{3})';

%%%MASK-RCCN SCRATCH
load maskScratch.mat % cabeza nucleo acrosoma
dice{4}=maskSratch{1}';
dice{5}=maskSratch{3}'; 
dice{6}=maskSratch{2}';

%%%MASK-RCCN HELA
%load maskHela.mat  % cabeza nucleo acrosoma
%dice{4}=cell2mat(data{1})';
%dice{5}=cell2mat(data{2})'; 
%dice{6}=cell2mat(data{3})';


![alt text](https://github.com/RuthMarin/matlab-graphics/blob/master/diceExp1-tile.jpg?raw=true)
