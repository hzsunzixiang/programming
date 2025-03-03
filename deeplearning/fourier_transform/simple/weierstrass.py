import numpy as np
import matplotlib.pyplot as plt

def weierstrass(x, a=0.5, b=7, n_terms=200):
    """计算魏尔斯特拉斯函数值"""
    return np.sum([a**n * np.cos(b**n * np.pi * x) for n in range(n_terms)], axis=0)

# 生成数据
x = np.linspace(-2, 2, 5000)
y = weierstrass(x)

# 绘图
plt.figure(figsize=(10, 6))
plt.plot(x, y, color='darkorange', linewidth=1)
plt.title("Weierstrass Function (a=0.5, b=7)", fontsize=14)
plt.xlabel("x", fontsize=12)
plt.ylabel("W(x)", fontsize=12)
plt.grid(alpha=0.3)
plt.show()
