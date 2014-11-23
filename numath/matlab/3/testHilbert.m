function [] = testHilbert()
    maxn = 10;
    close all;

    conditions = zeros(maxn, 3);

    for n = 1:maxn
        H = hilb(n);

        conditions(n, 1) = cond(H, 2);     % euclidic
        conditions(n, 2) = cond(H, inf);   % infinity
        conditions(n, 3) = cond(H, 'fro'); % frobenius
    end

    semilogy(conditions(:, 1), 'r');
    hold on;
    semilogy(conditions(:, 2), 'g');
    semilogy(conditions(:, 3), 'b');

    grid on;
    legend('Euclidic', 'Infinity', 'Frobenius');
    xlabel('n');
    ylabel('Conditions');
    hold off;
end
