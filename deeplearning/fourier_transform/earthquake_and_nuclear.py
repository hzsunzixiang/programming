import numpy as np
import matplotlib.pyplot as plt

# 参数设置
fs = 1000          # 采样率 (Hz)
duration = 2.0     # 信号时长 (秒)
n_samples = int(fs * duration)
t = np.linspace(0, duration, n_samples)

# 生成地震信号
def generate_earthquake(t):
    main_freq = 30  # 主频30Hz
    signal = 2.0 * np.sin(2 * np.pi * main_freq * t)
    # 低频干扰和噪声
    noise_low = 0.5 * np.sin(2 * np.pi * 5 * t)
    noise_rand = 0.3 * np.random.normal(0, 1, n_samples)
    return signal + noise_low + noise_rand

# 生成核爆信号
def generate_nuclear(t):
    # 主频80Hz + 瞬时高频脉冲（150Hz）
    main_signal = 3.0 * np.sin(2 * np.pi * 80 * t)
    # 高频脉冲（0.1秒处）
    pulse_time = 0.5  # 脉冲发生时间
    pulse = 5.0 * np.exp(-20*(t - pulse_time)**2) * np.sin(2 * np.pi * 150 * t)
    # 指数衰减包络
    envelope = np.exp(-4*(t - pulse_time)) * (t >= pulse_time)
    return (main_signal + pulse) * envelope + 0.2 * np.random.normal(0, 1, n_samples)

# 生成信号
earthquake = generate_earthquake(t)
nuclear = generate_nuclear(t)

# 傅里叶变换
def compute_fft(signal):
    fft_result = np.fft.fft(signal)
    freq = np.fft.fftfreq(n_samples, 1/fs)
    magnitude = np.abs(fft_result)
    return freq, magnitude

freq_eq, mag_eq = compute_fft(earthquake)
freq_nu, mag_nu = compute_fft(nuclear)

# 设置中文字体
plt.rcParams['font.sans-serif'] = ['Songti SC']
plt.rcParams['axes.unicode_minus'] = False

# 绘制时域和频域对比
plt.figure(figsize=(14, 8))

# 时域对比
plt.subplot(2, 1, 1)
plt.plot(t, earthquake, 'b', label='地震信号', alpha=0.8)
plt.plot(t, nuclear, 'r', label='核爆信号', alpha=0.8)
plt.title('时域信号对比', fontsize=14)
plt.xlabel('时间 (秒)', fontsize=12)
plt.ylabel('振幅', fontsize=12)
plt.grid(ls='--', alpha=0.5)
plt.legend()
plt.xlim(0, duration)

# 频域对比
plt.subplot(2, 1, 2)
plt.plot(freq_eq[:n_samples//2], mag_eq[:n_samples//2], 'b', label='地震频谱', alpha=0.8)
plt.plot(freq_nu[:n_samples//2], mag_nu[:n_samples//2], 'r', label='核爆频谱', alpha=0.8)
plt.title('频域分析 (FFT)', fontsize=14)
plt.xlabel('频率 (Hz)', fontsize=12)
plt.ylabel('幅度', fontsize=12)
plt.grid(ls='--', alpha=0.5)
plt.xlim(0, 200)  # 显示0-200Hz
plt.ylim(0, 3000)  # 调整幅度范围
plt.legend()

plt.tight_layout()
plt.savefig('signal_comparison.png', dpi=300)
plt.show()
