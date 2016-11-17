function  Res  = MyclassifyRisque(test, modelBar, modelSaumon, pBar, pSaumon, mcout)

    probBar     = normpdf(test,modelBar.mu, modelBar.sigma)*pBar;
    probSaumon  = normpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon;
    
    Res = ones(size(test));
    
    tmp = probBar*(mcout(1, 1) - mcout(2, 1)) < probSaumon*(mcout(2, 2)-mcout(1, 2));
    
    Res = Res + tmp; % 2 si échantillon classifié comme bar, 1 si échantillon classifié comme saumon

end

