z = imread('lenna.png');

figure, imshow(z), title('Imagem original')

red = z(:,:,1);
green = z(:,:,2);
blue = z(:,:,3);
% new_im = cat(3, red, green, blue);
% figure, imshow(new_im), title('MERGED');

% coordenadas originais

[x,y] = meshgrid(1:512, 1:512);

% novas coordenadas

a = 2;
for i=1:512
    for j=1:512
        x1(i,j) = double(x(i,j)/a);
        y1(i,j) = double(y(i,j)/a);
    end
end

% faz a interpolação
tic
z1_red = interp2(double(x), double(y), double(red), x1, y1, 'cubic');
z1_green = interp2(double(x), double(y), double(green), x1, y1, 'cubic');
z1_blue = interp2(double(x), double(y), double(blue), x1, y1, 'cubic');
toc

tic
z11_red = interp2(double(x), double(y), double(red), x1, y1, 'nearest');
z11_green = interp2(double(x), double(y), double(green), x1, y1, 'nearest');
z11_blue = interp2(double(x), double(y), double(blue), x1, y1, 'nearest');
toc

z1 = cat(3, z1_red, z1_green, z1_blue);
z11 = cat(3, z11_red, z11_green, z11_blue);
figure, imshow(uint8(z1)), title('Cúbica zoom 2x')
figure, imshow(uint8(z11)), title('Vizinho Mais Próximo zoom 2x')

a = 3;
for i=1:512
    for j=1:512
        x2(i,j) = double(x(i,j)/a);
        y2(i,j) = double(y(i,j)/a);
    end
end

% faz a interpolação
tic
z2_red = interp2(double(x), double(y), double(red), x2, y2, 'cubic');
z2_green = interp2(double(x), double(y), double(green), x2, y2, 'cubic');
z2_blue = interp2(double(x), double(y), double(blue), x2, y2, 'cubic');
toc

tic
z22_red = interp2(double(x), double(y), double(red), x2, y2, 'nearest');
z22_green = interp2(double(x), double(y), double(green), x2, y2, 'nearest');
z22_blue = interp2(double(x), double(y), double(blue), x2, y2, 'nearest');
toc

z2 = cat(3, z2_red, z2_green, z2_blue);
z22 = cat(3, z22_red, z22_green, z22_blue);

figure, imshow(uint8(z2)), title('Cúbica zoom 3x')
figure, imshow(uint8(z22)), title('Vizinho Mais Próximo zoom 3x')
