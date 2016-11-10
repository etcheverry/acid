function  Res  = MyClassify2D(test, modelBar, modelSaumon, pBar, pSaumon)

    %mvnpdf = multi dimensions
    probBar     = mvnpdf(test,modelBar.mu, modelBar.sigma)*pBar;
    probSaumon  = mvnpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon;
    
    Res = ones(size(test,1));
    
    evidence = pBar * probBar(1) * probBar(2) + pSaumon * probSaumon(1) * probSaumon(2);
    
    posterieureBar = (pBar * probBar(1) * probBar(2))/evidence;
    
    posterieureSaumon = (pSaumon * probSaumon(1) * probSaumon(2))/evidence;
    
    tmp = posterieureBar >= posterieureSaumon;
    
    Res = Res + tmp; % 2 si échantillon classifié comme bar, 1 si échantillon classifié comme saumon

end