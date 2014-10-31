xdata = 5:0.5:14;
ydata = [1.35,1.22,1.18,1.26,1.30,1.35,1.48,1.57,1.41,1.41,1.44,1.25,...
    1.33,1.45,1.3,1.22,1.32,1.3,1.37];

% Interpolate also one year in the future
xprecise = 5:0.1:15;
% From matlab documentation: If x and Y are vectors of the same size, the not-a-knot end conditions are used.
yspline = spline(xdata, ydata, xprecise);
hold on
% Plot will automatically interpolate linearly
plot(xdata, ydata, 'r')
plot(xprecise, yspline)
hold off

% Obviously (from plot) the spline is not suited to extrapolate future
% values as it continues to rise.