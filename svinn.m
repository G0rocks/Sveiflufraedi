% Innlestrarforrit
function svinn
% Lesa mælingu úr skrá sem hefur veirð vistuð
[lename,pathname] = uigetfile('*.mat','Select file name');
logname = [pathname lename];
eval(['load 'logname]);
N = size(xAcc,1);
Soft = findobj(gcbf,'Tag','Softidni');
set(Soft,'String',num2str(fs));

Fjol = findobj(gcbf,'Tag','Fjolmael');
set(Fjol,'String',num2str(N));

% Búa til tímaás
dt = 1/fs;
tN = (N-1)/fs;
t = 0:dt:tN;

% Vista mælingu (í glugganum)
xyd = [t'  xAcc];
set(gcbf,'UserData',xyd);

% Teikna mælingu
figure(1)plot(t,xAcc);
title('Mæling');
xlabel('Tími [sek]');
ylabel('Hröðun [m/sek2]');
end