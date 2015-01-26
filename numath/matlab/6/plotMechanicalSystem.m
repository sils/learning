function plotMechanicalSystem(a1,a2,a3,a4,beta,alpha);

% zum Plotten werden ausschliesslich  a1,a2,a4,beta,alpha verwendet
% a3 wird anschließend zur Fehlerkontrolle benutzt

P1=[0,0];
P2=[a1,0];
vA4=a4*[-cos(pi-beta),sin(pi-beta)];
P3=P2+vA4;
P4=a2*[cos(alpha),sin(alpha)];

P=[P1' P2' P3' P4' P1'];

if abs(norm(P3 - P4)-a3)>1e-6
  'abs(Fehler: norm(P4-P3) - a3) > 1e-6'
else
  plot(P(1,:),P(2,:),'o-','LineWidth',3);
end
