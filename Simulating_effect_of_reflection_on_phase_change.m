w1=data(:,1);
n=data(:,2);
k=data(:,3);
N:no.of data base point
for i=1:1:N
    phi(i)=atan2(2.*k(i),1-n(i)^2-k(i)^2);
end

plot(w1,phi)
grid on
k=1;
for i=1:length(w1)
    if w1(i)>=400
    if w1(i)<=750
        w1k(k)=w1(i);
        phi1(k)=phi(i);
        k=k+1;
    else
    end
else
end
end

figure,plot(w1k,phi1)
grid on
xlabel('wavelength')
ylabel('non linear phase change')
title('Simulated plot of total phase')
b=1;
po=polyfit(w1k,ppp,b);
phs=ppp-po(1).*w1k-po(2);
figure,plot(w1k,phs)
grid on
xlabel('wavelength')
ylabel('non linear phase change')
title('Simulated plot of non linear part')
grid on

