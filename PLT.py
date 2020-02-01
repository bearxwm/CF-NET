import matplotlib.pyplot as plt
from keras.utils.vis_utils import plot_model
import model


###############----------网络显示函数----------##############
def shownetworks(model, MODEL_IMAGE_PATH):
    plot_model(model, to_file=MODEL_IMAGE_PATH, show_shapes=True, show_layer_names=True, rankdir='TB')
    plt.figure(figsize=(10, 10))
    img = plt.imread(MODEL_IMAGE_PATH)
    plt.imshow(img)
    plt.axis('off')
    plt.show()


def show_me_your_net():
    ae, anaout, autoencoder = model.model(250, 233)
    shownetworks(ae, './networks_imgaes/ae.png')
    shownetworks(autoencoder, './networks_imgaes/AUTOENCODER.png')
    autoencoder.summary()


show_me_your_net()