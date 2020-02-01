import time


ir_path = './data/test_ir_20_tno/'
vis_path = './data/test_vis_20_tno/'
out_path = './output/'


def generate(ir_path, vis_path, out_path):
    print('generate activate!')
    from scipy.misc import imread, imsave
    import os
    import model
    from tqdm import trange
    start = time.time()
    # If the test image size is the same, use this method to avoid the long time of buliding model!
    # ae = load_model('./model/ae.h5')
    test_ir_file = os.listdir(ir_path)
    test_vis_file = os.listdir(vis_path)

    for i in trange(20):
        file_name_A = os.path.join(ir_path, test_ir_file[i])
        file_name_B = os.path.join(vis_path, test_vis_file[i])
        image_a = imread(file_name_A)
        image_b = imread(file_name_B)
        image_fusion_a = image_a.reshape(-1, image_a.shape[0], image_a.shape[1], 1)
        image_fusion_b = image_b.reshape(-1, image_a.shape[0], image_a.shape[1], 1)
        ae = model.model(image_a.shape[0], image_a.shape[1])
        ae.load_weights('./model/ae_weight.h5')
        out = ae.predict([image_fusion_a, image_fusion_b])
        im = out.reshape((image_a.shape[0], image_a.shape[1]))
        FUSED_PATH = os.path.join(out_path, 'out%s.png' % (i + 1))
        imsave(FUSED_PATH, im)
    print('TIME%smin' % ((time.time() - start) // 60))


def test():
    print('test activate!')
    all_time = time.time()
    generate(ir_path, vis_path, out_path)
    print('TIME%smin' % ((time.time() - all_time) // 60))


def matlab_only():
    all_time = time.time()
    from matlab_ana.matlab_test import run_matlab_test
    run_matlab_test()
    print('TIME%smin' % ((time.time() - all_time) // 60))
