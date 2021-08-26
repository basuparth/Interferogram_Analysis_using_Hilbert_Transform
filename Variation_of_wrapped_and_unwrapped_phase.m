frame=input('enter the name of the frame with path','s');
type='.png';
for i=1:1:8
    a=[frame num2str(i) type];
    j=i;
    b(:,:,j)=double(imread(a));
end

I=b(:,:,:);
clear a b
[p,q,r]=size(I);
num=-I(:,:,1)-5*I(:,:,2)+11*I(:,:,3)+15*I(:,:,4)-15*I(:,:,5)-11*I(:,:,6)+5*I(:,:,7)+I(:,:,8);
den=I(:,:,1)-5*I(:,:,2)-11*I(:,:,3)+15*I(:,:,4)+15*I(:,:,5)-11*I(:,:,6)-5*I(:,:,7)+I(:,:,8);
vp=150;
for i=1:1:724
    wp(i)=atan2(num(vp,i),den(vp,i));
end

pixel=[124 524 608 644];
wavel=[643.8 508.6 480 467.8];
p=polyfit(pixel,wavel,1);
x=1:1:724;
y=p(1)*x+p(2);
sigma=(10^9)./y;
figure,plot(sigma,wp,'k','linewidth',1)
grid on
grid on
xlabel('Wavenumber(in 1/m)')
ylabel('Wrapped phase(in radian)')
title('Wrapped Phase Plot')
unph=unwrap(wp)';
figure,plot(sigma,unwp,'k','linewidth',1)
grid on
xlabel('Wavenumber(in 1/m)')
ylabel('Unwrapped Phase(in radian)')
title('Unwrapped Phase vs Wavenumber')
grid on

