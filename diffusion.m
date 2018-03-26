clc
clear 'all'


n = 5;
k = 0.1;
rho = 1;
vel = 0.1;

length = 1;
h = length/n;
t(n+2) = 0;
t(1) = 1;

D = k/h;
F = rho * vel;

x(1) = 0;
x(2) = x(1)+h/2;
for i = 3:n+1
    x(i) = x(i-1) + h;
end
x(7) = 1;

%analytical
for  i = 1: n+1
    true(i) = (2.7183 - exp(x(i)))/1.7183;
end
true(7) = 0;


%internal nodes

aw = D+F/2;
ae = D-F/2;
ap = ae+aw;


for iter = 1:100
    %first element
    t(2) = (1.1 + 0.45 * t(3))/1.55;
    %internal elements
    for i = 3:n
        t(i) = 0.55 * t(i-1) + 0.45*t(i+1);
    end
    %last element
    t(n+1) = (0.55 * t(n))/1.45;
    
end

t'
true'
plot(x,true,'b',x,t,'*r')