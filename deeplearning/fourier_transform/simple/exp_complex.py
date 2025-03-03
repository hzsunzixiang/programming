import numpy as np
import matplotlib.pyplot as plt

from mpl_toolkits.mplot3d import Axes3D
plt.rcParams['font.sans-serif'] = ['Songti SC']  # macOS 系统自带「宋体」
plt.rcParams['axes.unicode_minus'] = False       # 解决负号显示为方块的问题
# 生成信号
t = np.linspace(0, 4 * np.pi, 1000)  # 时间轴
omega = 2  # 角频率
signal = np.exp(1j * omega * t)      # e^(jωt)

# 提取实部、虚部和时间
real_part = np.real(signal)
imag_part = np.imag(signal)
time = t

# 创建 3D 图
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection='3d')

# 绘制螺旋线
ax.plot(real_part, imag_part, time, 
        label=r'$e^{j\omega t}$', 
        color='blue', linewidth=2)

# 设置坐标轴标签和标题
ax.set_xlabel('实部 (Re)')
ax.set_ylabel('虚部 (Im)')
ax.set_zlabel('时间 (t)')
ax.set_title('复指数信号 $e^{j\\omega t}$ 的三维螺旋线', fontsize=14)
ax.legend()

# 显示图形（拖拽鼠标旋转视图）
plt.show()
