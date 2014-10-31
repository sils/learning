function c = divdif(xdata, ydata)
    if length(xdata) ~= length(ydata)
        c = 'failed';
        return;
    end

    c = [ydata(1)];
    if length(xdata) == 1
        return;
    end

    
    j = length(xdata)
    i=1
    c = [(divdif(xdata(i+1:j),   ydata(i+1:j)) ...
          -  divdif(xdata(i:j-1), ydata(i:j-1))) ...
          ./ (xdata(j) - xdata(i))];
    return;
end
