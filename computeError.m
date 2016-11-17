function [C1Error, C2Error ] = computeError(ResC1, ResC2)
    nbC2Error    = 2*size(ResC2,1) - sum(ResC2);
    C2Error = nbC2Error / size(ResC2,1);
    
    nbC1Error = sum(ResC1) - size(ResC1,1);
    C1Error = nbC1Error / size(ResC1,1);
end

