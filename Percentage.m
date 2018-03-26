clc
percentage = 0.01:0.01:1;

for i= 1:length(percentage)
    df1(i) = 1-(1/(1+percentage(i)));
    df2(i) = df1(i)^2;
    df3(i) = df1(i)^3;
end

figure(1)
plot(df1,percentage,'k')
xlabel("discount factor (1-D)")
ylabel("discount rate (1-r)")
saveas(1,'year1.png')
figure(2)
plot(df2, percentage,'k')
xlabel("discount factor (1-D)")
ylabel("discount rate (1-r)")
saveas(2,'year2.png')
figure(3)
plot(df3, percentage,'k')
xlabel("discount factor (1-D)")
ylabel("discount rate (1-r)")
saveas(3,'year3.png')


