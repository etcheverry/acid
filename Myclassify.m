function  Res  = Myclassify(test, modelBar, modelSaumon, pBar, pSaumon)

    %nvmpdf = multi dimensions
    probBar     = normpdf(test,modelBar.mu, modelBar.sigma)*pBar;
    probSaumon  = normpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon;
    
    Res = ones(size(test));
    
    tmp = probBar >= probSaumon;
    
    Res = Res + tmp; % 2 si échantillon classifié comme bar, 1 si échantillon classifié comme saumon

end

