function c = divdif(xdata, ydata)
    if length(xdata) ~= length(ydata)
        c = 'failed';
        return;
    end

    c = ydata(1);
    if length(xdata) == 1
        return;
    end

    i=1;
    for j=2:length(xdata)
        ipo = divdif(xdata(i+1:j),   ydata(i+1:j));
        jmo = divdif(xdata(i:j-1), ydata(i:j-1));
        thisc = (ipo(length(ipo))-jmo(length(jmo)) ./ (xdata(j)-xdata(i)));
        c = [c, thisc];
    end;
    return;
end
