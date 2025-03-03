import cv2
import numpy as np
import matplotlib.pyplot as plt

def manual_sobel_edge_detection(img):
    """手动实现 Sobel 边缘检测"""
    # 定义 Sobel 核
    Gx = np.array([[-1, 0, 1],
                   [-2, 0, 2],
                   [-1, 0, 1]], dtype=np.float32)
    
    Gy = np.array([[-1, -2, -1],
                   [ 0,  0,  0],
                   [ 1,  2,  1]], dtype=np.float32)
    
    # 初始化梯度矩阵
    height, width = img.shape
    grad_x = np.zeros_like(img, dtype=np.float32)
    grad_y = np.zeros_like(img, dtype=np.float32)
    
    # 遍历图像（忽略边缘）
    for y in range(1, height-1):
        for x in range(1, width-1):
            # 提取 3x3 邻域
            region = img[y-1:y+2, x-1:x+2]
            
            # 计算梯度
            grad_x[y, x] = np.sum(region * Gx)
            grad_y[y, x] = np.sum(region * Gy)
    
    # 计算梯度幅值（绝对值简化）
    grad = np.abs(grad_x) + np.abs(grad_y)
    
    # 归一化到 0-255
    grad = cv2.normalize(grad, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8)
    return grad

# 读取图像并转为灰度
img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)

# 执行边缘检测
edge_img = manual_sobel_edge_detection(img)

# 绘制结果
plt.figure(figsize=(12, 6))

plt.subplot(121)
plt.imshow(img, cmap='gray')
plt.title('Original Grayscale Image')
plt.axis('off')

plt.subplot(122)
plt.imshow(edge_img, cmap='gray')
plt.title('Sobel Edge Detection (Manual Implementation)')
plt.axis('off')

plt.tight_layout()
plt.show()
