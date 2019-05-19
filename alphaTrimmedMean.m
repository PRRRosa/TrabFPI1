function alphaTrimmedMean(inImmage, gausnois, saltpepnoise)
% Função que aplica o filtro "alpha Trimmed Mean" para uma imagem colorida. 
%parâmetros:
% image - imagem colorida
% gausnois - desvio padrao que indica o ruido gaussiano
% saltpepnoise - desvio padrao que indica o ruido sal e pimenta

inImmage = imread('coloredChips.png');
gausnois = 0.02;
saltpepnoise = 0.05;

% Aplica o filtro gaussiano 
I_gauss=  imnoise (inImmage, 'gaussian', gausnois);
% figure,imshow(I_gauss),title('Com ruido gaussiano');
    
% Aplica o filtro gaussiano 
I_saltpep = imnoise (I_gauss, 'salt & pepper', saltpepnoise);
%  figure,imshow(I_saltpep),title('com ruido gaussiano e sal&pimenta');
          

%Recuperando com alpha trimmed mean
redChannel = I_saltpep(:, :, 1);
greenChannel = I_saltpep(:, :, 2);
blueChannel = I_saltpep(:, :, 3);
        
newRedChannel= atpmf(redChannel);
newGreenChannel= atpmf(greenChannel);
newBlueChannel= atpmf(blueChannel);
       
 %une as cores novamente
rgbFixed = cat(3, newRedChannel, newGreenChannel, newBlueChannel);

%AVALIA COM SRN e PSNR
[peaksnr, snr] = psnr(I_saltpep, inImmage);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

figure, subplot(1,3,1), imshow(uint8(inImmage)), subplot(1,3,2), imshow(I_saltpep), subplot(1,3,3), imshow(uint8(rgbFixed))

end

