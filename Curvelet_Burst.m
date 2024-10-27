function [up,FW]=Curvelet_Burst(v,p)
% ========================================================================
% function [up,FW]=Curvelet_Burst(v,p)
%
% Performs the curvelet burst algorithm.
%
% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   p: integer value
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
FW=cell(size(Fdec{1}));
for l=1:length(FW)
    Fup{l}=cell(size(Fdec{1}{l}));
    FW{l}=cell(size(Fdec{1}{l}));    
     
    for i=1:length(FW{l})
          Fup{l}{i}=zeros(size(Fdec{1}{l}{i})); 
          FW{l}{i}=zeros(size(Fdec{1}{l}{i})); 
    end
end
sigma=min(size(v,1),size(v,2))/50;

%compute the weights
for t=1:size(v,3)
    for l=1:length(FW)
        for i=1:length(FW{l})
           wi=imgaussfilt(abs(Fdec{t}{l}{i}).^p,sigma);
           FW{l}{i}=FW{l}{i}+wi;
           Fup{l}{i}=Fup{l}{i}+wi.*Fdec{t}{l}{i};
       end
   end
end

for l=1:length(FW)
   for i=1:length(FW{l})
       Fup{l}{i}=Fup{l}{i}./FW{l}{i};
   end
end

up=ifdct_wrapping(Fup,1);
