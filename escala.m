% uso
% escala('lenna.png', 3)
% o nome da imagem é passado como string, e o zoom é um numero.
% se zoom > 1, aumenta a imagem, se zoom < 1, diminui a imagem

function out_image = escala(in_image, scale)

    in_image = imread(in_image);

    figure, imshow(in_image), title('Imagem original')
    
    red = in_image(:,:,1);
    green = in_image(:,:,2);
    blue = in_image(:,:,3);
    
    % coordenadas originais

    [x,y] = meshgrid(1:512, 1:512);

    % novas coordenadas

    a = scale;
    for i=1:512
        for j=1:512
            x1(i,j) = double(x(i,j)/a);
            y1(i,j) = double(y(i,j)/a);
        end
    end

    % faz a interpolação
    tic
    in_image_red_c = interp2(double(x), double(y), double(red), x1, y1, 'cubic');
    in_image_green_c = interp2(double(x), double(y), double(green), x1, y1, 'cubic');
    in_image_blue_c = interp2(double(x), double(y), double(blue), x1, y1, 'cubic');
    toc

    tic
    in_image_red_n = interp2(double(x), double(y), double(red), x1, y1, 'nearest');
    in_image_green_n = interp2(double(x), double(y), double(green), x1, y1, 'nearest');
    in_image_blue_n = interp2(double(x), double(y), double(blue), x1, y1, 'nearest');
    toc

    out_image_c = cat(3, in_image_red_c, in_image_green_c, in_image_blue_c);
    out_image_n = cat(3, in_image_red_n, in_image_green_n, in_image_blue_n);
    figure, imshow(uint8(out_image_c)), title('Cúbica')
    figure, imshow(uint8(out_image_n)), title('Vizinho Mais Próximo')
end