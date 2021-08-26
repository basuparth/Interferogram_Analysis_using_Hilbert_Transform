pixel=[524 608 644];
wavel=[508.6 480 467.8];
p=polyfit(pixel,w1,1);
x=100:1:724;
y=p(1)*x+p(2);
plot(x,y,pixel,wavel,'*')
hold on
plot(124,643.8,'*m')
hold off
title('pixel vs wavelength')
xlabel('pixel')
ylabel('wavelength in nm')
grid on 
