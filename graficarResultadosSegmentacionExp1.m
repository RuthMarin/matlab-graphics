function graficarResultadosSegmentacionExp1()
% abril 2021
% exp1: scratch con DA (comparación de unet vs masknet

dice={};
% dice 1-3 .. unet.. cabeza acrosoma nucleo
% dice 4-6 .. mask.. cabeza acrosoma nucleo

%%%U-NET SCRATCH
load unetScratch.mat   % cabeza nucleo acrosoma
dice{1}=unetSratch{1}';
dice{2}=unetSratch{3}'; 
dice{3}=unetSratch{2}';

%%%UNET HELA
%load unetHela.mat   % cabeza nucleo acrosoma
%dice{4}=cell2mat(data{1})';
%dice{5}=cell2mat(data{2})'; 
%dice{6}=cell2mat(data{3})';

%%%MASK-RCCN SCRATCH
load maskScratch.mat % cabeza nucleo acrosoma
dice{4}=maskSratch{1}';
dice{5}=maskSratch{3}'; 
dice{6}=maskSratch{2}';

%%%MASK-RCCN HELA
%load maskHela.mat   % cabeza nucleo acrosoma
%dice{4}=cell2mat(data{1})';
%dice{5}=cell2mat(data{2})'; 
%dice{6}=cell2mat(data{3})';

%% ------ completamos elementos de vectores
tamanosD=[];
for x=1:6
    tamanosD=[tamanosD size(dice{x},2)];
end
[maximoD,idxD]=max(tamanosD);

for x=1:6
    dif=abs(maximoD-tamanosD(x));
    if (dif ~= 0)
        if (maximoD > tamanosD(x))
            dice{x}=[dice{x} NaN(1,dif)];
        end
    end
end


%% ------ graficamos Dice ----------

% Concatenate the data sets from each group in a maximo x 3 matrix
x = cat(2,dice{1}',dice{2}',dice{3}'); 
y = cat(2,dice{4}',dice{5}',dice{6}');

% Concatenate the each group in a  2 x maximo x 3 matrix
h = cat(1, reshape(x,[1 size(x)]), reshape(y,[1 size(y)]));

save('diceScratch','h');

fig=figure; % identificacion de figura

aboxplot(0,h,'labels',{'Head','Acrosome','Nucleus'},'colorgrad','orange_down'); % Advanced box plot
ylabel('Dice Coefficient');
ylim([0.4 1])
legend( ...
    ['U-net'],...  
    ['Mask-RCNN'], ...
    'Location','SouthEast');

print(fig,'-dpng','-r200','scratch'); %guardar imagen como png

%data = {{} {} {}}
%save('unetHela.mat','data')



