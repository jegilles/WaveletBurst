function mapfb=Map_Framelet_Sparse_Burst(v,frame,NLevel,lambda,iter)
% function mapfb=Map_Framelet_Sparse_Burst(v,frame,NLevel,lambda,iter)
%
% Performs the framelet burst algorithm based on sparsity constraint after 
% non-rigid regularization.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   frame: type of used Framelet (0=Haar, 1=Piecewise Linear
%        Framelet, 2=Piecewise Cubic Framelet)
%   NLevel: number of multiresolution levels
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
    mapfb=Framelet_Sparse_Burst(mapv,frame,NLevel,lambda);
end