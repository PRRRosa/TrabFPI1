% escala('caminho/imagem.png', escala_desejada)
% o nome da imagem é passado como string
% escala_desejada é um número
% se escala_desejada > 1, aumenta a imagem
% se escala_desejada < 1, diminui a imagem

function escala(in_image, scale)
    [~, FileName, ~] = fileparts(in_image);
    in_image = imread(in_image);
    figure, imshow(in_image), title('Imagem original');
    
    red = in_image(:,:,1);
    green = in_image(:,:,2);
    blue = in_image(:,:,3);
    
    % coordenadas originais
    [x,y] = meshgrid(1:512, 1:512);

    % novas coordenadas
    a = scale;
    if a > 0
        for i=1:512
            for j=1:512
                x1(i,j) = double(x(i,j)/a);
                y1(i,j) = double(y(i,j)/a);
            end
        end
        % faz a interpolação
        in_image_red_c = interp2(double(x), double(y), double(red), x1, y1, 'cubic');
        in_image_green_c = interp2(double(x), double(y), double(green), x1, y1, 'cubic');
        in_image_blue_c = interp2(double(x), double(y), double(blue), x1, y1, 'cubic');

        in_image_red_n = interp2(double(x), double(y), double(red), x1, y1, 'nearest');
        in_image_green_n = interp2(double(x), double(y), double(green), x1, y1, 'nearest');
        in_image_blue_n = interp2(double(x), double(y), double(blue), x1, y1, 'nearest');

        out_image_c = cat(3, in_image_red_c, in_image_green_c, in_image_blue_c);
        out_image_n = cat(3, in_image_red_n, in_image_green_n, in_image_blue_n);

        filename_cubica = sprintf('%s cubica %s x.png', FileName, string(scale))
        filename_vizinho = sprintf('%s vizinho %s x.png', FileName, string(scale))

        imwrite(uint8(out_image_c), filename_cubica);
        imwrite(uint8(out_image_n), filename_vizinho);

        figure, imshow(uint8(out_image_c)), title('Cúbica');
        figure, imshow(uint8(out_image_n)), title('Vizinho Mais Próximo');
     end
end
