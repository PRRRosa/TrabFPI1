function y = bayer_dithering_2bits(I)
[sx,sy] = size(I);
threshold_map = 1/5*[1 2;3 0];
Io = zeros(sx,sy);
 for i =1:sx
     for j = 1:sy
        Io(i,j) = I(i,j)+(I(i,j)*threshold_map(mod(i,2)+1,mod(j,2)+1));
        if(Io(i,j) < 42)
            y(i,j) = 0;
        elseif(Io(i,j) >= 42 && Io(i,j) < 128)
            y(i,j) = 85;
        elseif(Io(i,j) >= 128 && Io(i,j) < 213)
            y(i,j) = 170;
        else
            y(i,j) = 256;
        end
     end
 end
y=uint8(y);
                
                
    