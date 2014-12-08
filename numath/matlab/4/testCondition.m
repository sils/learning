function [k] = testCondition(n)
   
    k = zeros(n, 1);
    
    for i = 1:n
        R = rand(i);
        k(i) = cond(R);
    end
    
    loglog(k);
    xlabel('n');
    ylabel('condition');
    grid on;
   
end
