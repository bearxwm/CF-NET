function [PSNR,SSIM,MS_SSIMS] = pss(image_f,image_ir,image_vis)
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
% SSIM_a
SSIM1 = ssim(image_fused,image1);
SSIM2 = ssim(image_fused,image2);
SSIM = (SSIM1+SSIM2)/2;
%MS_SSIM
MS_SSIMS = analysis_ms_ssim(imgSeq,image_f);
end







