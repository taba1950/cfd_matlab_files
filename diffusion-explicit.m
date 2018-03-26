clc
clear 'all'


n = 5;
k = 0.1;
rho = 1;
vel = 0.1;

length = 1;
h = length/n;
a(n,n) = 0;
b(n) = 0;

D = k/h;
F = rho * vel;

ta = 1;
tb = 0;

x(1) = 0;
x(2) = x(1)+h/2;
for i = 3:n+1
    x(i) = x(i-1) + h;
end
x(n+2) = length;


%analytical
for  i = 1: n+1
    true(i) = (2.7183 - exp(x(i)))/1.7183;
end
true(n+2) = 0;



%internal nodes

aw = D+F/2;
ae = D-F/2;
ap = ae+aw;


for i = 2:n-1
    j = i - 1;
    a(i,j) = aw;
    a(i,j+1) = -1*ap;
    a(i, j+2) = ae;
    
end

%first
D1 = k/(h/2);
aw1 = D1+F/2;
ap1 = ae+aw1;
b(1) = -1*ta * aw1;
a(1,1) = -1*ap1;
a(1,2) = ae;
%last
Dn = k/(h/2);
aen = Dn - F/2;
apn = aen +aw;
b(n) = -1*tb * aen;
a(n,n-1) = aw;
a(n,n) = -1*apn;


a
b
t = cat(2,ta,b'/a,tb);
t'
plot(x,t,x,true)


    