import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def sinc_2d(x, y):
    """二维sinc函数实现"""
    r = np.sqrt(x**2 + y**2)
    return np.where(r == 0, 1.0, np.sin(r)/r)


x = np.linspace(-10, 10, 200)
y = np.linspace(-10, 10, 200)
X, Y = np.meshgrid(x, y)
Z = sinc_2d(X, Y)

fig = plt.figure(figsize=(12, 8))
ax = fig.add_subplot(111, projection='3d')

surf = ax.plot_surface(
    X, Y, Z,
    cmap='viridis',        # 使用感知均匀的色图
    rstride=3,             # 行采样间隔
    cstride=3,             # 列采样间隔
    linewidth=0.1,         # 网格线宽
    antialiased=True,      # 抗锯齿
    edgecolor='#404040'    # 网格线颜色
)

# 添加颜色条
cbar = fig.colorbar(surf, shrink=0.6, aspect=10)
cbar.set_label('Function Value', rotation=270, labelpad=15)

# 设置视角与标签
ax.view_init(elev=30, azim=45)
ax.set_xlabel('X Axis', fontsize=12)
ax.set_ylabel('Y Axis', fontsize=12)
ax.set_zlabel('Z Value', fontsize=12)
ax.set_title('2D Sinc Function Surface', fontsize=14, pad=20)

plt.tight_layout()
plt.show()
