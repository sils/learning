function [EW, EV] = potenzmethode (A,u)
m_max=1000;
border= 10^-8;
k=0;
knext=norm(u);
m=1;
l=zeros(m_max,1);
while (m<m_max && abs(k-knext)>border)
    k=knext;
    v=A*u;
    knext=norm(v);
    u=v/knext;
    l(m)=knext;
    m=m+1;
end
EV=u;
EW=knext;
l=l(1:m-1);
plot(1:m-1,l)
hold on
xlabel('n')
ylabel('\lambda^n')
grid on;
hold off