function IM =atpmf(I)
IM = 0;
I= double(I);
[H V] = size(I);

N=3; %tamanho da janela
P=2; %define o tamanho do intervalo a ser avaliado => não pode ser maior que (N*N)/2
NQ=N*N;

for x= 2:(H-1)
   for y = 2:(V-1)
      vet=[I(x-1,y-1) I(x,y-1) I(x+1,y-1) I(x-1,y) I(x,y) I(x+1,y) I(x-1,y+1) I(x,y+1) I(x+1,y+1)];
      somatorio = 0;
      vet=sort(vet);
      for a=P:((NQ)-P)
        somatorio = somatorio + vet(a);		%somatório dos valores medianos
      end
      IM(x,y)=somatorio/((NQ)-(2*P));			%média dos valores medianos
   end   
end

end