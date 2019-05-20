function unsharpMasking(image, gaussianRadius, sharpeningAmount)
% Fun��o que aplica o efeito "unsharp masking" para uma imagem qualquer. Ela recebe tr�s par�metros:
% image - imagem a ser processada
% gaussianRadius - escalar que define o desvio padr�o do filtro gaussiano usado para borrar a imagem
% sharpeningAmount - escalar que define a intensidade do realce a ser adicionado � imagem original

    if size(image,3) == 3 % Se a terceira dimens�o da imagem tiver 3 elementos, � uma imagem colorida
        imageLAB = rgb2lab(image); % Converte a imagem para o espa�o de cor L*a*b*
        
        % Aplica o filtro gaussiano somente na luminosidade da imagem
        lightness = imageLAB(:,:,1);
        lightnessBlurred = imgaussfilt(lightness, gaussianRadius);
        imageLAB(:,:,1) = lightness + (lightness - lightnessBlurred)*sharpeningAmount;

        imageFinal = lab2rgb(imageLAB); % Converte de volta para o espa�o de cor RGB
    elseif size(image,3) == 1 % Se a terceira dimens�o da imagem tiver 1 elemento, � uma imagem em tons de cinza
        imageBlurred = imgaussfilt(image, gaussianRadius);
        imageFinal = image + (image - imageBlurred)*sharpeningAmount;
    end

    filename = sprintf('unsharp masking sigma-%.3g k-%.3g.png', gaussianRadius, sharpeningAmount);
    imwrite(imageFinal, filename);

    figure, subplot(1,2,1), imshow(image), subplot(1,2,2), imshow(imageFinal);
end

