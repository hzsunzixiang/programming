import cv2
import numpy as np
import matplotlib.pyplot as plt

def gaussian_highpass_filter(image, sigma=30):
    """频域高斯高通滤波
    :param sigma: 截止频率控制参数
    :return: 滤波后图像
    """
    # 转换为浮点型并归一化
    img_float = np.float32(image) / 255.0

    # 傅里叶变换
    fft = np.fft.fft2(img_float)
    fshift = np.fft.fftshift(fft)

    # 生成高斯高通滤波器
    rows, cols = image.shape
    crow, ccol = rows//2, cols//2
    x = np.linspace(-ccol, ccol, cols)
    y = np.linspace(-crow, crow, rows)
    X, Y = np.meshgrid(x, y)
    D = np.sqrt(X**2 + Y**2)
    H = 1 - np.exp(-(D**2)/(2*sigma**2))

    # 应用滤波器
    fshift_filtered = fshift * H

    # 逆傅里叶变换
    f_ishift = np.fft.ifftshift(fshift_filtered)
    img_back = np.fft.ifft2(f_ishift)
    filtered = np.abs(img_back)

    # 转换为0-255范围
    return np.uint8(255 * filtered / np.max(filtered)), H

# ========== 主程序 ==========
if __name__ == "__main__":
    # 读取图像并转换为灰度
    img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)
    
    # 参数设置
    SIGMA = 10  # 增大该值会保留更多低频成分（减弱高通效果）
    
    # 执行滤波
    filtered_img, H = gaussian_highpass_filter(img, SIGMA)
    
    # 可视化
    plt.figure(figsize=(15,5))
    
    plt.subplot(131)
    plt.imshow(img, cmap='gray')
    plt.title('Original Image')
    
    plt.subplot(132)
    plt.imshow(H, cmap='jet')
    plt.title(f'Gaussian Highpass Filter\nσ={SIGMA}')
    plt.colorbar()
    
    plt.subplot(133)
    plt.imshow(filtered_img, cmap='gray')
    plt.title('Filtered Result')
    
    plt.tight_layout()
    plt.show()
