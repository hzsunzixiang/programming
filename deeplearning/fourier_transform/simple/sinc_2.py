import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def sinc_2d(x, y):
    """二维sinc函数实现"""
    r = np.sqrt(x**2 + y**2)
    return np.where(r == 0, 1.0, np.sin(r)/r)  # 原点特殊处理[6](@ref)


x = np.linspace(-15, 15, 300)  # 扩大范围以观察衰减特性[5](@ref)
y = np.linspace(-15, 15, 300)
X, Y = np.meshgrid(x, y)
Z = sinc_2d(X, Y)

fig = plt.figure(figsize=(14, 10))
ax = fig.add_subplot(111, projection='3d')

surf = ax.plot_surface(
    X, Y, Z,
    cmap='viridis',        # 感知均匀的色图[5](@ref)
    rstride=3,             # 行采样间隔优化性能[6](@ref)
    cstride=3,
    linewidth=0.2,         # 细网格线增强立体感
    antialiased=True,      # 抗锯齿处理[6](@ref)
    edgecolor='#404040'    # 深灰色网格线
)

# 添加颜色条
cbar = fig.colorbar(surf, shrink=0.6, aspect=10)
cbar.set_label('Function Value', rotation=270, labelpad=20)

# 设置视角与标签
ax.view_init(elev=25, azim=45)  # 最佳观察角度[5](@ref)
ax.set_xlabel('X Axis', fontsize=12, labelpad=12)
ax.set_ylabel('Y Axis', fontsize=12, labelpad=12)
ax.set_zlabel('Z Value', fontsize=12, labelpad=12)
ax.set_title('2D Sinc Function: sin(r)/r', fontsize=16, pad=20)

# 开启交互模式
#plt.ion()
plt.show()
