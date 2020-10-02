clc
clear all
clc
clear all
clear all
c1=double(imread('C:\Users\Dr.Arg\Desktop\Hilbert & fringes\fr0.png'));
V =medfilt2(c1,[5 5]);
for i=1:1:576
VV=V(i,:);
VV=VV-mean(VV);
HH=hilbert(VV);
IM=imag(HH);
T=atan2(IM,VV);
b(i,:)=T;
NN(i,:)=IM;
DD(i,:)=VV;
end
P=b;
figure,imshow(P,[])
[m, n]=size(P);
        for i =1:m
        for j= 1:n
            if (j==n)
                a=0;
            else
               a=P(i,j+1)-P(i,j);
            end
            if (a>=pi)
                a=a-2*pi;
            elseif(a<=-pi)
                a=a+2*pi;
            end
            if (j==1)
                b=0;
            else
                b=P(i,j)-P(i,j-1);
            end
              if (b>=pi)
                  b=b-2*pi;
              elseif(b<=-pi)
                  b=b+2*pi;
              end
            if (i==m)
                c=0;
            else
                c=P(i+1,j)-P(i,j);
            end
               if (c>=pi)
                  c=c-2*pi;
               elseif(c<=-pi)
                  c=c+2*pi;
               end
            if (i==1)
                d=0;
            else
                d=P(i,j)-P(i-1,j);
            end
                if (d>=pi)
                   d=d-2*pi;
                elseif(d<=-pi)
                   d=d+2*pi;
                end
            R(i,j)=(a-b+c-d);
            clear a b c d;
      end
   end
   r=dct2(R);
  clear R;
  for k=1:m
        for l=1:n
            q(k,l)=r(k,l)/(2*cos(pi*k/m)+2*cos(pi*l/n)-4);
        end
  end
  clear r;
  Q=2*idct2(q);
  clear q;
  lam=0.6328;
S=Q*lam/(4*pi);
S=S-min(min(S));


  figure  
  surf(S,'FaceColor','interp', 'EdgeColor','none', 'FaceLighting','phong') 
  view(-30,30), camlight left, axis tight  
  title('Noisy continuous phase image displayed as a surface plot')
  xlabel('Pixels'), ylabel('Pixels'), zlabel('Phase in radians') 
  
  
  