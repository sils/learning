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

% For our numbers
f_50  = @(x) f_k(x, 50);
df_50 = @(x) df(x, beta_k(50));
f_40  = @(x) f_k(x, 40);
df_40 = @(x) df(x, beta_k(40));
f_70  = @(x) f_k(x, 70);
df_70 = @(x) df(x, beta_k(70));

tol = 1E-8;
x = -10:0.1:10;
y = f_50(x);
plot(x,y);
grid on;

% TEST 1 - "Bisektion"
a = -7;
b = -4;
[alpha_50_1, ~, iter_1] = bisektion(f_50, a, b, tol)

%Result: Zero at -6.0904, 29 iterations

a = 0.18;
b = 0.2;
[alpha_50_2, ~, iter2] = bisektion(f_50, a, b, tol)

%Result: Zero at 0.1928, 21 iterations
