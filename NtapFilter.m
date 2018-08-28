[y1,Fs] = audioread('mike.wav');


%2120 unit is equal 100ms
K=100;
M=floor(191258/9000);
h=dfilt.delay(M*K);

for A=1:10
    N=10;
    K=100;
    [SNR(A),E]=ff(y1,K,M,h,A/10,N);
    
end
figure
subplot(2,1,1)

plot(SNR)
title('SNR with changing a')
subplot(2,1,2)
plot(E)
title('recovered signal')
for K=100:100:400
    N=50;
    A=0.5;
    [SNR2(K/100),E2]=ff(y1,K,M,h,A,N);
    
end
figure
subplot(2,1,1)

plot(SNR2)
title('SNR with changing K')
subplot(2,1,2)

plot(E2)
title('recovered signal')

for N=1:50
    A=1;
    K=100;
    [SNR3(N),E3]=ff(y1,K,M,h,A,N);
    
end
figure
subplot(2,1,1)

plot(SNR3)
title('SNR with changing N')
subplot(2,1,2)

plot(E3)
title('recovered signal')


function [SNR,E]=ff(y1,K,M,h,A,N)
    I=y1;
    if(N>1)
    y2=filter(h,y1);
    
    y1=y1+(-A)*y2;    

    for i=2:N
    
   
        y2=filter(h,y2);
        y1=y1+(-A)^i*y2;
    
    end

end
   
E=y1;

C=0;

B=0;
for i=1:length(y1)
   C=C+I(i)^2 ;
   B=B+(E(i)-I(i))^2; 
end
SNR=10*log(C./B);
end






