% Function sem kveikir á Flat Top
function svflat
radiohan = findobj('String','Hanning');
radiofla = findobj('String','Flat Top');
set(radiohan,'Value',0);
set(radiofla,'Value',1);
end