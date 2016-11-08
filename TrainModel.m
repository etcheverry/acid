function [model] = TrainModel (Train)

model.mu = mean(Train);
model.sigma = sqrt(var(Train));

end
