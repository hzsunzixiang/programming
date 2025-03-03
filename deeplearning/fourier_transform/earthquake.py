import numpy as np
import matplotlib.pyplot as plt

# 参数设置
fs = 1000          # 采样率 (Hz)
duration = 2.0     # 信号时长 (秒)
n_samples = int(fs * duration)
t = np.linspace(0, duration, n_samples)  # 时间轴

# 生成地震信号（正弦波叠加噪声）
def generate_seismic_signal(t):
    # 主频成分
    main_freq = 30  # 主频30Hz
    signal = 2.0 * np.sin(2 * np.pi * main_freq * t)  # 主信号
    
    # 添加谐波和干扰
    harmonic = 0.5 * np.sin(2 * np.pi * 60 * t)      # 60Hz谐波
    noise_low = 0.8 * np.sin(2 * np.pi * 5 * t)      # 5Hz低频干扰
    noise_rand = 0.3 * np.random.normal(0, 1, n_samples)  # 随机噪声
    
    return signal + harmonic + noise_low + noise_rand

signal = generate_seismic_signal(t)

# 傅里叶变换
fft_result = np.fft.fft(signal)            # 快速傅里叶变换
freq = np.fft.fftfreq(n_samples, 1/fs)     # 频率轴
magnitude = np.abs(fft_result)             # 幅度谱

# 动态设置中文字体（macOS）
plt.rcParams['font.sans-serif'] = ['Songti SC']  # 或 'Arial Unicode MS'
plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题

# 创建画布
plt.figure(figsize=(12, 6))

# 时域子图
plt.subplot(2, 1, 1)
plt.plot(t, signal, 'b', linewidth=1, alpha=0.8)
plt.title('地震信号时域波形', fontsize=12)
plt.xlabel('时间 (秒)', fontsize=10)
plt.ylabel('振幅', fontsize=10)
plt.grid(True, linestyle='--', alpha=0.5)
plt.xlim(0, duration)

# 频域子图
plt.subplot(2, 1, 2)
positive_freq = freq[:n_samples//2]       # 取正频率部分
positive_mag = magnitude[:n_samples//2]
plt.plot(positive_freq, positive_mag, 'r', linewidth=1, alpha=0.8)
plt.title('频域分析 (FFT)', fontsize=12)
plt.xlabel('频率 (Hz)', fontsize=10)
plt.ylabel('幅度', fontsize=10)
plt.grid(True, linestyle='--', alpha=0.5)
plt.xlim(0, 100)  # 显示0-100Hz范围

plt.tight_layout()
plt.savefig('seismic_analysis.png', dpi=300)
plt.show()
