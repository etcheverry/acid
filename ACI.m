function [proj1D1 proj1D2 proj1D3 proj2D1 proj2D2 proj2D3] = ACI(C1, C2, C3)

Mu1 = mean(C1);
Mu2 = mean(C2);
Mu3 = mean(C3);
Mu = (Mu1 + Mu2 + Mu3)./3;

S1 = cov(C1);
S2 = cov(C2);
S3 = cov(C3);
Sw = S1 + S2 + S3;

SB1 = size(C1, 1) * (Mu1-Mu)'*(Mu1-Mu);
SB2 = size(C2, 1) * (Mu2-Mu)'*(Mu2-Mu);
SB3 = size(C3, 1) * (Mu3-Mu)'*(Mu3-Mu);

SB = SB1 + SB2 + SB3;
invSw = inv(Sw);
invSwSB = invSw*SB;

[V,D] = eig(invSwSB);

W2 = transpose([V(:,1),V(:,2)])
W1 = transpose([V(:,1)])

comp1 = C1 - repmat(Mu, size(C1, 1), 1);
comp2 = C2 - repmat(Mu, size(C2, 1), 1);
comp3 = C3 - repmat(Mu, size(C3, 1), 1);

proj1D1 = transpose(W1*comp1');
proj1D2 = transpose(W1*comp2');
proj1D3 = transpose(W1*comp3');

proj2D1 = transpose(W2*comp1');
proj2D2 = transpose(W2*comp2');
proj2D3 = transpose(W2*comp3');