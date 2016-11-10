function [model] = TrainModel2D (Train)

model.mu = mean(Train);
model.sigma = sqrt(var(Train));

end
