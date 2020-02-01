
clear;
clc;
fileName_source_ir  = ['C:\XWM\Workplace\Pycharm\keras1\fushion_im\image_fusion_a.png'];
fileName_source_vis = ['C:\XWM\Workplace\Pycharm\keras1\fushion_im\image_fusion_b.png'];
fileName_fused      = ['C:\XWM\Workplace\Pycharm\keras1\fused_images\out.png'];

source_image1 = imread(fileName_source_ir);
source_image2 = imread(fileName_source_vis);
fused_image   = imread(fileName_fused);
% fused_image(:,:)=fliplr(fused_image(:,:));

disp("Start");
disp('---------------------------Analysis---------------------------');
[EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,SSIM,MS_SSIMS,MS_SSIMa] = analysis_Reference(fused_image,source_image1,source_image2);
% [SSIM,MS_SSIMS,MS_SSIMa,MS_SSIM1,MS_SSIM2] = analysis_Reference(fused_image,source_image1,source_image2);
disp('Done');
fprintf("MAX=6.85---EN      = %6.5f\n",EN)
fprintf("MAX=0.28---Qabf    = %6.5f\n",Qabf)
fprintf("MAX=1.85---SCD     = %6.5f\n",SCD)
fprintf("MAX=0.42---FMI_w   = %6.5f\n",FMI_w)
fprintf("MAX=0.42---FMI_dct = %6.5f\n",FMI_dct)
fprintf("MAX=0.73---SSIM    = %6.5f\n",SSIM)
fprintf("MAX=0.93---MS_SSIM-S = %6.5f\n",MS_SSIMS)
fprintf("MAX=0.93---MS_SSIM/2 = %6.5f\n",MS_SSIMa)