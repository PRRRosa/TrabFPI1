function unsharpMasking(image, gaussianRadius, sharpeningAmount)
% Função que aplica o efeito "unsharp masking" para uma imagem qualquer. Ela recebe três parâmetros:
% image - imagem a ser processada
% gaussianRadius - escalar que define o desvio padrão do filtro gaussiano usado para borrar a imagem
% sharpeningAmount - escalar que define a intensidade do realce a ser adicionado à imagem original

    if size(image,3) == 3 % Se a terceira dimensão da imagem tiver 3 elementos, é uma imagem colorida
        imageLAB = rgb2lab(image); % Converte a imagem para o espaço de cor L*a*b*
        
        % Aplica o filtro gaussiano somente na luminosidade da imagem
        lightness = imageLAB(:,:,1);
        lightnessBlurred = imgaussfilt(lightness, gaussianRadius);
        imageLAB(:,:,1) = lightness + (lightness - lightnessBlurred)*sharpeningAmount;

        imageFinal = lab2rgb(imageLAB); % Converte de volta para o espaço de cor RGB
    elseif size(image,3) == 1 % Se a terceira dimensão da imagem tiver 1 elemento, é uma imagem em tons de cinza
        imageBlurred = imgaussfilt(image, gaussianRadius);
        imageFinal = image + (image - imageBlurred)*sharpeningAmount;
    end

    filename = sprintf('unsharp masking sigma-%.3g k-%.3g.png', gaussianRadius, sharpeningAmount);
    imwrite(imageFinal, filename);

    figure, subplot(1,2,1), imshow(image), subplot(1,2,2), imshow(imageFinal);
end

