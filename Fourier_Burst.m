function up=Fourier_Burst(v,p)
% ========================================================================
% function up=Fourier_Burst(v,p)
%
% Performs the Fourier burst algorithm.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   p: integer value
%
% Outputs:
%   up: restored image
%
% Jerome Gilles
% Department of Mathematics & Statistics
% San Diego State University


c=zeros(size(v,1),size(v,2));
hup=zeros(size(v,1),size(v,2));

sigma=min(size(v,1),size(v,2))/50;
for t=1:size(v,3)
   vi=fft2(v(:,:,t));
   wi=imgaussfilt(abs(vi).^p,sigma);
   c=c+wi;
   hup=hup+wi.*vi;
end
up=real(ifft2(hup./c));