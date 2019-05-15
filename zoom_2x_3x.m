z = imread('lenna.png');
z = z(:,:,1);
% z = imread('cameraman.tif');
%https://stackoverflow.com/questions/23255344/converting-code-to-take-rgb-image-instead-of-grayscale


figure, imshow(uint8(z))

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
z1 = interp2(double(x), double(y), double(z), x1, y1, 'cubic');
toc

tic
z11 = interp2(double(x), double(y), double(z), x1, y1, 'nearest');
toc

figure, imshow(uint8(z1))
figure, imshow(uint8(z11))

a = 3;
for i=1:512
    for j=1:512
        x2(i,j) = double(x(i,j)/a);
        y2(i,j) = double(y(i,j)/a);
    end
end

% faz a interpolação
tic
z2 = interp2(double(x), double(y), double(z), x2, y2, 'cubic');
toc

tic
z22 = interp2(double(x), double(y), double(z), x2, y2, 'nearest');
toc

figure, imshow(uint8(z2))
figure, imshow(uint8(z22))

% filtro da media truncada
% usar projeção reduzida - por linha