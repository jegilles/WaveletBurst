function mapfb=Map_Fourier_Burst(v,p,iter)
% ========================================================================
% function mapfb=Map_Fourier_Burst(v,p,iter)
%
% Performs the Fourier burst algorithm after non-rigid regularization.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   p: integer value
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
    mapfb=Fourier_Burst(mapv,p);
end