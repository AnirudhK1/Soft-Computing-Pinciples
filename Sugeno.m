clc;
t = 0:0.01:100;
% for x
x_small = gbellmf(t,[50 4 0]);
x_large = gbellmf(t,[50 4 100]);
figure(1)
plot(t,x_small,'--',t,x_large);
hold on 
xlabel('X->');
ylabel('Membership grade');

% for y
y_small = gbellmf(t,[50 4 0]);
y_large = gbellmf(t,[50 4 100]);
figure(2)
plot(t,y_small,'--',t,y_large);
hold on 
xlabel('y->');
ylabel('Membership grade');

%Rule base 
x = input('Enter the value of X')
y = input('Enter the value of Y')
z1 = -x + y + 1
z2 = -y +3
z3 = -x +3
z4 = x + y + 2

alpha1 = min(x_small(x*100+1),y_small(y*100+1))
alpha2 = min(x_small(x*100+1),y_large(y*100+1))
alpha3 = min(x_large(x*100+1),y_small(y*100+1))
alpha4 = min(x_large(x*100+1),y_large(y*100+1))

z0 = (alpha1*z1 + alpha2*z2 + alpha3*z3 + alpha4*z4)/(z1 +z2 +z3 + z4)