clc;
clear all;
x = 0:0.01:10;

%Trapeziodal MF 1
y1 = trapmf(x,[0,1,4,7]);
y1 = 0.25*y1;
figure(1)
subplot(2,2,1);
plot(x,y1,'linewidth',2)
xlabel('Universe of Discouce');
ylabel('Membership Function');

%Trapeziodal MF 2
y2 = trapmf(x,[3,5,6,7]);
y2 = 0.7*y2;
figure(1)
subplot(2,2,2);
plot(x,y2,'linewidth',2)
xlabel('Universe of Discouce');
ylabel('Membership Function');

%Trapeziodal MF 3
y3 = trapmf(x,[2,6,7,8]);
y3 = 1*y3;
figure(1)
subplot(2,2,3);
plot(x,y3,'linewidth',2)
xlabel('Universe of Discouce');
ylabel('Membership Function');

%Combination
y = max(y1,y2);
b = max(y,y3);
subplot(2,2,4);
plot(x,b,'linewidth',2);
title('Combination')
xlabel('Universe of Discouce');
ylabel('Membership Function');


%Defuzzification 
%Method 1 
[max_one,n] = max(b);
max_1_1 = ((n-1)/100);

for i = n:1:(size(x,2)+1)
    if b(i) ~= max(b)
        max_last_1 = ((i-2)/100);
        break;
    end
end

mean_of_max = (max_1_1 + max_last_1)/2 

%Method 2 Centroid 
D = sum(b);
N = 0;
for i =0:1:1000
    N = N + b(i+1).*(0.01*i);
end
centroid = N/D 

%Method 3 Weighted Average 
%for y1 
[max_one,n] = max(y1);
max_1  = (n-1)/100;

for i =n:1:(size(x,2)+1)
    if y1(i) ~= max(y1)
        max_last = (i-2)/100;
        break;
    end
end

mean_y1 = (max_1 + max_last)/2

%for y2 
[max_one,n] = max(y2);
max_1  = (n-1)/100;

for i =n:1:(size(x,2)+1)
    if y2(i) ~= max(y2)
        max_last = (i-2)/100;
        break;
    end
end

mean_y2 = (max_1 + max_last)/2

%for y1 
[max_one,n] = max(y3);
max_1  = (n-1)/100;

for i = n:1:(size(x,2)+1)
    if y3(i) ~= max(y3)
        max_last = (i-2)/100;
        break;
    end
end

mean_y3 = (max_1 + max_last)/2

% Weighted Average Calculations 
Num = mean_y1*max(y1) + mean_y2*max(y2) + mean_y3*max(y3);
Dem = max(y1) + max(y2) + max(y3);
Wt_avg = Num/Dem


figure(2)
plot(x,b,'linewidth',2);
line([Wt_avg, Wt_avg],[0,1],'color','blue','linestyle','--','linewidth',2);
line([mean_of_max,mean_of_max],[0,1],'color','yellow','linestyle','-','linewidth',2);
line([centroid,centroid],[0,1],'color','red','linestyle',':','linewidth',2);
line([max_1_1, max_1_1],[0,1],'color','cyan','linestyle','-.','linewidth',2);
line([max_last_1, max_last_1],[0,1],'color','black','linestyle','--','linewidth',2);
legend('LAST OF MAXIMUM','WT_avg','MEAN OF MAX','CENTROID','FIRST OF MAXIMUM');