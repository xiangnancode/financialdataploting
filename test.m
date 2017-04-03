quotes1(:,1) = quotes1(:,1) - data(1,1);
while (quotes1(1) < 0)
    ontimequote = quotes1(1,:);
    quotes1(1,:) = [];
end
data(1,6:7) = ontimequote(2:3);
quotes1 = [ontimequote; quotes1];
quotes1(:,1) = quotes1(:,1) + data(1,1);