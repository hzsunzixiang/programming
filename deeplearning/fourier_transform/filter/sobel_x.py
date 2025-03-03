import cv2
import numpy as np
import matplotlib.pyplot as plt

def manual_convolution(img, kernel):
    """手动实现卷积操作"""
    h, w = img.shape
    k_size = kernel.shape[0]
    pad = k_size // 2
    
    # 初始化输出矩阵
    output = np.zeros_like(img, dtype=np.float32)
    
    # 遍历图像（忽略边缘）
    for y in range(pad, h-pad):
        for x in range(pad, w-pad):
            # 提取当前邻域
            region = img[y-pad:y+pad+1, x-pad:x+pad+1]
            # 计算卷积结果
            output[y, x] = np.sum(region * kernel)
    
    return output

# 读取图像并灰度化
img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)

# 定义Gx核
Gx = np.array([[-1, 0, 1],
              [-2, 0, 2],
              [-1, 0, 1]], dtype=np.float32)

# 执行卷积运算
grad_x = manual_convolution(img.astype(np.float32), Gx)

# 后处理
grad_abs = np.abs(grad_x)  # 取绝对值
grad_norm = cv2.normalize(grad_abs, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8)

# 可视化
plt.figure(figsize=(12, 6))

plt.subplot(131)
plt.imshow(img, cmap='gray')
plt.title('Original Image', fontsize=10)
plt.axis('off')

plt.subplot(132)
plt.imshow(grad_abs, cmap='gray')
plt.title('Vertical Edge Response (Raw)', fontsize=10)
plt.axis('off')

plt.subplot(133)
plt.imshow(grad_norm, cmap='gray')
plt.title('Normalized Edge Map', fontsize=10)
plt.axis('off')

plt.tight_layout()
plt.show()
