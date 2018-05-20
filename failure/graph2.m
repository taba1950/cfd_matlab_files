clc


d_c = [0.0156, 0.0158, 0.0163, 0.0192, 0.0223, 0.026];
sigma_y = zeros(length(d_c));

for i = 1:length(d_c)
    sigma_y(i) = (32 * 3.8e3 * 2)/(pi * (d_c(i)^3));
end

plot(d_c,sigma_y)

title('\sigma_{y} VS. D_{c}')
xlabel('D_{c}')
ylabel('\sigma_{y}')
xlim([0.0156,0.026])

