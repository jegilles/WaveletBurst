function mapfb=Map_Framelet_Burst(v,frame,NLevel,p,iter)

mapfb=mean(v,3);
for n=1:iter
    [vecX,vecY]=Turb_optflow(mapfb,v);
    mapv=Map_Sequence(v,-vecX,-vecY);
    mapfb=Framelet_Burst(mapv,frame,NLevel,p);
end