function [overallSize] = compressImage(k)
   
    A=imread('original.jpg');
    A_gray = rgb2gray(A); 
    A=A_gray;
    [U,S,V] = svd(double(A));
    Ak=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    imshow(uint8(Ak));
    
    %some crap to check usefulness
    aSize = size(A);
    uSize = size(U(:,1:k));
    sSize = size(S(1:k,1:k));
    vSize = size(V(:,1:k));
    
    overallSize = (uSize(1)*uSize(2))+(sSize(1)*sSize(2))+(vSize(1)*vSize(2))
    originalSize = (aSize(1))*(aSize(2))
    overallSize/originalSize
    

end