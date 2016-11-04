function [ output_args ] = Myclassify(test,mu1,sigma1,mu2,sigma2)

Psaumon = 2/3 ;
Pbar = 1/3;
Px1 = normpdf(test, mu1, sigma1);

Px2 = normpdf(test, mu2, sigma2);

Pc1 = Px1 * Psaumon;
Pc2 = Px2 * Pbar;

for i=1:size(Pc1,1)
    if(Pc1(i) >= Pc2(i))
        output_args(i) = 1;
    else
        output_args(i) = 2;
    end
end

end

