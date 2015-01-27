function [x_t, sigm_t, x] = kalmanf(ts, z_ts)
  x_t = [0;0];
  C = [1];
  Q = [0.25,0;0,4];
  sigm_t = eye(2);
  u_t = 2.5;
  dt = 0;
  x = zeros(size(ts, 2),2);
  for i = 1:size(ts, 2)
    dt = ts(i) - dt;
    z_t = transpose(z_ts(i,:));

    A = [1, dt; 0, 1];
    B = [0.5*dt^2; dt];
    R = 0.25 * [0.25*dt^4, 0.5*dt^3; 0.5*dt^3, dt^2];

    sigm_bar = A * sigm_t * transpose(A) + Q;
    x_bar = A * x_t + B * u_t;

    part =( C * sigm_bar * transpose(C) + R)^-1;
    K_t = sigm_bar * transpose(C) * part;

    x_t = x_bar + K_t * (z_t - C * x_bar);
    x(i, :) = x_t;
    sigm_t = (eye(size(K_t * C)) - K_t * C) * sigm_bar;
  end

end
