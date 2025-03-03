import cv2
import numpy as np
import matplotlib.pyplot as plt

# ========== 均值滤波模块 ==========
def generate_mean_kernel(size):
    """生成均值滤波核[5,7](@ref)
    :param size: 奇数尺寸 (e.g. 3,5,7)
    :return: 均值核矩阵
    """
    return np.ones((size, size)) / (size**2)

def manual_mean_blur(image, kernel_size=5):
    """手动均值滤波实现[5,8](@ref)
    :param image: 输入灰度图像
    :return: 滤波后图像
    """
    kernel = generate_mean_kernel(kernel_size)
    pad = kernel_size // 2
    padded = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REFLECT)
    
    filtered = np.zeros_like(image, dtype=np.float32)
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            region = padded[i:i+kernel_size, j:j+kernel_size]
            filtered[i,j] = np.sum(region * kernel)
    
    return filtered.astype(np.uint8)

def opencv_mean_blur(image, kernel_size=5):
    """OpenCV均值滤波优化实现[7,12](@ref)
    """
    return cv2.blur(image, (kernel_size, kernel_size))

# ========== 高通滤波模块 ==========
def generate_highpass_kernel(mode='laplacian'):
    """生成高通滤波核[9,11](@ref)
    :param mode: 核类型 ['laplacian', 'sobel']
    """
    if mode == 'laplacian':
        return np.array([[0, 1, 0],
                         [1, -4, 1],
                         [0, 1, 0]], dtype=np.float32)
    elif mode == 'sobel':
        return np.array([[-1, -2, -1],
                         [0, 0, 0],
                         [1, 2, 1]], dtype=np.float32)

def manual_highpass(image, kernel_size=3):
    """手动高通滤波[9,11](@ref)
    """
    kernel = generate_highpass_kernel()
    pad = kernel_size // 2
    padded = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REFLECT)
    
    filtered = np.zeros_like(image, dtype=np.float32)
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            region = padded[i:i+kernel_size, j:j+kernel_size]
            filtered[i,j] = np.clip(np.sum(region * kernel), 0, 255)
    
    return filtered.astype(np.uint8)

def mean_based_highpass(image, kernel_size=5):
    """基于均值滤波的高通实现[6,13](@ref)
    (高通 = 原图 - 均值滤波结果)
    """
    lowpass = manual_mean_blur(image, kernel_size)
    return cv2.subtract(image, lowpass)

# ========== 主程序 ==========
if __name__ == "__main__":
    # 读取图像
    img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)
    
    # 参数设置
    KERNEL_SIZE = 5
    SIGMA = 1.5  # 仅用于OpenCV高斯滤波
    
    # 执行滤波
    mean_lowpass = manual_mean_blur(img, KERNEL_SIZE)
    mean_highpass = mean_based_highpass(img, KERNEL_SIZE)
    opencv_highpass = cv2.Laplacian(img, cv2.CV_8U)

    # 可视化对比
    plt.figure(figsize=(15,10))
    
    plt.subplot(2,3,1)
    plt.imshow(img, cmap='gray')
    plt.title('Original Image')
    
    plt.subplot(2,3,2)
    plt.imshow(mean_lowpass, cmap='gray')
    plt.title(f'Mean Lowpass\nSize={KERNEL_SIZE}')
    
    plt.subplot(2,3,3)
    plt.imshow(mean_highpass, cmap='gray')
    plt.title('Mean-based Highpass')
    
    plt.subplot(2,3,4)
    plt.imshow(manual_highpass(img), cmap='gray')
    plt.title('Manual Laplacian')
    
    plt.subplot(2,3,5)
    plt.imshow(opencv_highpass, cmap='gray')
    plt.title('OpenCV Laplacian')
    
    plt.tight_layout()
    plt.show()
