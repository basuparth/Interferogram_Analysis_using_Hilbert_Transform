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

for vp=1:1:416
    for i=1:1:724
        wp(i)=atan2(num(vp,i),den(vp,i));
    end
    unph=unwrap(wp)';
    pixel=[124 524 608 644];
    w1=[643.8 508.6 480 467.8];
    p=polyfit(pixel,w1,1);
    x=1:1:724;
    y=p(1)*x+p(2);
    sigma=(10^9)./y;
    sgma=sigma';
    c=polyfit(sgma,unph,1);
    unwp=c(1)*sigma+c(2);
    z(vp)=c(1)/(4*pi);
end

vpix=1:1:416;
Zvar=z.*10^9;
figure,plot(vpix,Zvar,'k','linewidth',1)
Zvar1=medfilt1(Zvar,7);
step=Zvar(150)-Zvar(350)
figure,plot(vpix,Zvar1,'m','linewidth',1)
grid on
xlabel('pixel')
ylabel('height z')
title('height variation with vertical pixel')
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
unwp1=unwrap(wp)';
pixel=[124 524 608 644];
w1=[643.8 508.6 480 467.8];
p=polyfit(pixel,w1,1);
x=1:1:724;
y=p(1)*x+p(2);
sigma=(10^9)./y;
sgma=sigma';
plot(sgma,unwp1,'k','linewidth',1)
p1=polyfit(sgma,unwp1,1);
y1=p1(1)*sgma+p1(2);
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
vp=350;
for i=1:1:724
    wp(i)=atan2(num(vp,i),den(vp,i));
end

unwp2=unwrap(wp)';
pixel=[124 524 608 644];
w1=[643.8 508.6 480 467.8];
p=polyfit(pixel,w1,1);
x=1:1:724;
y=p(1)*x+p(2);
sigma=(10^9)./y;
sgma=sigma';
plot(sgma,unwp2,'k','linewidth',1)
p2=polyfit(sgma,unwp2,1);
y2=p2(1)*sgma+p2(2);
hold on
d=unwp1-unwp2;
plot(sgma,d,'k','linewidth',1)
hold off
p11=polyfit(sgma,d,1);
y11=sgma*p11(1)+p11(2);
step1=p11(1)./(4*pi)
plot(sgma,y11)
hold off
grid on
xlabel('wavenumber(1/m)')
ylabel('phase variation(in radian)')
title('Total phase variation in gold')
d1=d-y11;
figure,plot(sgma,d1)
wv1=10^9./sgma;
figure,plot(wv1,d1)
hold on
order=8;
po=polyfit(wv1,d1,order);
ph=0;
for sr=1:order+1
    nph=po(yt).*(wv1).^(order+1-sr);
    ph=nph+ph;
end

plot(wv1,ph,'k','linewidth',1)
xlabel('wavelength(nm)')
ylabel('phase variation(in radian)')
title('Non linear phase variation for gold')
grid on
hold off
