xdata = 5:0.5:14;
ydata = [1.35,1.22,1.18,1.26,1.30,1.35,1.48,1.57,1.41,1.41,1.44,1.25,...
    1.33,1.45,1.3,1.22,1.32,1.3,1.37];

xprecise = 5:0.1:14;
yspline = spline(xdata, ydata, xprecise);
hold on
plot(xdata, ydata, 'r')
plot(xprecise, yspline)
hold off