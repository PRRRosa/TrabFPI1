function[Irot]=giraI(I,angulo)

radiano = angulo*pi/180;

[x,y]=size(I);

M=x*sqrt(2);
N=y*sqrt(2);
Irot= uint8(zeros(ceil(M),ceil(N)));

for l=1:M
    for c = 1:N
       i=round ((l-M/2)*cos(radiano)+(c-N/2)*sin(radiano)+x/2);
       j=round (-(l-M/2)*sin(radiano)+(c-N/2)*cos(radiano)+y/2);
       
       if i>0 && j>0 && i<=x && j<=y;
           
       Irot(l,c)=I(i,j);
       end
    end
end
end

