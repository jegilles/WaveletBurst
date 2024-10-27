function mapfb=Map_Fourier_Burst(v,p,iter)

mapfb=mean(v,3);
for n=1:iter
    [vecX,vecY]=Turb_optflow(mapfb,v);
    mapv=Map_Sequence(v,-vecX,-vecY);
    mapfb=Fourier_Burst(mapv,p);
end