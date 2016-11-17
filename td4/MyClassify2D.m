function  Res  = MyClassify2D(test, modelBar, modelSaumon, pBar, pSaumon)

    %mvnpdf = multi dimensions
    probBar     = mvnpdf(test,modelBar.mu, modelBar.sigma)*pBar;
    probSaumon  = mvnpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon;
    
    Res = ones(size(test(:, 1)));
    
    tmp = probBar >= probSaumon;
    
    Res = Res + tmp; % 2 si échantillon classifié comme bar, 1 si échantillon classifié comme saumon

end