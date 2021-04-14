function svmae
% Sækja söfnunartíðni og fjöldi mæligilda fyrir mæling
Soft = findobj(gcbf,'Tag','Softidni');
fs = str2num(get(Soft,'String'));
Fjol = findobj(gcbf,'Tag','Fjolmael');
N = str2num(get(Fjol,'String'));

% Mæla
xAcc = ADread(4,fs,N);

% Búa til tímaás
dt = 1/fs;
tN = (N-1)/fs;
t = 0:dt:tN;

% Vista tímaás og mælingu í glugga
xyd = [t'  xAcc];
set(gcbf,'UserData',xyd);

% Teikna mælingu
figure(1)
plot(t,xAcc);
title('Mæling');
xlabel('Tími [sek]');
ylabel('Hröðun [m/sek2]');