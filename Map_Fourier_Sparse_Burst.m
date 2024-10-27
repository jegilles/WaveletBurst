function mapfb=Map_Fourier_Sparse_Burst(v,lambda,iter)

mapfb=mean(v,3);
for n=1:iter
    [vecX,vecY]=Turb_optflow(mapfb,v);
    mapv=Map_Sequence(v,-vecX,-vecY);
    mapfb=Fourier_Sparse_Burst(mapv,lambda);
end