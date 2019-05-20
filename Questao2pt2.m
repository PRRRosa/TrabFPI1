OriginalImage = imread('lena_std.tif');

HSVImage = rgb2hsv(OriginalImage);
H = HSVImage(:, :, 1); % Hue image.
S = HSVImage(:, :, 2); % Saturation image.
V = HSVImage(:, :, 3); % Value (intensity) image.

StretchedV = contrast_stretching(V);
EqualizedVHistogram = histogram_equalization( StretchedV );

FinalHSVImage = cat(3, H, S, EqualizedVHistogram);
FinalImage = hsv2rgb(FinalHSVImage);

subplot(2,2,1); imshow(OriginalImage);
title('Original Image');
subplot(2,2,2); bar(V);
title('Original Histogram');
subplot(2,2,3); imshow(FinalImage);
title('Final image after stretching and equalization');
subplot(2,2,4); bar(EqualizedVHistogram);
title('After contrast stretching and equalization');