% Úrvinnsluforrit

function svfft
% Sækja söfnunartíðni og fjöldi mæligilda fyrir mæling
Soft = findobj(gcbf,'Tag','Softidni');
fs = str2num(get(Soft,'String'));
Fjol = findobj(gcbf,'Tag','Fjolmael');
N = str2num(get(Fjol,'String'));

% Sækja mælingu
xyd=get(gcbf,'UserData');
xAcc  = xyd(:,2:end);

% Búa til tíðniás
n = N/2;
w = fs*(0:n-1)./(2*(n-1));
wt = 2*pi*(1:N)'/(N+1);

% Lesa og skilgreina gluggun
radiohan = findobj(gcbf,'String','Hanning');
radiofla = findobj(gcbf,'String','Flat Top');
valhan = get(radiohan,'Value');
valfla = get(radiofla,'Value');
if(valhan ==1)
    % Hanning gluggi
    win = 1 -cos(wt);
    bandv=1.5;
elseif(valfla == 1)
    % Flat top gluggi
    win = 1-1.93*cos(wt)+1.29*cos(2*wt)-0.388*cos(3*wt)+0.0322*cos(4*wt);
    bandv=3.77;
end

% Reikna Fouriervörpun og aflróf fyrir einn mælinema
figure(2)
g_psd = fft(win.*xAcc(1:N,2));
Amp =sqrt( 4*((abs(g_psd)/N).^2));
hold on
plot(w(2:n),Amp(2:n),'r')
g_psd = fft(win.*xAcc(1:N,3));
Amp =sqrt( 4*((abs(g_psd)/N).^2));
figur(3)
plot(w(2:n),Amp(2:n),'g')
g_psd = fft(win.*xAcc(1:N,4));
Amp =sqrt( 4*((abs(g_psd)/N).^2));
figur(4)
plot(w(2:n),Amp(2:n),'b')
title('FFT -greining');
xlabel('Tíðni [Hz]');
ylabel('Hröðun [m/sek2]');
hold off
end