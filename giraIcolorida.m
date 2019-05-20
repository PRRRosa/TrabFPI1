function[I_linha]=giraIcolorida(I,angulo)

R = giraI(I(:,:,1),angulo);
G = giraI(I(:,:,2),angulo);
B = giraI(I(:,:,3),angulo);

I_linha=cat(3,R,G,B);
end


