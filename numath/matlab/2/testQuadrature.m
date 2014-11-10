function [] = testQuadrature()

  close all; clear all; clc;

  format long;

  f = inline('x.*exp(-x).*cos(2*x)', 'x');
  a = 0;
  b = 2*pi;
  
  gauss = [];
  mittelpunkt = [];
  simpson = [];
  trapez = [];
  x = [];
  
  gausstimes = [];
  mittelpunkttimes = [];
  simpsontimes = [];
  trapeztimes = [];
  
  wanted = -0.122122604618968;
  
  for i = 1:15
    x = [x, i];
    n = 2^i;

    tic
    gauss = [gauss, abs(wanted-gaussformel(a, b, n, f))];
    gausstimes = [gausstimes, toc];
    
    tic
    mittelpunkt = [mittelpunkt, abs(wanted-mittelpunktregel(a, b, n, f))];
    mittelpunkttimes = [mittelpunkttimes, toc];

    tic
    simpson = [simpson, abs(wanted-simpsonregel(a, b, n, f))];
    simpsontimes = [simpsontimes, toc];

    tic
    trapez = [trapez, abs(wanted-trapezregel(a, b, n, f))];
    trapeztimes = [trapeztimes, toc];
  end
  % TODO achsenbeschriftungen, aufhuebschen
  figure;
  hold on
  
  semilogy(x, gauss);
  semilogy(x, mittelpunkt, 'r');
  semilogy(x, simpson, 'g');
  semilogy(x, trapez, 'k');
  
  legend('Gauss', 'Mittelpunkt', 'Simpson', 'Trapez');
  
  hold off
  
  figure;
  hold on
  
  semilogy(gausstimes, gauss);
  semilogy(mittelpunkttimes, mittelpunkt, 'r');
  semilogy(simpsontimes, simpson, 'g');
  semilogy(trapeztimes, trapez, 'k');
  
  legend('Gauss', 'Mittelpunkt', 'Simpson', 'Trapez');
  
  hold off

end
