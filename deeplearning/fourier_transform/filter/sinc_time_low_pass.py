import numpy as np
import cv2
import matplotlib.pyplot as plt

def generate_sinc_kernel(cutoff_freq=0.1, kernel_size=15):
    """
    生成截断并加窗的sinc低通滤波器核
    :param cutoff_freq: 截止频率 (0~0.5, 对应Nyquist频率)
    :param kernel_size: 滤波器尺寸（自动调整为奇数）
    :return: 归一化的滤波器核
    """
    # 强制核尺寸为奇数
    kernel_size = kernel_size if kernel_size % 2 else kernel_size + 1
    
    # 生成时间轴（中心对称，包含kernel_size个点）
    t = np.linspace(-kernel_size//2, kernel_size//2, kernel_size)
    t = np.where(t == 0, 1e-6, t)  # 避免除以0
    
    # 计算sinc函数
    sinc = np.sin(2 * np.pi * cutoff_freq * t) / (np.pi * t)
    
    # 加汉明窗减少振铃效应
    window = np.hamming(kernel_size)
    kernel = sinc * window
    
    # 归一化
    return kernel / np.sum(kernel)

def sinc_lowpass_filter(image, cutoff_freq=0.1, kernel_size=15):
    """
    sinc低通滤波
    :param image: 输入灰度图像
    :return: 滤波后图像
    """
    # 生成滤波器核（自动调整尺寸为奇数）
    kernel = generate_sinc_kernel(cutoff_freq, kernel_size)
    
    # 转换为二维可分离核
    kernel_2d = np.outer(kernel, kernel)
    
    # 边界反射填充
    pad = len(kernel) // 2
    padded = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REFLECT)
    
    # 卷积运算（可分离优化）
    row_filtered = cv2.filter2D(padded, -1, kernel)
    filtered = cv2.filter2D(row_filtered, -1, kernel.reshape(-1,1))
    
    # 裁剪有效区域
    return np.clip(filtered[pad:-pad, pad:-pad], 0, 255).astype(np.uint8)

# ========== 主程序 ==========
if __name__ == "__main__":
    # 读取图像
    img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)
    
    # 参数设置
    CUTOFF_FREQ = 0.1   # 截止频率 (0.05~0.4)
    KERNEL_SIZE = 22     # 输入任意尺寸（代码自动调整为23）
    
    # 执行滤波
    filtered = sinc_lowpass_filter(img, CUTOFF_FREQ, KERNEL_SIZE)
    
    # 可视化
    plt.figure(figsize=(12,5))
    
    # 绘制滤波器核
    kernel = generate_sinc_kernel(CUTOFF_FREQ, KERNEL_SIZE)
    plt.subplot(131)
    plt.plot(kernel)
    plt.title(f'Sinc Kernel (Size={len(kernel)}, Fc={CUTOFF_FREQ})')
    plt.grid(True)
    
    # 原始图像
    plt.subplot(132)
    plt.imshow(img, cmap='gray')
    plt.title('Original Image')
    
    # 滤波结果
    plt.subplot(133)
    plt.imshow(filtered, cmap='gray')
    plt.title('Filtered Image')
    
    plt.tight_layout()
    plt.show()
