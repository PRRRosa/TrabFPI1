function StretchedImage = contrast_stretching ( OriginalImage )
    StretchedImage = imadjust(OriginalImage, stretchlim(OriginalImage),[]);