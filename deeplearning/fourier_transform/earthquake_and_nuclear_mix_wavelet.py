import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import pywt

# 参数设置
fs = 1000
duration = 2.0
n_samples = int(fs * duration)
t = np.linspace(0, duration, n_samples)

# 生成地震信号
def generate_earthquake(t):
    main_freq = 30
    signal = 2.0 * np.sin(2 * np.pi * main_freq * t)
    reflection = 0.6 * np.sin(2 * np.pi * 28 * (t - 0.8)) * np.exp(-3*(t - 0.8)) * (t >= 0.8)
    noise = 0.3 * (np.random.normal(0, 1, len(t)) + 0.5 * np.sin(2 * np.pi * 5 * t))
    return signal + reflection + noise

# 生成核爆信号
def generate_nuclear(t):
    main_pulse = 4.0 * np.exp(-40*(t - 0.5)**2) * np.sin(2 * np.pi * 80 * t)
    high_freq_pulse = 2.5 * np.exp(-60*(t - 0.7)**2) * np.sin(2 * np.pi * 150 * t)
    radiation_noise = 0.4 * np.random.normal(0, 1, len(t)) * np.exp(-2*t)
    return main_pulse + high_freq_pulse + radiation_noise

# 生成叠加信号
combined_signal = generate_earthquake(t) + generate_nuclear(t)

# 小波变换参数
wavelet_name = 'morl'
scales = np.arange(1, 200)
sampling_period = 1/fs

# 执行连续小波变换
coefficients, frequencies = pywt.cwt(combined_signal, scales, wavelet_name, sampling_period=sampling_period)

# 转换为能量密度（已修复行）
power = (np.abs(coefficients)) * 2

# 设置中文
plt.rcParams['font.sans-serif'] = ['Songti SC']
plt.rcParams['axes.unicode_minus'] = False

# 创建3D画布
fig = plt.figure(figsize=(14, 8))
ax = fig.add_subplot(111, projection='3d')

# 生成网格数据
X, Y = np.meshgrid(t, frequencies)
surf = ax.plot_surface(X, Y, power, cmap='jet', rstride=5, cstride=5, alpha=0.8)

# 设置坐标轴
ax.set_xlabel('时间 (秒)', fontsize=12, labelpad=15)
ax.set_ylabel('频率 (Hz)', fontsize=12, labelpad=15)
ax.set_zlabel('能量密度', fontsize=12, labelpad=15)
ax.set_title('时频能量分布 (Morlet小波变换)', fontsize=14, pad=20)

# 调整视角
ax.view_init(elev=45, azim=-45)

# 颜色条
cbar = fig.colorbar(surf, shrink=0.5, aspect=10)
cbar.set_label('能量强度', fontsize=12)

plt.tight_layout()
plt.savefig('wavelet_3d.png', dpi=300, bbox_inches='tight')
plt.show()
