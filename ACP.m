function [proj1D1 proj1D2 proj1D3 proj2D1, proj2D2, proj2D3] = ACP (C1, C2, C3)

mu1 = mean(C1);
mu2 = mean(C2);
mu3 = mean(C3);

mu = (mu1 + mu2 + mu3)./3;

comp1 = C1 - repmat(mu, size(C1, 1), 1);
comp2 = C2 - repmat(mu, size(C2, 1), 1);
comp3 = C3 - repmat(mu, size(C3, 1), 1);

S1 = (size(comp1,1) - 1) * cov(comp1);
S2 = (size(comp2,1) - 1) * cov(comp2);
S3 = (size(comp3,1) - 1) * cov(comp3);

[e, lambda] = eigs(S1+S2+S3);

W2 = transpose([e(:,1),e(:,2)])
W1 = transpose([e(:,1)])

proj1D1 = transpose(W1*comp1');
proj1D2 = transpose(W1*comp2');
proj1D3 = transpose(W1*comp3');

proj2D1 = transpose(W2*comp1');
proj2D2 = transpose(W2*comp2');
proj2D3 = transpose(W2*comp3');