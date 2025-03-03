import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LightSource

# 自定义peaks函数（确保公式准确）
def peaks(n=200):
    x = np.linspace(-3, 3, n)
    y = np.linspace(-3, 3, n)
    X, Y = np.meshgrid(x, y)
    Z = 3*(1-X)**2 * np.exp(-(X**2 + (Y+1)**2)) \
        - 10*(X/5 - X**3 - Y**5) * np.exp(-(X**2 + Y**2)) \
        - 1/3 * np.exp(-((X+1)**2 + Y**2))
    return X, Y, Z

# 绘制与渲染
X, Y, Z = peaks(200)
fig = plt.figure(figsize=(10, 8), facecolor='black')
ax = fig.add_subplot(111, projection='3d')

# 模拟MATLAB光照
ls = LightSource(azdeg=315, altdeg=45)
rgb = ls.shade(Z, cmap=plt.cm.jet, vert_exag=0.1, blend_mode='soft')

surf = ax.plot_surface(X, Y, Z, facecolors=rgb, antialiased=True, linewidth=0)
ax.view_init(30, -37.5)
ax.set_axis_off()
plt.show()
