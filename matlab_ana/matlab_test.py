import matlab.engine as matlab
import time


def matlab_test():
    eng = matlab.start_matlab()
    print('*-------------------------------------------------------------------*')
    print('| MatLab全面检查中...')
    start = time.time()
    ret = eng.python_main_test(nargout=12)
    EN, MI, Qabf, FMI_pixel, FMI_dct, FMI_w, Nabf, SCD, PSNR, SSIM, MS_SSIMS, MS_SSIMa = ret
    print('|TIME%s' % ((time.time() - start) // 60))
    print("| EN ------- =", format(EN, '6.5f'))
    print("| MI ------- =", format(MI, '6.5f'))
    print("| Qabf ----- =", format(Qabf, '6.5f'))
    print("| FMI_pixel- =", format(FMI_pixel, '6.5f'))
    print("| FMI_dct -- =", format(FMI_dct, '6.5f'))
    print("| FMI_w ---- =", format(FMI_w, '6.5f'))
    print("| Nabf ----- =", format(Nabf, '6.5f'))
    print("| SCD ------ =", format(SCD, '6.5f'))
    print("| PSNR ----- =", format(PSNR, '6.5f'))
    print("| SSIM ----- =", format(SSIM, '6.5f'), '----0.73259--best')
    print("| MS_SSIMS - =", format(MS_SSIMS, '6.5f'), '----0.93353--best')
    print("| MS_SSIMa - =", format(MS_SSIMa, '6.5f'))
    print('| DONE')
    print('*-------------------------------------------------------------------*')
    eng.quit()


def run_matlab_test():
    matlab_test()
