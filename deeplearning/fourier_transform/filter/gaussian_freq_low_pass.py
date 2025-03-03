import numpy as np
import cv2
import matplotlib.pyplot as plt

def gaussian_lowpass_filter(image_path, sigma=30):
    """
    高斯低通滤波函数
    :param image_path: 输入图像路径
    :param sigma: 高斯核标准差，控制模糊程度（默认30）
    :return: 滤波后的图像
    """
    # 读取图像并转换为灰度图
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
    
    # 转换为浮点型并进行归一化
    img_float = np.float32(img) / 255.0
    
    # 傅里叶变换
    f = np.fft.fft2(img_float)
    fshift = np.fft.fftshift(f)  # 将低频移动到中心
    
    # 创建高斯滤波器
    rows, cols = img.shape
    crow, ccol = rows//2, cols//2
    x = np.linspace(-ccol, ccol, cols)
    y = np.linspace(-crow, crow, rows)
    X, Y = np.meshgrid(x, y)
    d = np.sqrt(X**2 + Y**2)
    gaussian_filter = np.exp(-(d**2)/(2*sigma**2))
    
    # 应用滤波器
    fshift_filtered = fshift * gaussian_filter
    
    # 逆傅里叶变换
    f_ishift = np.fft.ifftshift(fshift_filtered)
    img_back = np.fft.ifft2(f_ishift)
    img_filtered = np.abs(img_back)
    
    # 转换为0-255范围
    img_filtered = np.uint8(255 * img_filtered / np.max(img_filtered))
    
    return img, img_filtered, gaussian_filter

# 使用示例
if __name__ == "__main__":
    plt.rcParams['font.sans-serif'] = ['Songti SC']  # macOS 系统自带「宋体」
    plt.rcParams['axes.unicode_minus'] = False       # 解决负号显示为方块的问题
        # 输入参数设置
    input_image = "lena.png"  # 替换为你的图片路径
    sigma_value = 40  # 增大该值会增加模糊程度
    
    # 执行滤波
    original, filtered, filter_mask = gaussian_lowpass_filter(input_image, sigma_value)
    
    # 可视化结果
    plt.figure(figsize=(15, 5))
    
    plt.subplot(1, 3, 1)
    plt.imshow(original, cmap='gray')
    plt.title('原始图像')
    plt.axis('off')
    
    plt.subplot(1, 3, 2)
    plt.imshow(filter_mask, cmap='gray')
    plt.title(f'高斯滤波器 (σ={sigma_value})')
    plt.axis('off')
    
    plt.subplot(1, 3, 3)
    plt.imshow(filtered, cmap='gray')
    plt.title('滤波后结果')
    plt.axis('off')
    
    plt.tight_layout()
    plt.show() 
