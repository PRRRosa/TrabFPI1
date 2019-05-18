function y = bayer_dithering_3bits(I)
[sx,sy] = size(I);
threshold_map = 1/15*[1 2 3;4 5 6;7 8 0];
Io = zeros(sx,sy);
y=zeros(sx,sy);
 for i =1:sx
     for j = 1:sy
        Io(i,j) = I(i,j)+(I(i,j)*threshold_map(mod(i,3)+1,mod(j,3)+1));
        if(Io(i,j) < 18)
            y(i,j) = 0;
        elseif(Io(i,j) >= 18 && Io(i,j) < 54)
            y(i,j) = 36;
        elseif(Io(i,j) >= 54 && Io(i,j) < 91)
            y(i,j) = 73;
        elseif(Io(i,j) >= 91 && Io(i,j) < 129)
            y(i,j) = 109;
        elseif(Io(i,j) >= 129 && Io(i,j) < 164)
            y(i,j) = 146;            
        elseif(Io(i,j) >= 164 && Io(i,j) < 201)
            y(i,j) = 183;
        elseif(Io(i,j) >= 201 && Io(i,j) < 237)
            y(i,j) = 219;
        else
            y(i,j) = 256;
        end
     end
 end
 y=uint8(y);
             