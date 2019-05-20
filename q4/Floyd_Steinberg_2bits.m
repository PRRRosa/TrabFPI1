function y =Floyd_Steinberg_2bits(x)

[M,N] = size(x);
y =zeros(M,N);
x = [zeros(M,1) x/255 zeros(M,1);zeros(1,N+2)];
x_save = x;

for i=1 : M
    for j = 2 : N+1
        temp = x_save(i,j)+x(i,j);
        if(temp < 0.165)
            q=0;
        elseif(temp >= 0.165 && temp <0.5)
            q=0.33;
        elseif(temp >= 0.5 && temp <0.83)
            q=0.66;
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
