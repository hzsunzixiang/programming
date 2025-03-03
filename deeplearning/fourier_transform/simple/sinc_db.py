import numpy as np
import matplotlib.pyplot as plt

# 定义归一化sinc函数
def normalized_sinc(x):
    x = np.asarray(x)
    y = np.ones_like(x)
    non_zero = x != 0
    y[non_zero] = np.sin(np.pi * x[non_zero]) / (np.pi * x[non_zero])
    return y

# 生成数据
x = np.linspace(-5*np.pi, 5*np.pi, 2001)  # 覆盖5个周期
sinc_values = normalized_sinc(x)
epsilon = 1e-10  # 避免log(0)的极小值
db_values = 20 * np.log10(np.abs(sinc_values) + epsilon)

# 可视化设置
plt.figure(figsize=(12, 6), dpi=100)

# 绘制线性幅度图
plt.subplot(121)
plt.plot(x, sinc_values, color='#1f77b4', linewidth=2)
plt.title('Normalized Sinc Function\n(Linear Scale)', fontsize=10, pad=10)
plt.xlabel('x (radians)', fontsize=9)
plt.ylabel('Amplitude', fontsize=9)
plt.grid(True, linestyle='--', alpha=0.7)
plt.ylim(-0.3, 1.1)

# 绘制分贝特性图
plt.subplot(122)
plt.plot(x, db_values, color='#ff7f0e', linewidth=2)
plt.title('Sinc Function in Decibel Scale', fontsize=10, pad=10)
plt.xlabel('x (radians)', fontsize=9)
plt.ylabel('Magnitude (dB)', fontsize=9)
plt.grid(True, which='both', linestyle='--', alpha=0.7)
plt.ylim(-60, 5)  # 限制显示范围以突出主瓣特征

plt.tight_layout(pad=2.0)
plt.show()
