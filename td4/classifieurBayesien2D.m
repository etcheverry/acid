
muSaumon    = [8 8];
sigmaSaumon = [1 0 ; 0 1];

muBar       = [12 12];
sigmaBar    = [4 0 ; 0 4];

sizeVTSaumon = 1000;
sizeVTBar = 500;

%proba a priori
pBar=sizeVTBar/(sizeVTBar+sizeVTSaumon);
pSaumon=sizeVTSaumon/(sizeVTBar+sizeVTSaumon);

VTSaumon = mvnrnd(muSaumon,sigmaSaumon.*sigmaSaumon, sizeVTSaumon);
VTBar    = mvnrnd(muBar, sigmaBar.*sigmaBar, sizeVTBar);

%visualisation des échantillons 
%figure(1)
%plot(VTSaumon,'.');
%hold on
%plot(VTBar,'.g');

%figure(2)
%histogram(VTSaumon,'Normalization','pdf');
%hold on
%histogram(VTBar,'Normalization','pdf');
%plot(0:0.1:25,normpdf(0:0.1:25,muSaumon,sigmaSaumon),'r')
%plot(0:0.1:25,normpdf(0:0.1:25,muBar,sigmaBar),'g')


nbIter   = 50;
sizeTrain = 200;
errorBarMAP = zeros(nbIter,1);
errorSaumonMAP = zeros(nbIter, 1);


for i=1:nbIter
    
        [TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain2D(VTSaumon, VTBar, sizeTrain);
        [modelSaumon] = TrainModel2D(TrainSaumon);
        [modelBar] = TrainModel2D(TrainBar);
       
        % MAP (utilisation des proba a priori)
        ResBar    =    MyClassify2D(TestBar,modelBar, modelSaumon, pBar, pSaumon);
        ResSaumon =    MyClassify2D(TestSaumon,modelBar, modelSaumon, pBar, pSaumon);
        [SaumonError, BarError] = computeError(ResSaumon, ResBar);
        errorSaumonMAP(i) = SaumonError*100;
        errorBarMAP(i) = BarError*100;
        
end;

MeanErrorBarMAP    = mean(errorBarMAP)
MeanErrorSaumonMAP = mean(errorSaumonMAP)


figure(4);
plot(1:nbIter, errorBarMAP, 'g')
hold on
plot(1:nbIter, errorSaumonMAP)


