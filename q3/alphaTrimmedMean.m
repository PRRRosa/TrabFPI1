function alphaTrimmedMean(inImmage, gausnois, saltpepnoise)
% Função que aplica o filtro "alpha Trimmed Mean" para uma imagem colorida. 
%parâmetros:
% image - imagem colorida
% gausnois - desvio padrao que indica o ruido gaussiano
% saltpepnoise - desvio padrao que indica o ruido sal e pimenta

I_gauss=  imnoise (inImmage, 'gaussian', gausnois); % Aplica o ruido gaussiano 
I_saltpep = imnoise (I_gauss, 'salt & pepper', saltpepnoise); % Aplica o ruido sal e pimenta 
%Recuperando com alpha trimmed mean
redChannel = I_saltpep(:, :, 1);
greenChannel = I_saltpep(:, :, 2);
blueChannel = I_saltpep(:, :, 3);
        
newRedChannel= atpmf(redChannel);
newGreenChannel= atpmf(greenChannel);
newBlueChannel= atpmf(blueChannel);
      
rgbFixed = cat(3, newRedChannel, newGreenChannel, newBlueChannel); %une as cores novamente

%AVALIA COM SRN e PSNR
[peaksnr, snr] = psnr(I_saltpep, inImmage);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

figure, subplot(1,3,1), imshow(uint8(inImmage)), subplot(1,3,2), imshow(I_saltpep), subplot(1,3,3), imshow(uint8(rgbFixed))

end

