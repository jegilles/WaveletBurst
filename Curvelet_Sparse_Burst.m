function [up,FW]=Curvelet_Sparse_Burst(v,lambda)
% ========================================================================
% function [up,FW]=Curvelet_Sparse_Burst(v,lambda)
%
% Performs the curvelet burst algorithm based on sparse constraint.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   lambda: thresholding parameter
%
% Outputs:
%   up: restored image
%   FW: sequence of weights
%
% Jerome Gilles
% Department of Mathematics & Statistics
% San Diego State University


%Curvelet decomposition of the input sequence
Fdec=cell(size(v,3),1);
for t=1:size(v,3)
   Fdec{t}=fdct_wrapping(v(:,:,t),1);
end

%initialize the structures
Fup=cell(size(Fdec{1}));
FW=cell(size(Fdec));
for l=1:length(Fup)
    Fup{l}=cell(size(Fdec{1}{l}));
     
    for i=1:length(Fup{l})
          Fup{l}{i}=zeros(size(Fdec{1}{l}{i})); 
    end
end

%threshold the framelet coefficients
for t=1:size(v,3)
    FW{t}=ShrinkCurvelet(Fdec{t},lambda);
end

%average
for s=1:length(Fup)
    for i=1:length(Fup{s})
        for l=1:length(FW)
            Fup{s}{i}=Fup{s}{i}+FW{l}{s}{i};
        end
        Fup{s}{i}=Fup{s}{i}/length(FW);    
    end
end

up=ifdct_wrapping(Fup,1);
