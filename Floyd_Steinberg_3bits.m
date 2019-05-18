function y =Floyd_Steinberg_3bits(x)

[M,N] = size(x);
y =zeros(M,N);
x = [zeros(M,1) x/255 zeros(M,1);zeros(1,N+2)];
x_save = x;

for i=1 : M
    for j = 2 : N+1
        temp = x_save(i,j)+x(i,j);
        if(temp < 0.07)
            q=0;
        elseif(temp >= 0.07 && temp <0.21)
            q=0.14;
        elseif(temp >= 0.21 && temp <0.35)
            q=0.28;
        elseif(temp >= 0.35 && temp <0.5)
            q=0.43;
        elseif(temp >= 0.5 && temp <0.64)
            q=0.57;
        elseif(temp >= 0.64 && temp <0.79)
            q=0.71;
        elseif(temp >= 0.79 && temp <0.93)
            q=0.86;
        else
            q=1;
        end
        e(i,j) = x(i,j)-q;
        x(i,j+1)=x(i,j+1)+e(i,j)*7/16;
        x(i+1,j-1)=x(i+1,j-1)+e(i,j)*3/16;
        x(i+1,j)=x(i+1,j)+e(i,j)*5/16;
        x(i+1,j+1)=x(i+1,j+1)+e(i,j)*1/16;
        y(i, j-1)=q;
    end
end
y=uint8(y*255);