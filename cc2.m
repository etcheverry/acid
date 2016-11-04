data = load('DonneesCC.mat');

%data.x1
%data.x2
%data.x3
%data.x4

%[x y] = meshgrid(data.x1(1,:), data.x1(2,:));
%z = repmat(data.x1(3,:), size(x,1),1);
%scatter3(x, y, z)
figure
hold on

scatter3(data.x1(:,1),data.x1(:,2),data.x1(:,3),'.', 'Red')
scatter3(data.x2(:,1),data.x2(:,2),data.x2(:,3),'.', 'Green')
scatter3(data.x3(:,1),data.x3(:,2),data.x3(:,3),'.', 'Black')
scatter3(data.x4(:,1),data.x4(:,2),data.x4(:,3),'.', 'Blue')
hold off

for i = 1:3

mu = mean(data.x1(:,i))
sigma = sqrt(var(data.x1(:,i)))
n1 = normpdf(data.x1(:,i), mu, sigma);

mu = mean(data.x2(:,i))
sigma = sqrt(var(data.x2(:,i)))
n2 = normpdf(data.x2(:,i), mu, sigma);

mu = mean(data.x3(:,i))
sigma = sqrt(var(data.x3(:,i)))
n3 = normpdf(data.x3(:,i), mu, sigma);

mu = mean(data.x4(:,i))
sigma = sqrt(var(data.x4(:,i)))
n4 = normpdf(data.x4(:,i), mu, sigma);

figure

hold on
plot(data.x1(:,i), n1, '.', 'color', 'Red')
plot(data.x2(:,i), n2, '.', 'color', 'Green')
plot(data.x3(:,i), n3, '.', 'color', 'Black')
plot(data.x4(:,i), n4, '.', 'color', 'Blue')
hold off

end

%On élimine le 4