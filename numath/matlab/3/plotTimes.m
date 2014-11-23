function [] = plotTimes(nmax)
    backslash_times = nan(nmax, 3);
    inverse_times   = nan(nmax, 3);

    for d = 1:3
        n = 1;
        while(n^d <= nmax)
            %
            tic
            backslash(d, n);
            backslash_times(n, d) = toc;

            tic
            solve_inverse(d, n);
            inverse_times(n, d) = toc;

            n = n+1;
        end
    end

    hold on;
    plot(backslash_times(:,1));
    plot(backslash_times(:,2));
    plot(backslash_times(:,3));
    hold off;
end
