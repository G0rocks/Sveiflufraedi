function ya=ADread(nch,fs,N) 
    dt = 1/fs ; 
    tm = (N-1)/fs ; 
    t = 0:dt:tm ; 
for ii =1:nch 
     A1 = 0.20+0.5*ii ; 
     f1 = 1200/60+5*ii ; 
     ya(:,ii) = A1*sin(2*pi*f1*t) ; 
end 
