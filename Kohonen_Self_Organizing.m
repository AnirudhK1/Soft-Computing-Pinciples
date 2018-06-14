X = [1 1 0 0;0 0 0 1;1 0 0 0; 0 0 1 1];
n = 0.6;
W = [0.2 0.8;0.6 0.4;0.5 0.7;0.9 0.3];
disp('The Initial Weigths are');
disp(W);

for epoch = 1:100000
    for i=1:4
        for j= 1:2
            D(j)=0;
            for k=1:4
                D(j) = D(j) + ((W(k,j)-X(i,k))^2);
            end
        end
            for j = 1:2
                if D(j) == min(D)
                    M = j;
                end
            end
            
            for k = 1:4
                W(k,M) = W(k,M) + 0.6*(X(i,k)-W(k,M));
            end
    end
    n = 0.5*n;
end
    disp('The Final WeightMatrix is :')
    disp(W);