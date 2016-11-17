function [SaumonError, BarError ] = computeError(ResSaumon, ResBar)
    nbBarError    = 2*size(ResBar,1) - sum(ResBar);
    BarError = nbBarError / size(ResBar,1);
    
    nbSaumonError = sum(ResSaumon) - size(ResSaumon,1);
    SaumonError = nbSaumonError / size(ResSaumon,1);
end

