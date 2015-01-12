function i = deflationCriterion(A)
%number of significant digits
    i = 0;  
    t = 10;
    epsilon = 10 ^ -t;
    for k = 1:size(A,1)-1
        if (abs(A(k+1,k)) <= (abs(A(k,k)) + abs(A(k+1,k+1))) * epsilon)
            i = k;
            return;
        end;
    end;
end