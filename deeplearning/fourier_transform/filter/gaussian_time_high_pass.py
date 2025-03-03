import cv2
import numpy as np
import matplotlib.pyplot as plt

def generate_gaussian_kernel(size, sigma=1.0):
    """生成二维高斯核
    :param size: 核尺寸（奇数）
    :param sigma: 标准差，控制模糊程度
    :return: 归一化高斯核
    """
    kernel = np.zeros((size, size), dtype=np.float32)
    center = size // 2
    for x in range(size):
        for y in range(size):
            dx = x - center
            dy = y - center
            kernel[x, y] = np.exp(-(dx**2 + dy**2) / (2 * sigma**2))
    return kernel / np.sum(kernel)

def manual_gaussian_highpass(image, kernel_size=5, sigma=1.0):
    """手动高斯高通滤波
    :return: 高通滤波后的图像
    """
    # 生成高斯低通核
    lowpass_kernel = generate_gaussian_kernel(kernel_size, sigma)
    
    # 执行低通滤波
    lowpass = cv2.filter2D(image, -1, lowpass_kernel, borderType=cv2.BORDER_REFLECT)
    
    # 计算高通图像
    highpass = image.astype(np.float32) - lowpass.astype(np.float32)
    highpass = np.clip(highpass + 128, 0, 255)  # 提升亮度便于显示
    return lowpass.astype(np.uint8), highpass.astype(np.uint8)

def opencv_gaussian_highpass(image, sigma=1.0):
    """OpenCV优化实现
    :param sigma: 高斯核标准差
    :return: 高通图像
    """
    lowpass = cv2.GaussianBlur(image, (0,0), sigmaX=sigma)
    highpass = cv2.subtract(image, lowpass)
    return lowpass, highpass + 128

# ========== 主程序 ==========
if __name__ == "__main__":
    # 读取图像并转换为灰度
    img = cv2.imread("lena.png", cv2.IMREAD_GRAYSCALE)
    
    # 参数设置
    KERNEL_SIZE = 15    # 高斯核尺寸（奇数）
    SIGMA = 2.5         # 标准差（控制模糊程度）
    
    # 执行滤波
    manual_lowpass, manual_highpass = manual_gaussian_highpass(img, KERNEL_SIZE, SIGMA)
    opencv_lowpass, opencv_highpass = opencv_gaussian_highpass(img, SIGMA)
    
    # 可视化结果
    plt.figure(figsize=(15, 5))
    
    plt.subplot(141)
    plt.imshow(img, cmap='gray')
    plt.title('Original Image')
    
    plt.subplot(142)
    plt.imshow(manual_lowpass, cmap='gray')
    plt.title(f'Manual Lowpass\nSize={KERNEL_SIZE}, σ={SIGMA}')
    
    plt.subplot(143)
    plt.imshow(manual_highpass, cmap='gray')
    plt.title('Manual Highpass')
    
    plt.subplot(144)
    plt.imshow(opencv_highpass, cmap='gray')
    plt.title('OpenCV Highpass')
    
    plt.tight_layout()
    plt.show()
