function [vecX,vecY]=Turb_optflow(reference,frames)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Optical Flow based on existing method
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S1=size(frames,1);
S2=size(frames,2);
S3=size(frames,3);

vecX=zeros(S1,S2,S3);
vecY=zeros(S1,S2,S3);

eps=1e-8;

for k=1:S3
    %Lucas-Kanade optical-flow
    [uvX,uvY,reliab] = optFlowLk(frames(:,:,k),reference,[],4,1.2,3e-6,0);
 
    % Take care of the boundary such that no vector points out of the region.
    [X,Y]=meshgrid(1:S2,1:S1);
    
    OUTX=(X+uvX>S2-eps);
    uvX(OUTX)=S2-X(OUTX)-eps;
    OUTX=(X+uvX<1+eps);
    uvX(OUTX)=1-X(OUTX)+eps;
    vecX(:,:,k)=uvX;
    
    OUTY=(Y+uvY>S1-eps);
    uvY(OUTY)=S1-Y(OUTY)-eps;
    OUTY=(Y+uvY<1+eps);
    uvY(OUTY)=1-Y(OUTY)+eps;
    vecY(:,:,k)=uvY;
end