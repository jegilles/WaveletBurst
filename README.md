# WaveletBurst
 Fourier and Wavelet burst algorithms

 This package provides the functions used in J.Gilles, S.Osher, "Wavelet burst accumulation for turbulence mitigation", 
 Journal of Electronic Imaging, Vol.25, No.3, 033003-1--033003-9, May 2016.

 The main functions are:
 - Fourier_Burst.m - Fourier burst approach as described in Delbracio's paper
 - Framelet_Burst.m - Apply bursting in the Framelet domain
 - Curvelet_Burst.m - Apply bursting in the curvelet domain
 - Fourier_Sparse_Burst.m - Fourier burst using a sparsity constraint
 - Framelet_Sparse_Burst.m - Apply bursting in the Framelet domain using a sparsity constraint
 - Curvelet_Sparse_Burst.m - Apply bursting in the curvelet domain using a sparsity constraint
 - Map_Fourier_Burst.m - Fourier burst approach as described in Delbracio's paper after non-rigid regularization
 - Map_Framelet_Burst.m - Apply bursting in the Framelet domain after non-rigid regularization
 - Map_Curvelet_Burst.m - Apply bursting in the curvelet domain after non-rigid regularization
 - Map_Fourier_Sparse_Burst.m - Fourier burst using a sparsity constraint after non-rigid regularization
 - Map_Framelet_Sparse_Burst.m - Apply bursting in the Framelet domain using a sparsity constraint after non-rigid regularization
 - Map_Curvelet_Sparse_Burst.m - Apply bursting in the curvelet domain using a sparsity constraint after non-rigid regularization

To run this code, you need to following external toolboxes:
- Curvelab: https://www.curvelet.org/
- Framelet toolbox, written by Jianfeng Cai and available at https://jegilles.sdsu.edu/code/Framelet.zip

 Note: to run the functions using the non-rigid regularization, the Piotr's toolbox v2.52 must be installed (a copy in a zip file
 is provided for compatibility purposes, please check the license inside).
