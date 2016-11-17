function [ TrainC1, TestC1, TrainC2, TestC2] = extractTestAndTrain(VTC1, VTC2, sizeTrain)

    sizeVTC1 = size(VTC1,1);
    sizeVTC2 = size(VTC2, 1);
    
    C1Indice      = randperm(sizeVTC1);
    TrainC1Indice = C1Indice(1:sizeTrain);
    TestC1Indice  = C1Indice(sizeTrain+1:sizeVTC1);
        
    C2Indice          = randperm(sizeVTC2);
    TrainC2Indice     = C2Indice(1:sizeTrain);
    TestC2Indice      = C2Indice(sizeTrain+1:sizeVTC2);
    
    TrainC2     = VTC2(TrainC2Indice,:);
    TrainC1  = VTC1(TrainC1Indice,:);
        
    TestC2      =  VTC2(TestC2Indice,:);
    TestC1   =  VTC1(TestC1Indice,:);

end

