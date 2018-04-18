clc
clear 'all'

s = 0:0.1:827;


for i = 1:666
    v(i) = 0.2 * (s(i)/0.067)^(1/3);
    a(i) = 0.4 * (s(i)/0.067)^(1/3);
end

for i = 667:3869
    v(i) = sqrt((499*s(i)+30)/598.8);
    a(i) = 2.4;
end

for i = 3870:8271
    v(i) = 44;
    a(i) = 0;
end


figure(1)
plot(s(1:666),v(1:666),'r')
xlabel('Dispalcement')
ylabel('Velocity')
grid()

figure(2)
plot(s(667:3869),v(667:3869),'b')
xlabel('Dispalcement')
ylabel('Velocity')
grid()

figure(3)
plot(s(3870:8271),v(3870:8271),'g')
xlabel('Dispalcement')
ylabel('Velocity')
grid()

figure(4)
plot(s(1:666),v(1:666),'r',s(666:3869),v(666:3869),'b',s(3869:8271),v(3869:8271),'g')
xlabel('Dispalcement')
ylabel('Velocity')
grid()
print('figure1.png')

figure(5)
plot(s,v)
xlabel('Dispalcement')
ylabel('Velocity')
grid()


figure(6)
plot(s(1:666),a(1:666),'r')
xlabel('Dispalcement')
ylabel('acceleration')
grid()

figure(7)
plot(s(667:3869),a(667:3869),'b')
xlabel('Dispalcement')
ylabel('acceleration')
grid()

figure(8)
plot(s(3870:8271),a(3870:8271),'g')
xlabel('Dispalcement')
ylabel('acceleration')
grid()

figure(9)
plot(s(1:666),a(1:666),'r',s(666:3869),a(666:3869),'b',s(3869:8271),a(3869:8271),'g')
xlabel('Dispalcement')
ylabel('acceleration')
grid()

figure(10)
plot(s,a)
xlabel('Dispalcement')
ylabel('acceleration')
grid()




