function up=Fourier_Sparse_Burst(v,lambda)
% ========================================================================
% function up=Fourier_Sparse_Burst(v,p)
%
% Performs the Fourier burst algorithm based on sparsity constraint.
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


%compute the FFT of each frame
Fv=cell(size(v,3),1);
for t=1:size(v,3)
   Fv{t}=fft2(v(:,:,t));
end

%soft thresholding each FFT
for t=1:size(v,3)
   Fv{t}=max(abs(Fv{t})-lambda,0).*Fv{t}./abs(Fv{t}); 
end

%average
for t=2:size(v,3)
    Fv{1}=Fv{1}+Fv{t};
end
Fv{1}=Fv{1}/size(v,3);

up=real(ifft2(Fv{1}));