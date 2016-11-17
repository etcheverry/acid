function [errorC2MAP, errorC1MAP] = classifieurBayesien (pC1, pC2, nbIter, sizeTrain, C1, C2)

errorC2MAP = zeros(nbIter,1);
errorC1MAP = zeros(nbIter, 1);

for i=1:nbIter
    
        [TrainC1,TestC1,TrainC2, TestC2] = extractTestAndTrain(C1, C2, sizeTrain);
        [modelC1] = TrainModel(TrainC1);
        [modelC2] = TrainModel(TrainC2);
        
        % MAP (utilisation des proba a priori)
        ResC2    =    MyClassify(TestC2,modelC2, modelC1, pC2, pC1);
        ResC1 =    MyClassify(TestC1,modelC2, modelC1, pC2, pC1);
        [C1Error, C2Error] = computeError(ResC1, ResC2);
        errorC1MAP(i) = C1Error*100;
        errorC2MAP(i) = C2Error*100;
        
end;