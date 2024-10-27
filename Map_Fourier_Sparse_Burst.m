function mapfb=Map_Fourier_Sparse_Burst(v,lambda,iter)
% ========================================================================
% function mapfb=Map_Fourier_Sparse_Burst(v,lambda,iter)
%
% Performs the Fourier burst algorithm based on sparsity constraint after
% non-rigid regularization.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   lambda: thresholding parameter
%   iter: number of iterations
%
% Outputs:
%   mapfb: restored image
%
% Jerome Gilles
% Department of Mathematics & Statistics
% San Diego State University

mapfb=mean(v,3);
for n=1:iter
    [vecX,vecY]=Turb_optflow(mapfb,v);
    mapv=Map_Sequence(v,-vecX,-vecY);
    mapfb=Fourier_Sparse_Burst(mapv,lambda);
end