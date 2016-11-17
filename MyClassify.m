function  Res  = MyClassify(test, modelC2, modelC1, pC2, pC1)

    probC2     = mvnpdf(test,modelC2.mu, modelC2.sigma)*pC2;
    probC1  = mvnpdf(test,modelC1.mu, modelC1.sigma)*pC1;
    
    Res = ones(size(test(:, 1)));
    
    tmp = probC2 >= probC1;
    
    Res = Res + tmp;

end