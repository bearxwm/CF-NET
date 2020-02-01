% function [EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,SSIM, MS_SSIM] = analysis_Reference(image_f,image_ir,image_vis)
function [EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,PSNR,SSIM,MS_SSIMS,MS_SSIMa] = analysis_Reference(image_f,image_ir,image_vis)
[s1,s2] = size(image_ir);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_ir;
imgSeq(:, :, 2) = image_vis;

image1 = im2double(image_ir);
image2 = im2double(image_vis);
image_fused = im2double(image_f);

%PSNR
PSNR1 = psnr(image_fused,image1);
PSNR2 = psnr(image_fused,image2);
PSNR = (PSNR1+PSNR2)/2;
%EN
EN = entropy(image_fused);
%MI
MI = analysis_MI(image_ir,image_vis,image_f);
%Qabf
Qabf = analysis_Qabf(image1,image2,image_fused);
%FMI
FMI_pixel = analysis_fmi(image1,image2,image_fused);
FMI_dct = analysis_fmi(image1,image2,image_fused,'dct');
FMI_w = analysis_fmi(image1,image2,image_fused,'wavelet');
%Nabf
Nabf = analysis_nabf(image_fused,image1,image2);
%SCD
SCD = analysis_SCD(image1,image2,image_fused);
% SSIM_a
SSIM1 = ssim(image_fused,image1);
SSIM2 = ssim(image_fused,image2);
SSIM = (SSIM1+SSIM2)/2;
%MS_SSIM
% [oQ, Q, qMap]= analysis_ms_ssim(image1, image_f);
MS_SSIM1 = analysis_ms_ssim(image_ir,image_f);
MS_SSIM2 = analysis_ms_ssim(image_vis,image_f);
MS_SSIMS = analysis_ms_ssim(imgSeq,image_f);
MS_SSIMa = (MS_SSIM1+MS_SSIM2)/2;
end







