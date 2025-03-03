import cv2
import numpy as np
import matplotlib.pyplot as plt

def vertical_edge_detection(img):
    """Gy核垂直边缘检测优化实现"""
    # 定义Gy核
    Gy = np.array([[-1, -2, -1],
                  [ 0,  0,  0],
                  [ 1,  2,  1]], dtype=np.float32)
    
    # 预处理：高斯滤波降噪（σ=1.5）
    blurred = cv2.GaussianBlur(img, (5,5), 1.5)
    
    # 手动卷积优化（向量化运算）
    h, w = blurred.shape
    grad_y = np.zeros_like(blurred, dtype=np.float32)
    
    # 仅遍历有效区域
    for y in range(1, h-1):
        # 批量提取三行数据
        upper = blurred[y-1, :].astype(np.float32)
        middle = blurred[y, :].astype(np.float32)
        lower = blurred[y+1, :].astype(np.float32)
        
        # 计算当前行梯度（向量化运算）
        grad_row = (-1*upper) + (-2*upper) + (-1*upper) + \
                   (1*lower) + (2*lower) + (1*lower)
        
        # 中间列处理（避免越界）
        grad_y[y, 1:-1] = grad_row[0:-2] + grad_row[1:-1] + grad_row[2:]
    
    # 后处理
    grad_abs = np.abs(grad_y)  # 保留边缘强度
    grad_norm = cv2.normalize(grad_abs, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8)
    
    return grad_abs, grad_norm

plt.rcParams['font.sans-serif'] = ['Songti SC']  # macOS 系统自带「宋体」
plt.rcParams['axes.unicode_minus'] = False       # 解决负号显示为方块的问题
# 读取图像
img = cv2.imread('lena.png', cv2.IMREAD_GRAYSCALE)

# 执行检测
raw_grad, final_edge = vertical_edge_detection(img)

# 可视化
plt.figure(figsize=(14, 6), dpi=100)

plt.subplot(131)
plt.imshow(img, cmap='gray')
plt.title('原始灰度图像\n(Original Grayscale)', fontsize=9, pad=5)
plt.axis('off')

plt.subplot(132)
plt.imshow(raw_grad, cmap='gray', vmax=raw_grad.max()*0.8)  # 增强对比度
plt.title('垂直梯度响应原始数据\n(Raw Vertical Gradient)', fontsize=9, pad=5)
plt.axis('off')

plt.subplot(133)
plt.imshow(final_edge, cmap='gray')
plt.title('归一化边缘图\n(Normalized Edge Map)', fontsize=9, pad=5)
plt.axis('off')

plt.tight_layout(pad=1.5)
plt.savefig('vertical_edge_detection.png', bbox_inches='tight')
plt.show()
