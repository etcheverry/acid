function [ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain2D(VTSaumon, VTBar, sizeTrain)

    sizeVTSaumon = size(VTSaumon,1);
    sizeVTBar = size(VTBar, 1);
    
    SaumonIndice      = randperm(sizeVTSaumon);
    TrainSaumonIndice = SaumonIndice(1:sizeTrain);
    TestSaumonIndice  = SaumonIndice(sizeTrain+1:sizeVTSaumon);
        
    BarIndice          = randperm(sizeVTBar);
    TrainBarIndice     = BarIndice(1:sizeTrain);
    TestBarIndice      = BarIndice(sizeTrain+1:sizeVTBar);
        
    %Ceci marche si VTbar = [[attribut1 attribut2] [attribut1 attribut2] ...]
    
    TrainBar     = VTBar(TrainBarIndice,:);
    TrainSaumon  = VTSaumon(TrainSaumonIndice,:);
        
    TestBar      =  VTBar(TestBarIndice,:);
    TestSaumon   =  VTSaumon(TestSaumonIndice,:);

end

