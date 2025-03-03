import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# 生成二维高斯数据
x = np.linspace(-3, 3, 100)
y = np.linspace(-3, 3, 100)
X, Y = np.meshgrid(x, y)
Z = np.exp(-(X**2 + Y**2)/2)  # σ=1的标准高斯分布

# 创建3D画布
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection='3d')

# 绘制曲面图
surface = ax.plot_surface(
    X, Y, Z,
    cmap='viridis',        # 颜色映射方案
    rstride=2,             # 行采样步长
    cstride=2,             # 列采样步长
    linewidth=0.1,         # 网格线宽
    antialiased=True       # 抗锯齿
)

# 添加颜色条和标签
#fig.colorbar(surface, shrink=0.6, label='Intensity')
ax.set_xlabel('X Axis')
ax.set_ylabel('Y Axis')
ax.set_zlabel('Z Value')
ax.set_title('Interactive 3D Gaussian (Click & Drag to Rotate)')

# 激活交互模式
#plt.ion()  # 启用交互式模式
plt.show()

# 保持窗口持续响应操作（命令行模式需额外处理）
#input("Press Enter to exit...")  # 仅限脚本运行，在Jupyter中不需要
