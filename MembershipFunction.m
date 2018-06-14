a = 10;
b =40;
c = 70;
d = 90;
sigma = 5;
x = 1:100;
y = max(min(((x-a)/(b-a)),((c-x)/(c-b))),0);
z = max(min(min(((x-a)/(b-a)),1),((d-x)/(d-c))),0);
g = exp((((x-c)/sigma).^2).*-0.5);

bell = 1./(1 + (abs((x-c)/a)).^(2*b));
sigmoid = 1./(1 + exp((-a).*(x-c)));
for i = 1:100
    if i<50 
        funct(i) = max(min(min(((i-a)/(b-a)),1),((d-i)/(d-c))),0);
    else
        funct(i) = exp((((i-c)/sigma).^2).*-0.5);
    end
end
plot(x,g);
xlabel('Universe of Discourse');
ylabel('Triangular Membership Function');
