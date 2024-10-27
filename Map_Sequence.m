function v=Map_Sequence(f,vecX,vecY)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Morphing of the image via given vector field
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[X,Y]=meshgrid(1:size(f,2),1:size(f,1));

v=zeros(size(f));
for k=1:size(f,3)
    XX=X+vecX(:,:,k);
    XX(XX<1)=1;
    XX(XX>size(f,2))=size(f,2);
    YY=Y+vecY(:,:,k);
    YY(YY<1)=1;
    YY(YY>size(f,1))=size(f,1);
    v(:,:,k)=interp2(f(:,:,k),XX,YY,'linear');    
end