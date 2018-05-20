clc


sigma_y = [800, 1000, 1200, 1300, 1400, 1600, 1800];
d_zero = zeros(length(sigma_y));

for i = 1:length(sigma_y)
    d_zero(i) = ((32 * 3.8e3 * 2)/(pi * sigma_y(i)))^(1/3);
end

plot(sigma_y,d_zero)

title('D_{0} VS. \sigma_{y}')
xlabel('\sigma_{y}')
ylabel('D_{0}')

