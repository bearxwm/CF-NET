function[EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,PSNR,SSIM,MS_SSIMS,MS_SSIMa]=python_main_test()
addpath(genpath(pwd));
EN_A = [];
MI_A = [];
Qabf_A = [];
FMI_pixel_A =[];
FMI_dct_A = [];
FMI_w_A = [];
Nabf_A = [];
SCD_A = [];
SSIM_A = [];
MS_SSIMS_A = [];
MS_SSIMa_A = [];
PSNR_A = [];
parfor i=1:20
    fileName_source_ir  = ['D:\XWM\Workplace\testhose\contrast_images_20\','ir' ,num2str(i), '.png'];
    fileName_source_vis = ['D:\XWM\Workplace\testhose\contrast_images_20\','vis' ,num2str(i), '.png'];
    fileName_fused      = ['D:\XWM\Workplace\testhose\fused_images_20\','out',num2str(i),'.png'];
    source_image1 = imread(fileName_source_ir);
    source_image2 = imread(fileName_source_vis);
    fused_image   = imread(fileName_fused);
    [EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,PSNR,SSIM,MS_SSIMS,MS_SSIMa] = analysis_Reference(fused_image,source_image1,source_image2);
    EN_A = [EN_A,EN];
    MI_A = [MI_A,MI];
    Qabf_A = [Qabf_A,Qabf];
    FMI_pixel_A =[FMI_pixel_A,FMI_pixel];
    FMI_dct_A = [FMI_dct_A,FMI_dct];
    FMI_w_A = [FMI_w_A,FMI_w];
    Nabf_A = [Nabf_A,Nabf];
    SCD_A = [SCD_A,SCD];
    PSNR_A= [PSNR_A,PSNR];
    SSIM_A = [SSIM_A,SSIM];
    MS_SSIMS_A = [MS_SSIMS_A,MS_SSIMS];
    MS_SSIMa_A = [MS_SSIMa_A,MS_SSIMa];
end
EN = mean(EN_A);
MI = mean(MI_A);
Qabf = mean(Qabf_A);
FMI_pixel =mean(FMI_pixel_A);
FMI_dct = mean(FMI_dct_A);
FMI_w = mean(FMI_w_A);
Nabf = mean(Nabf_A);
SCD = mean(SCD_A);
PSNR = mean(PSNR_A);
SSIM = mean(SSIM_A);
MS_SSIMS = mean(MS_SSIMS_A);
MS_SSIMa = mean(MS_SSIMa_A);

% 
% [EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,SSIM,MS_SSIMS,MS_SSIMa] = python_main_test();
% fprintf("MAX=6.85---EN      = %6.5f\n",EN)
% fprintf("MAX=0.28---Qabf    = %6.5f\n",Qabf)
% fprintf("MAX=1.85---SCD     = %6.5f\n",SCD)
% fprintf("MAX=0.42---FMI_w   = %6.5f\n",FMI_w)
% fprintf("MAX=0.42---FMI_dct = %6.5f\n",FMI_dct)
% fprintf("MAX=0.73---SSIM    = %6.5f\n",SSIM)
% fprintf("MAX=0.93---MS_SSIM-S = %6.5f\n",MS_SSIMS)
% fprintf("MAX=0.93---MS_SSIM/2 = %6.5f\n",MS_SSIMa)