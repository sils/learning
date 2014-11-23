function [] = plotTimes(nmax)
    backslash_times = nan(nmax, 3);
    inverse_times   = nan(nmax, 3);
    x_vals          = nan(nmax, 3);

    for d = 1:3
        n = 2;
        nd = n^d;
        while(nd <= nmax)
            tic
            backslash(d, n);
            backslash_times(n, d) = toc;

            tic
            solve_inverse(d, n);
            inverse_times(n, d) = toc;

            x_vals(n, d) = nd;

            n = n+1;
            nd = n^d;
        end
    end

    hold on;
    plot(x_vals(:,1), backslash_times(:,1), 'r');
    plot(x_vals(:,2), backslash_times(:,2), 'g');
    plot(x_vals(:,3), backslash_times(:,3), 'b');
    legend('computation via backslash, d=1', 'computation via backslash, d=2', 'computation via backslash, d=3');
    xlabel('n^d');
    ylabel('time in seconds');
    hold off;

    figure;

    hold on;
    plot(x_vals(:,1), inverse_times(:,1), 'r');
    plot(x_vals(:,2), inverse_times(:,2), 'g');
    plot(x_vals(:,3), inverse_times(:,3), 'b');
    legend('computation via inverse, d=1', 'computation via inverse, d=2', 'computation via inverse, d=3')
    xlabel('n^d');
    ylabel('time in seconds');
    hold off;
end
