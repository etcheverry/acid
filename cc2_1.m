data = load('DonneesCC.mat');

figure
hold on

scatter3(data.x1(:,1),data.x1(:,2),data.x1(:,3),'.', 'Red')
scatter3(data.x2(:,1),data.x2(:,2),data.x2(:,3),'.', 'Green')
scatter3(data.x3(:,1),data.x3(:,2),data.x3(:,3),'.', 'Black')
scatter3(data.x4(:,1),data.x4(:,2),data.x4(:,3),'.', 'Blue')
hold off

for i = 1:3

n1 = gaussienne(data.x1, i);
n2 = gaussienne(data.x2, i);
n3 = gaussienne(data.x3, i);
n4 = gaussienne(data.x4, i);

figure

hold on
plot(data.x1(:,i), n1, '.', 'color', 'Red')
plot(data.x2(:,i), n2, '.', 'color', 'Green')
plot(data.x3(:,i), n3, '.', 'color', 'Black')
plot(data.x4(:,i), n4, '.', 'color', 'Blue')
hold off

end

%On élimine le 4

function [ n ] = gaussienne(data, i)

    mu = mean(data(:,i))
    sigma = sqrt(var(data(:,i)))
    n = normpdf(data(:,i), mu, sigma);

end