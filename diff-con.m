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

x(n+2) = 0;
x(2) =h/2;
for i=3:n+1
    x(i) = x(i-1)+h;
end
x(n+2) = length;

t0 = 1;
tn = 0;

%First element
ae = F/2 - D;
ap = F/2 + 3*D;

a(1,1) = -ap;
a(1,2) = -ae;

b(1) = -(F+2*D)*t0;

%Interiour elements
aw = D + F/2;
ae = D - F/2;
ap = -(aw + ae);

for i=2:n-1
    j = i-1;
    a(i,j) = aw;
    a(i,j+1) = ap;
    a(i,j+2) = ae;
end 

%Last element
ap = -F/2 + 3*D;
aw = -F/2 - D;

a(n,n-1) = -aw;
a(n,n) = -ap;

b(n) = (-F - D) * tn;

%True
for i = 1:n+2
    prt1 = exp(rho * u * x(i) / k ) -1
    prt2 = exp(rho * u * length / k ) -1
   true(i) = (prt1/prt2)*(tn-t0) + t0;
end

t = a\b';
t = cat(1,t0,t,tn);
plot(x,t,'r',x,true,'b')