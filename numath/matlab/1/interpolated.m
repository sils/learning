function [ ret ] = interpolated( a, b, n, f, deg)
    xdata = linspace(a,b,n);
    ydata = f(xdata);
    ret = polyfit(xdata, ydata, deg);
end
