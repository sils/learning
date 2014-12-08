function [] = testCondition(n)
    times = 10;
    k  = zeros(n, 1);
    ps = zeros(times, 1);
    ns = 1:n;
    
    for repeat = 1:times
        fprintf('Loop %d of %d...\n', repeat, times)
        
        for i = ns
            k(i) = cond(rand(i));
        end

        % log(k_1(R_n)) = log(c) + p
        % A'Ax = A'b

        % ones in the first column, coefficient for the log(c)
        A = ones(n, 2);
        % ln(n) in the second column, coefficient for the ln(n^p) because
        % p = ln(n^p)/ln(n)
        A(:,2) = log(ns);

        ata = A'*A;
        atb = A'*log(k);
        % x contains log(c) and p
        x = ata\atb;
        ps(repeat) = x(2);
    end
    
    loglog(k, 'r');
    hold on;
    xlabel('n');
    ylabel('condition');
    grid on;
    loglog(exp(x(1))*ns.^x(2));
    legend('conditions','c n^p');
    
    % p interval goes from 1.474405 to 1.610146.
    fprintf('p interval goes from %f to %f.\n', min(ps), max(ps))
end
