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
  
  wanted = -0.122122604618968;
  
  for i = 1:15
    x = [x, i];
    n = 2^i;

    tic
    gauss = [gauss, abs(wanted-gaussformel(a, b, n, f))];
    toc
    
    tic
    mittelpunkt = [mittelpunkt, abs(wanted-mittelpunktregel(a, b, n, f))];
    toc

    tic
    simpson = [simpson, abs(wanted-simpsonregel(a, b, n, f))];
    toc

    tic
    trapez = [trapez, abs(wanted-trapezregel(a, b, n, f))];
    toc
  end
  
  hold on
  
  semilogy(x, gauss);
  semilogy(x, mittelpunkt, 'r');
  semilogy(x, simpson, 'g');
  semilogy(x, trapez, 'k');
  
  legend('Gauss', 'Mittelpunkt', 'Simpson', 'Trapez');
  
  hold off

end
