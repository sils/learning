function [] = compressImage(k)
   
    A=imread('funky.jpg');
    % size(A);
    A_gray = rgb2gray(A); 
    A=A_gray;
    [U,S,V] = svd(double(A));
    Ak=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    imshow(uint8(Ak));
    size(Ak)

end