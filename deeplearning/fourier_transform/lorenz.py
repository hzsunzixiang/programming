import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# 定义洛伦兹系统微分方程
def lorenz_system(state, t, sigma=10.0, rho=28.0, beta=8/3):
    x, y, z = state
    dxdt = sigma * (y - x)
    dydt = x * (rho - z) - y
    dzdt = x * y - beta * z
    return [dxdt, dydt, dzdt]

# 初始条件和时间步长
initial_state = [1.0, 1.0, 10.0]
t = np.linspace(0, 50, 10000)

# 求解微分方程
trajectory = odeint(lorenz_system, initial_state, t)

# 绘制三维轨迹
fig = plt.figure(figsize=(12, 8))
ax = fig.add_subplot(111, projection='3d')
ax.plot(trajectory[:, 0], trajectory[:, 1], trajectory[:, 2], 
        lw=0.5, color='blue', alpha=0.6)
ax.set_xlabel("X"), ax.set_ylabel("Y"), ax.set_zlabel("Z")
ax.set_title("Lorenz Attractor (Chaotic System)")
plt.show()
