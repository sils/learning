function [] = plotTimes(nmax)
    backslash_times = nan(nmax, 3);
    inverse_times   = nan(nmax, 3);

    for d = 1:3
        n = 2;
        while(n^d <= nmax)
            tic
            backslash(d, n);
            backslash_times(n^d, d) = toc;

            tic
            solve_inverse(d, n);
            inverse_times(n^d, d) = toc;

            n = n+1;
        end
    end

    hold on;
    plot(backslash_times(:,1), 'r');
    plot(backslash_times(:,2), 'g');
    plot(backslash_times(:,3), 'b');
    legend('computation via backslash, d=1', 'computation via backslash, d=2', 'computation via backslash, d=3');
    xlabel('n^d');
    ylabel('time in seconds');
    hold off;
    
    figure;
    
    hold on;
    plot(inverse_times(:,1), 'r');
    plot(inverse_times(:,2), 'g');
    plot(inverse_times(:,3), 'b');
    legend('computation via inverse, d=1', 'computation via inverse, d=2', 'computation via inverse, d=3')
    xlabel('n^d');
    ylabel('time in seconds');
    hold off;
end
