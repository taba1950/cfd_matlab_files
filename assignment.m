clc

n=7;

t(1) = 100;
t(n) = 500;


k = 1000;
A = 1e-2;
length = 0.5;
dx = length/(n-2);


%compute internal points


for  iter=1:100
    
    ae = k*A/dx;
    aw = k*A/(dx/2);
    ap = ae +aw;
    
    t(2) = (aw*t(1)+ae*t(3))/ap;

    for i=3:n-2
        
        ae = k*A/dx;
        aw = k*A/dx;
        ap = ae +aw;
        t(i) = (aw*t(i-1) + ae*t(i+1)) / ap;
    
    end
    
    ae = k*A/(dx/2);
    aw = k*A/dx;
    ap = ae +aw;
    t(n-1) = (aw*t(n-2) + ae*t(n)) / ap;
    

end


t'
