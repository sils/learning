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
    ipo = divdif(xdata(i+1:j),   ydata(i+1:j));
    imo = divdif(xdata(i:j-1), ydata(i:j-1));
    c = [(ipo(length(ipo)) ...
          -  imo(length(imo))) ...
          ./ (xdata(j) - xdata(i))];
    return;
end
