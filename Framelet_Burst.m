function [up,FW]=Framelet_Burst(v,frame,NLevel,p)

% Inputs:
%   v: 3D matrix containing the input sequence (the 3rd coordinate is the
%   time)
%   p: integer value
%   frame: type of used Framelet (0=Haar, 1=Piecewise Linear
%        Framelet, 2=Piecewise Cubic Framelet)

%Generation of Framelet filters
[D,R]=GenerateFrameletFilter(frame);

%Framelet decomposition of the input sequence
Fdec=cell(size(v,3),1);
for t=1:size(v,3)
   Fdec{t}=FraDecMultiLevel(v(:,:,t),D,NLevel); 
end

%initialize the structures
Fup=cell(size(Fdec{1}));
FW=cell(size(Fdec{1}));
for l=1:length(FW)  
    Fup{l}=cell(size(Fdec{1}{1}));
    FW{l}=cell(size(Fdec{1}{1}));
    for i=1:size(FW{l},1)
       for j=1:size(FW{l},2)
          Fup{l}{i,j}=zeros(size(v(:,:,1))); 
          FW{l}{i,j}=zeros(size(v(:,:,1))); 
       end
    end
end
sigma=min(size(v,1),size(v,2))/50;

%compute the weights
for t=1:size(v,3)
    for l=1:length(FW)
        for i=1:size(FW{l},1)
            for j=1:size(FW{l},2)
                wi=imgaussfilt(abs(Fdec{t}{l}{i,j}).^p,sigma);
                FW{l}{i,j}=FW{l}{i,j}+wi;
                Fup{l}{i,j}=Fup{l}{i,j}+wi.*Fdec{t}{l}{i,j};
            end
       end
   end
end

for l=1:length(FW)
   for i=1:size(FW{l},1)
       for j=1:size(FW{l},2)
            Fup{l}{i,j}=Fup{l}{i,j}./FW{l}{i,j};
       end
   end
end


up=FraRecMultiLevel(Fup,R,NLevel);