% Vistunarforrit 

function svvis
% Sækja upplýsingar til að vista
Utskr = findobj(gcbf,'Tag','Utskra');
fname = get(Utskr,'String');
Soft = findobj(gcbf,'Tag','Softidni');
fs = str2num(get(Soft,'String'));
Fjol = findobj(gcbf,'Tag','Fjolmael');
N = str2num(get(Fjol,'String'));

% Sækja mælingu
xyd=get(gcbf,'UserData');
xAcc  = xyd(:,2:end);
eval(['save 'fname ' xAcc fs N ']);
end