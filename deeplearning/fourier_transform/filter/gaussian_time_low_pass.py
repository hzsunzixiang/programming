import cv2
import numpy as np
import matplotlib.pyplot as plt

# ========== 核心函数 ==========
def generate_gaussian_kernel(size, sigma=1.0):
    """生成二维高斯核[5,6](@ref)
    :param size: 奇数尺寸 (e.g. 5,7,9)
    :param sigma: 标准差，控制模糊程度
    :return: 归一化高斯核
    """
    kernel = np.zeros((size, size), dtype=np.float32)
    center = size // 2
    
    # 二维高斯函数离散化采样[9](@ref)
    for x in range(size):
        for y in range(size):
            dx = x - center
            dy = y - center
            kernel[x, y] = np.exp(-(dx**2 + dy**2)/(2*sigma**2))
    
    return kernel / np.sum(kernel)  # 归一化保证亮度不变[6](@ref)

def manual_gaussian_blur(image, kernel_size=5, sigma=1.0):
    """手动卷积实现高斯滤波[9](@ref)
    :param image: 输入灰度图像
    :return: 滤波后图像
    """
    kernel = generate_gaussian_kernel(kernel_size, sigma)
    pad = kernel_size // 2
    
    # 边界反射填充[6](@ref)
    padded_img = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REFLECT)
    
    # 卷积计算
    filtered = np.zeros_like(image, dtype=np.float32)
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            region = padded_img[i:i+kernel_size, j:j+kernel_size]
            filtered[i,j] = np.sum(region * kernel)
    
    return filtered.astype(np.uint8)

def opencv_gaussian_blur(image, kernel_size=5, sigma=1.0):
    """OpenCV优化实现[5,10](@ref)
    :param kernel_size: 必须为奇数
    :param sigma: 若设为0则自动计算σ=0.3*((ksize-1)*0.5-1)+0.8
    """
    return cv2.GaussianBlur(image, (kernel_size, kernel_size), sigmaX=sigma)

# ========== 主程序 ==========
if __name__ == "__main__":
    # 读取图像并转换为灰度
    img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)
    
    # 参数设置
    kernel_size = 7    # 滤波器尺寸（建议3-15的奇数）
    sigma = 2.0        # 标准差（推荐0.5-5.0）
    
    # 执行滤波
    manual_result = manual_gaussian_blur(img, kernel_size, sigma)
    opencv_result = opencv_gaussian_blur(img, kernel_size, sigma)
    
    # 可视化对比
    plt.figure(figsize=(15,5))
    
    plt.subplot(1,3,1)
    plt.imshow(img, cmap='gray')
    plt.title('Original Image')
    plt.axis('off')
    
    plt.subplot(1,3,2)
    plt.imshow(manual_result, cmap='gray')
    plt.title(f'Manual Blur\nSize={kernel_size}, σ={sigma}')
    plt.axis('off')
    
    plt.subplot(1,3,3)
    plt.imshow(opencv_result, cmap='gray')
    plt.title('OpenCV Blur')
    plt.axis('off')
    
    plt.tight_layout()
    plt.show()
