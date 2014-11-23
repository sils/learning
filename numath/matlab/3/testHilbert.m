function [] = testHilbert()
    maxn = 10;
    close all;

    conditions = zeros(maxn, 3);
    errors     = zeros(maxn, 3);

    for n = 1:maxn
        H = hilb(n);

        conditions(n, 1) = cond(H, 2);     % euclidic
        conditions(n, 2) = cond(H, inf);   % infinity
        conditions(n, 3) = cond(H, 'fro'); % frobenius

        v = ones(n, 1);
        b = H * v;
        x = H \ b;

        errors(n, 1) = norm(x-v,  2   ) / norm(v,  2   ); % euclidic
        errors(n, 2) = norm(x-v,  inf ) / norm(v,  inf ); % infinity
        errors(n, 3) = norm(x-v, 'fro') / norm(v, 'fro'); % frobenius
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


    figure;
    semilogy(errors(:, 1), 'r');
    hold on;
    semilogy(errors(:, 2), 'g');
    semilogy(errors(:, 3), 'b');

    grid on;
    legend('Euclidic', 'Infinity', 'Frobenius');
    xlabel('n');
    ylabel('Errors');
    hold off;
end
