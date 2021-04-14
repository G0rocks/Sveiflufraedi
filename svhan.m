% Function sem kveikir á Hanning
function svhan
radiohan = findobj('String','Hanning');
radiofla = findobj('String','Flat Top');
set(radiohan,'Value',1);
set(radiofla,'Value',0);
end