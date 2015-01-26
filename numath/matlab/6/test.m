a_1 = 10;
a_2 = 13;
a_3 = 8;
a_4 = 10;
beta_k = @(k) k * pi / 100;
f = @(x, beta) a_1 / a_2 * cos(beta) - a_1 / a_4 * cos(x) - cos(beta - x) + (a_1^2+a_2^2-a_3^2+a_4^2)/(2*a_2*a_4);
% Derivation
df = @(x, beta) a_1 / a_4 * sin(x) + sin(x - beta);

% From k directly
f_k = @(x, k) f(x, beta_k(k));
df_k = @(x, k) df(x, beta_k(k));

tol = 1E-8;
x = -10:0.1:10;
y = f_k(x, 50);
plot(x,y);
