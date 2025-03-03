import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def visualize_frequency_response(kernel_size=15):
    """可视化均值滤波器的频域响应波形
    :param kernel_size: 滤波器尺寸（奇数）
    """
    # 生成均值滤波核
    kernel = np.ones((kernel_size, kernel_size)) / (kernel_size**2)
    
    # 傅里叶变换
    fft = np.fft.fft2(kernel)
    fft_shift = np.fft.fftshift(fft)
    magnitude = np.abs(fft_shift)
    
    # 创建频率坐标网格
    freq = np.linspace(-np.pi, np.pi, kernel_size)
    X, Y = np.meshgrid(freq, freq)
    
    # ========== 三维波形可视化 ==========
    fig = plt.figure(figsize=(18, 6))
    
    # 三维曲面图
    ax1 = fig.add_subplot(131, projection='3d')
    surf = ax1.plot_surface(X, Y, magnitude, cmap='viridis', rstride=1, cstride=1)
    ax1.set_title(f'3D 频域响应 (Size={kernel_size})')
    ax1.set_xlabel('X Frequency (rad)')
    ax1.set_ylabel('Y Frequency (rad)')
    ax1.set_zlabel('Magnitude')
    fig.colorbar(surf, ax=ax1, shrink=0.5)
    
    # ========== 二维波形切片 ==========
    ax2 = fig.add_subplot(132)
    ax2.plot(freq, magnitude[kernel_size//2, :], 'r-', label='水平切片')
    ax2.plot(freq, magnitude[:, kernel_size//2], 'b--', label='垂直切片')
    ax2.set_title('中心频率切片')
    ax2.set_xlabel('Frequency (rad)')
    ax2.set_ylabel('Magnitude')
    ax2.legend()
    ax2.grid(True)
    
    # ========== 极坐标波形修复版 ==========
    ax3 = fig.add_subplot(133, projection='polar')
    
    # 生成半径序列（0到π）
    radii = np.linspace(0, np.pi, kernel_size//2 + 1)
    
    # 计算径向平均幅度
    radial_profile = []
    for r in radii[1:]:  # 跳过0点
        mask = (np.hypot(X, Y) <= r) & (np.hypot(X, Y) > r - np.pi/(kernel_size//2))
        radial_profile.append(np.mean(magnitude[mask]))
    
    # 生成角度序列（与数据点数量匹配）
    theta = np.linspace(0, 2*np.pi, len(radial_profile)+1)[:-1]  # 移除最后一个重复点
    
    # 闭合曲线
    theta = np.append(theta, theta[0])
    radial_profile = np.append(radial_profile, radial_profile[0])
    
    ax3.plot(theta, radial_profile, lw=2)
    ax3.set_title('径向幅度分布', pad=20)
    ax3.grid(True)
    
    plt.tight_layout()
    plt.show()

# 执行可视化（可测试不同尺寸）
if __name__ == "__main__":
    plt.rcParams['font.sans-serif'] = ['Songti SC']  # macOS 系统自带「宋体」
    plt.rcParams['axes.unicode_minus'] = False       # 解决负号显示为方块的问题
    visualize_frequency_response(kernel_size=5)  # 有效尺寸：5,7,9,...25
