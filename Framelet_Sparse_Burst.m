function [up,FW]=Framelet_Sparse_Burst(v,frame,NLevel,lambda)
% function [up,FW]=Framelet_Sparse_Burst(v,frame,NLevel,lambda)
%
% Performs the framelet burst algorithm based on sparsity constraint.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   frame: type of used Framelet (0=Haar, 1=Piecewise Linear
%        Framelet, 2=Piecewise Cubic Framelet)
%   lambda: thresholding parameter
%   NLevel: number of multiresolution levels
%
% Outputs:
%   up: restored image
%   FW: sequence of weights
%
% Jerome Gilles
% Department of Mathematics & Statistics
% San Diego State University


%Generation of Framelet filters
[D,R]=GenerateFrameletFilter(frame);

%Framelet decomposition of the input sequence
Fdec=cell(size(v,3),1);
for t=1:size(v,3)
   Fdec{t}=FraDecMultiLevel(v(:,:,t),D,NLevel); 
end

%initialize the structures
Fup=cell(size(Fdec{1}));
FW=cell(size(Fdec));
for l=1:length(Fup)  
    Fup{l}=cell(size(Fdec{1}{1}));
    for i=1:size(Fup{l},1)
       for j=1:size(Fup{l},2)
          Fup{l}{i,j}=zeros(size(v(:,:,1))); 
       end
    end
end

%threshold the framelet coefficients
for t=1:size(v,3)
    FW{t}=ShrinkFramelet(Fdec{t},lambda);
end

%average
for i=1:size(FW{1},1)
   for j=1:size(FW{1},2)
       for m=1:size(FW{1}{i,j},1)
           for n=1:size(FW{1}{i,j},2)
               for l=1:length(FW)
                    Fup{i,j}{m,n}=Fup{i,j}{m,n}+FW{l}{i,j}{m,n};
               end
               Fup{i,j}{m,n}=Fup{i,j}{m,n}/length(FW);    
           end
       end
   end
end


up=FraRecMultiLevel(Fup,R,NLevel);