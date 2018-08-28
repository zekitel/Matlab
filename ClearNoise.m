[y1,fs] = audioread('street.wav');
[y2,fs] = audioread('mike.wav');



f1=20000/fs;
f2=1-1/fs;


[b,a] = butter(3,[f1 f2],'stop');

dataIn = y1+y2;
dataOut = filter(b,a,dataIn);


L=length(y1);
Y1=fft(y1);
Y2=fft(y2);
Y3=fft(y1+y2);
AAA=length(Y1);
DataOut=fft(dataOut);


figure
subplot(2,2,1);
plot(abs(Y1(1:L/2)));
axis([0 100000 0 350])
title('Frequency domain of street');
subplot(2,2,2);
plot(abs(Y2(1:L/2)));
title('Frequency domain of mike');
axis([0 100000 0 350])
subplot(2,2,3);
plot(abs(Y3(1:L/2)));
title('Frequency domain of street+mike');
axis([0 100000 0 350])

figure
subplot(2,2,1);
plot(y1);
title('Time domain of street');
subplot(2,2,2);
plot(y2);
title('Time domain of mike');
subplot(2,2,3);
plot(y1+y2);
title('Time domain of street+mike');


figure
subplot(2,1,1);
plot(abs(Y2(1:L/2)));
title('Frequency domain of mike');
axis([0 100000 0 350])
subplot(2,1,2);
plot(abs(DataOut(1:AAA/2)));
title('Frequency domain of Filtered Data');
axis([0 100000 0 350])
figure
subplot(2,1,1);
plot(y2);
title('Time domain of mike');
subplot(2,1,2);
plot(dataOut);
title('Time domain of Filtered Data');
I=y1;
E=dataOut;

C=0;

B=0;
for i=1:length(y1)
   C=C+I(i)^2 ;
   B=B+(E(i)-I(i))^2; 
end
SNR=10*log(C./B);
SNR


