import numpy as np
import matplotlib.pyplot as plt

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

# 傅里叶变换
fft_result = np.fft.fft(combined_signal)
freq = np.fft.fftfreq(n_samples, 1/fs)
magnitude = np.abs(fft_result)

# 设置中文和样式（使用内置样式）
plt.rcParams.update({
    'font.size': 12,
    'font.family': 'Songti SC',
    'axes.unicode_minus': False
})
plt.style.use('ggplot')  # 改用内置样式，如 'seaborn'、'classic' 等

# 绘图代码（保持原样）
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 10), gridspec_kw={'height_ratios': [1, 1]})

# 时域图
ax1.plot(t, combined_signal, color='#4B0082', linewidth=1.5, label='叠加信号')
ax1.axvspan(0.4, 0.8, color='red', alpha=0.1, label='核爆特征区间')
ax1.set_title('时域信号：地震波与核爆波叠加', fontsize=14, pad=15)
ax1.set_xlabel('时间 (秒)', fontsize=12, labelpad=10)
ax1.set_ylabel('振幅', fontsize=12, labelpad=10)
ax1.grid(True, linestyle='--', alpha=0.6)
ax1.set_xlim(0, duration)
ax1.legend(loc='upper right')

# 频域图
ax2.plot(freq[:n_samples//2], magnitude[:n_samples//2], color='#008080', linewidth=1.8, label='混合频谱')
annotations = [
    (30, '地震主频', '#00008B'),
    (80, '核爆主频', '#8B0000'), 
    (150, '核爆高频脉冲', '#FF4500')
]
for freq_val, text, color in annotations:
    idx = np.argmin(np.abs(freq[:n_samples//2] - freq_val))
    ax2.annotate(text, 
                xy=(freq_val, magnitude[idx]),
                xytext=(freq_val+20, magnitude[idx]*0.8),
                arrowprops=dict(arrowstyle="->", color=color, linewidth=1.5),
                fontsize=12, color=color)
ax2.set_title('频域特征分析', fontsize=14, pad=15)
ax2.set_xlabel('频率 (Hz)', fontsize=12, labelpad=10)
ax2.set_ylabel('能量密度', fontsize=12, labelpad=10)
ax2.grid(True, linestyle='--', alpha=0.6)
ax2.set_xlim(0, 200)
ax2.set_ylim(0, 1.2*np.max(magnitude[:n_samples//2]))
ax2.legend(loc='upper right')

plt.tight_layout()
plt.savefig('combined_signal_analysis_pro.png', dpi=300, bbox_inches='tight')
plt.show()
