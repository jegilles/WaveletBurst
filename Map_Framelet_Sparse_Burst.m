function mapfb=Map_Framelet_Sparse_Burst(v,frame,NLevel,lambda,iter)

mapfb=mean(v,3);
for n=1:iter
    [vecX,vecY]=Turb_optflow(mapfb,v);
    mapv=Map_Sequence(v,-vecX,-vecY);
    mapfb=Framelet_Sparse_Burst(mapv,frame,NLevel,lambda);
end