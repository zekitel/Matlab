[y1,Fs] = audioread('snap.wav');



L=length(y1);
f = Fs*(0:(L/2))/L;
 
Y1 = fft(y1);
S2 = abs(Y1/L);
S1 = S2(1:L/2+1);
S1(2:end-1) = 2*S1(2:end-1);


figure

plot(f,S1)


ss=max(S1);
for i = 1:750
   if(S1(i)== ss)
       
       disp 'clap is detected';
       break;
   
   
   end
end

for i = 750:length(S1)-1
   if(S1(i)==ss)
       
       disp 'snap is detected';
       break;
   
   
   end
end
    


