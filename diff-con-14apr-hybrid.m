clc
clear 'all'

n = 25;
rho = 1;
u = 2.5;
k = 0.1;
length = 1;
h = length/n;


F = rho * u;
D = k/h;

peclet = F/D

a(n,n) = 0;
b(n) = 0;

x(1) = 0;
x(2) =h/2;
for i=3:n+1
    x(i) = x(i-1)+h;
end
x(n+2) = length;

t(1) = 1;
t(n+2) = 0;

%First element
ap = F + 2*D;

a(1,1) = ap;

b(1) = (F+2*D)*t(1);

%Interiour elements
aw = -F;
ap = F;

for i=2:n-1
    j = i-1;
    a(i,j) = aw;
    a(i,j+1) = ap;
end 

%Last element
ap = F + 2*D;
aw = -F;

a(n,n-1) = aw;
a(n,n) = ap;

b(n) = (-F - D) * t(n+2);

%True
for i = 1:n+2
    prt1 = exp(rho * u * x(i) / k ) -1;
    prt2 = exp(rho * u * length / k ) -1;
   true(i) = (prt1/prt2)*(t(n+2)-t(1)) + t(1);
end


a

b=b'

t(2:n+1) = a\b;
t'

plot(x,t,'r',x,true,'b')