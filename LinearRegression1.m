clc;
%clear all;
x = 0:0.01:0.99;
t = x*4 + rand(1,100) + 7;
w =0; % Initial weights 
b =0; % Intial Bias
epoch = 50; % Number of Iterations 
for i = 1:epoch 
    mse = 0; % Variable used for storing Mean sqaure error
    for j = 1:100
        y(j) = purelin(x(j)*w + b);
        e = t(j) - y(j); % Error 
        w = w + e*x(j);
        b = b + e;
        mse = mse + e^2;
    end
    mse = mse /100;
    mserror(i) = mse; % Mean Square error of each iteration
end
% Plots 
figure(1)
scatter(x,y);
refline(w,b); % Function use for drawing a line with given slope and intercept
title('Linear Regression');
figure(2)
plot(1:epoch,mserror);
xlabel('Number of Iterations');
ylabel('MSE');