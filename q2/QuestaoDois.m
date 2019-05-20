OriginalImage = imread('cameraman.tif');
StretchedImage = contrast_stretching(OriginalImage);
EqualizedHistogram = histogram_equalization( StretchedImage );

subplot(3,2,1); imshow(OriginalImage);
title('Original Image');
subplot(3,2,2); bar(OriginalImage);
title('Original Histogram');
subplot(3,2,3); imshow(StretchedImage);
title('Contrast stretching');
subplot(3,2,4); bar(StretchedImage);
title('After contrast stretching');
subplot(3,2,5); imshow(EqualizedHistogram);
title('Histogram equalization');
subplot(3,2,6); bar(EqualizedHistogram);
title('After Histogram equalization');