function [ yval ] = horner(c, xdata, xval)
    if length(xdata) ~= length(c)
        error('Length of xdata and c arguments must be equal.');
    end
    
    % Allocate space now for performance
    yval = zeros(1, length(xval));

    for i = length(xdata):-1:1
        yval = yval .* (xval - ones(1, length(xval)) * xdata(i)) + c(i);
    end
end
