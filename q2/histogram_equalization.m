function ImageHistogram = histogram_equalization ( OriginalImage )

ImageHistogram = uint8(zeros(size(OriginalImage,1),size(OriginalImage,2)));
NumberOfPixels = size(OriginalImage,1) * size(OriginalImage,2);
ValueFrequency = zeros(256,1);
ProbabilityOfOccurrency = zeros(256,1);

for i=1:size(OriginalImage,1)
    for j=1:size(OriginalImage,2)
        value = OriginalImage(i,j);
        ValueFrequency(value+1) = ValueFrequency(value+1)+1;
        ProbabilityOfOccurrency(value+1) = ValueFrequency(value+1)/NumberOfPixels;
    end
end

CumulativeDistributionProb = zeros(256,1);
CumulativeValue = zeros(256,1);
output=zeros(256,1);
sum=0;

for i=1:size(ProbabilityOfOccurrency)
   sum = sum + ValueFrequency(i);
   CumulativeValue(i) = sum;

   CumulativeDistributionProb(i) = CumulativeValue(i)/NumberOfPixels;

   output(i)=round(CumulativeDistributionProb(i) * 255);
end

for i=1:size(OriginalImage,1)
    for j=1:size(OriginalImage,2)
            ImageHistogram(i,j)=output(OriginalImage(i,j)+1);
    end
end