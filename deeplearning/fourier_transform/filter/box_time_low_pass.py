import cv2
import numpy as np
import matplotlib.pyplot as plt
import time

def manual_box_filter(image, kernel_size=3):
    """
    手动实现盒式滤波（均值滤波）
    :param image: 输入灰度图像矩阵 (H, W)
    :param kernel_size: 滤波器尺寸（奇数）
    :return: 滤波后图像 (uint8)
    """
    # 参数校验
    if kernel_size % 2 == 0:
        raise ValueError("Kernel size must be odd number")
    if len(image.shape) != 2:
        raise ValueError("Input image must be grayscale")
    
    # 初始化参数
    pad = kernel_size // 2
    h, w = image.shape
    filtered = np.zeros((h, w), dtype=np.float32)
    
    # 边界反射填充
    padded = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REFLECT)
    
    # 手动卷积操作
    for i in range(h):
        for j in range(w):
            # 获取当前像素的邻域
            region = padded[i:i+kernel_size, j:j+kernel_size]
            # 计算均值
            filtered[i, j] = np.mean(region)
    
    # 转换回uint8类型
    return np.clip(filtered, 0, 255).astype(np.uint8)

# 主程序
if __name__ == "__main__":
    # 读取图像
    img_path = "lena.png"
    try:
        img = cv2.imread(img_path, cv2.IMREAD_GRAYSCALE)
        if img is None:
            raise FileNotFoundError
    except Exception as e:
        print(f"Error loading image: {e}")
        exit()

    # 设置滤波器参数
    KERNEL_SIZE = 7  # 可修改为3,5,9等奇数

    # 手动滤波
    start_time = time.time()
    manual_blurred = manual_box_filter(img, KERNEL_SIZE)
    manual_time = time.time() - start_time

    # OpenCV内置函数
    start_time = time.time()
    opencv_blurred = cv2.blur(img, (KERNEL_SIZE, KERNEL_SIZE))
    opencv_time = time.time() - start_time

    # 结果对比
    plt.figure(figsize=(15,5))
    
    plt.subplot(1,3,1)
    plt.imshow(img, cmap='gray')
    plt.title(f'Original Image\nSize: {img.shape}')
    plt.axis('off')
    
    plt.subplot(1,3,2)
    plt.imshow(manual_blurred, cmap='gray')
    plt.title(f'Manual Filter\nSize={KERNEL_SIZE}x{KERNEL_SIZE}\nTime: {manual_time:.4f}s')
    plt.axis('off')
    
    plt.subplot(1,3,3)
    plt.imshow(opencv_blurred, cmap='gray')
    plt.title(f'OpenCV Filter\nTime: {opencv_time:.4f}s')
    plt.axis('off')

    plt.tight_layout()
    
    # 保存结果
    cv2.imwrite('lena_manual_blur.png', manual_blurred)
    cv2.imwrite('lena_opencv_blur.png', opencv_blurred)
    plt.show()
