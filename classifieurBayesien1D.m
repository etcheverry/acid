
muSaumon    = 5;
sigmaSaumon = 2;

muBar       = 11;
sigmaBar    = 4;

sizeVTSaumon = 1000;
sizeVTBar = 500;

% mcout = [1 3; 2 2]; équivalent à MAP avec ces coefficients!
mcout = [0 2; 1 0];

%proba a priori
pBar=sizeVTBar/(sizeVTBar+sizeVTSaumon);
pSaumon=sizeVTSaumon/(sizeVTBar+sizeVTSaumon);

VTSaumon = mvnrnd(muSaumon,sigmaSaumon*sigmaSaumon, sizeVTSaumon);
VTBar    = mvnrnd(muBar, sigmaBar*sigmaBar, sizeVTBar);

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
errorBarML = zeros(nbIter,1);
errorSaumonML = zeros(nbIter, 1);
errorBarMAP = zeros(nbIter,1);
errorSaumonMAP = zeros(nbIter, 1);
errorBarRisque = zeros(nbIter,1);
errorSaumonRisque = zeros(nbIter, 1);


for i=1:nbIter
    
        [TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);
        [modelSaumon] = TrainModel(TrainSaumon);
        [modelBar] = TrainModel(TrainBar);
       
        % maximum de vraissemblance 
        ResBar    =    Myclassify(TestBar,modelBar, modelSaumon, 0.5, 0.5);
        ResSaumon =    Myclassify(TestSaumon,modelBar, modelSaumon, 0.5, 0.5);
        [SaumonError, BarError] = computeError(ResSaumon, ResBar);
        errorSaumonML(i) = SaumonError*100;
        errorBarML(i) = BarError*100;
        
        % MAP (utilisation des proba a priori)
        ResBar    =    Myclassify(TestBar,modelBar, modelSaumon, pBar, pSaumon);
        ResSaumon =    Myclassify(TestSaumon,modelBar, modelSaumon, pBar, pSaumon);
        [SaumonError, BarError] = computeError(ResSaumon, ResBar);
        errorSaumonMAP(i) = SaumonError*100;
        errorBarMAP(i) = BarError*100;
        
        % Risque (utilisation de la matrice de cout)
        ResBar    =    MyclassifyRisque(TestBar,modelBar, modelSaumon, pBar, pSaumon, mcout);
        ResSaumon =    MyclassifyRisque(TestSaumon,modelBar, modelSaumon, pBar, pSaumon, mcout);
        [SaumonError, BarError] = computeError(ResSaumon, ResBar);
        errorSaumonRisque(i) = SaumonError*100;
        errorBarRisque(i) = BarError*100;
        
end;

MeanErrorBarML    = mean(errorBarML)
MeanErrorSaumonML = mean(errorSaumonML)

MeanErrorBarMAP    = mean(errorBarMAP)
MeanErrorSaumonMAP = mean(errorSaumonMAP)

MeanErrorBarRisque    = mean(errorBarRisque)
MeanErrorSaumonRisque = mean(errorSaumonRisque)

figure(3);
plot(1:nbIter, errorBarML, 'g')
hold on
plot(1:nbIter, errorSaumonML)

figure(4);
plot(1:nbIter, errorBarMAP, 'g')
hold on
plot(1:nbIter, errorSaumonMAP)

figure(5);
plot(1:nbIter, errorBarRisque, 'g')
hold on
plot(1:nbIter, errorSaumonRisque)

