clc;
clear all;
ip = input('Enter the inputs');
t = [0,0,0,1];
w = [0,0];
b = 0;
n = 0.6; %Learning rate
for j = 1:100
    for i = 1:4
       yin(i,:) = ip(i,:)*w' + b;
       if yin(i) >= 0
           yout(i) = 1;
       else
           yout(i) = 0;
       end
    if yout(i) ~= t(i)
        e(i) = t(i)- yout(i);
        w = w + n*e(i)*ip(i,:);
        b = b + n*e(i);
    end
    end
end
