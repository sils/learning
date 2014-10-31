% Numerical mathematics - task 1d
%
% Authors: Jonas Ackermann, Lasse Schuirmann <lasse.schuirmann@gmail.com>

f = @(x) 1./(ones(1, length(x))+x.*x);

% Aufgabe d)
disp('Task d')
xdata = linspace(-5,5,5);
ydata = f(xdata);

c = divdif(xdata, ydata);

xprecise = linspace(-5,5);
yvals = horner(c, xdata, xprecise);

hold on;
plot(xprecise, f(xprecise),'r');
plot(xprecise, yvals);
legend('f', 'interpolated (4 (divdif))');

res = num2str(c(1));
for i = 1:length(c)-1
    res = strcat(res, ' + ');
    res = strcat(res, num2str(c(i+1)));
    for j = 1:i
        res=strcat(res, '(x - ');
        res=strcat(res, num2str(xdata(j)));
        res=strcat(res, ')');
    end
end
res
