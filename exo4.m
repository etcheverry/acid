%extraire ensemble d'entrainement
muSaumon    = 5;
sigmaSaumon = 2;
muBar       = 11;
sigmaBar    = 4;
sizeVT = 1000;
VTSaumon = mvnrnd(muSaumon,sigmaSaumon, sizeVT);
VTBar = mvnrnd(muBar, sigmaBar, sizeVT);
nbIter   = 1;
sizeTrain = 100;

for i=1:nbIter 
    TrainSaumonIndice = randperm(sizeVT,sizeTrain);
    TrainBarIndice = randperm(sizeVT,sizeTrain);
    %ensemble d'entrainement    
    TrainSaumon  = VTSaumon(TrainSaumonIndice);
    TrainBar = VTSaumon(TrainBarIndice);
    
    muBarTrain = mean(TrainBar);
    sigmaBarTrain = sqrt(var(TrainBar));
    
    muSaumonTrain = mean(TrainSaumon);
    sigmaSaumonTrain = sqrt(var(TrainSaumon));
    
    TestBar = VTBar;
    TestSaumon = VTSaumon;

    ResBar = Myclassify(TestBar,muBarTrain,sigmaBarTrain,muSaumonTrain,sigmaSaumonTrain)
    ResSaumon = Myclassify(TestSaumon,muBarTrain,sigmaBarTrain,muSaumonTrain,sigmaSaumonTrain)
    
    nbBarErreur = 2*size(ResBar, 1) - sum(ResBar)
    nbSaumonErreur = sum(ResSaumon) - size(ResSaumon, 2)    
end;