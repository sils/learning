% Numerical mathematics - task 1 a, b and c
%
% Authors: Jonas Ackermann, Lasse Schuirmann <lasse.schuirmann@gmail.com>

f = @(x) 1./(ones(1, length(x))+x.*x);

% Aufgabe a)
disp("Task a")
xdata = linspace(-5,5,5);
ydata = f(xdata);

% Aufgabe b)
disp("Task b")
poly_coeffs = polyfit(xdata, ydata, 4);

xprecise = linspace(-5,5);
hold on;
plot(xprecise, f(xprecise),'r');
plot(xprecise, polyval(poly_coeffs, xprecise));
legend('f', 'interpolated (4)');

pause

% Aufgabe c)
disp("Task c")
for i=6:9
    coeffs = interpolated (-5, 5, i, f, (i-1));
    % plot with hacky way of getting different colors
    plot(xprecise, polyval(coeffs, xprecise), 'Color', [((i/9)-0.2), (i/9), 0]);
    err = abs(polyval(coeffs, 4.5) - f(4.5));
    fprintf('Interpolation error at x=4.5 for n=%i: %f\n', i, err)
end

legend('f', 'interpolated (4)', 'interpolated (5)', 'interpolated (6)',
       'interpolated (7)', 'interpolated (8)');
hold off;
