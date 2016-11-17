data = load('DonneesCC.mat');

[proj1D1 proj1D2 proj1D3 proj2D1, proj2D2, proj2D3] = ACP(data.x1, data.x2, data.x3);

pC1 = size(proj2D1)/(size(proj2D1)+size(proj2D2)+size(proj2D3));
pC2 = size(proj2D2)/(size(proj2D1)+size(proj2D2)+size(proj2D3));
pC3 = size(proj2D3)/(size(proj2D1)+size(proj2D2)+size(proj2D3));




nbIter   = 100;
sizeTrain = 500;

[errorC2MAP, errorC1MAP] = classifieurBayesien(pC1, pC2, nbIter, sizeTrain, proj2D1, proj2D2);


MeanErrorC2MAP    = mean(errorC2MAP)
MeanErrorC1MAP = mean(errorC1MAP)

figure(1);
plot(1:nbIter, errorC2MAP, 'g')
hold on
plot(1:nbIter, errorC1MAP)

[errorC3MAP, errorC1MAP] = classifieurBayesien(pC1, pC3, nbIter, sizeTrain, proj2D1, proj2D3);


MeanErrorC3MAP    = mean(errorC3MAP)
MeanErrorC1MAP = mean(errorC1MAP)

figure(2);
plot(1:nbIter, errorC3MAP, 'g')
hold on
plot(1:nbIter, errorC1MAP)

[errorC3MAP, errorC2MAP] = classifieurBayesien(pC2, pC3, nbIter, sizeTrain, proj2D2, proj2D3);


MeanErrorC2MAP    = mean(errorC2MAP)
MeanErrorC3MAP = mean(errorC3MAP)

figure(3);
plot(1:nbIter, errorC2MAP, 'g')
hold on
plot(1:nbIter, errorC3MAP)