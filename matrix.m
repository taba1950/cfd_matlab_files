clc

n=5;

ta = 100;
tb = 500;

k = 1000;
A = 1e-2;
length = 0.5;
dx = length/(n);

    %first row
    ae = k*A/dx;
    aw = k*A/(dx/2);
    ap = ae +aw;
    
    a(1,1) = -1*ap;
    a(1,2) = ae;
    b(1) = -1*ta*aw;

    %internal nodes
    for i=2:n-1  
        j = i-1;      
        ae = k*A/dx;
        aw = k*A/dx;
        ap = ae +aw;
        
        a(i,j) = aw;
        a(i,j+1) = -1*ap;
        a(i,j+2) = ae;
        
    
    end
    %last row
    ae = k*A/(dx/2);
    aw = k*A/dx;
    ap = ae +aw;
    
    a(n,n) = -1*ap;
    a(n,n-1) = aw;
    b(n) = -1*tb * ae;
    
tt = b/a;
t = cat(2,ta,tt,tb);

t'
colormap(t)