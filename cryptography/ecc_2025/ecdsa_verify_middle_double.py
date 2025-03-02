def mod_inverse(a, p):
    """计算a在模p下的逆元（p为质数）"""
    return pow(a, p-2, p)

class ECPoint:
    def __init__(self, x, y, is_infinity=False):
        self.x = x
        self.y = y
        self.is_infinity = is_infinity  # 标记是否为无穷远点O

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y and self.is_infinity == other.is_infinity

    def __repr__(self):
        return "O" if self.is_infinity else f"({self.x}, {self.y})"

def elliptic_add(p, q, a, mod):
    """椭圆曲线点加法"""
    if p.is_infinity:
        return q
    if q.is_infinity:
        return p
    
    # 处理相反点的情况（P + (-P) = O）
    if p.x == q.x and (p.y != q.y or p.y == 0):
        return ECPoint(0, 0, is_infinity=True)
    
    # 计算斜率λ
    if p != q:
        numerator = (q.y - p.y) % mod
        denominator = (q.x - p.x) % mod
    else:
        numerator = (3 * p.x**2 + a) % mod
        denominator = (2 * p.y) % mod
    
    # 处理分母为0的情况（结果为O）
    if denominator == 0:
        return ECPoint(0, 0, is_infinity=True)
    inv_denominator = mod_inverse(denominator, mod)
    lambd = (numerator * inv_denominator) % mod
    
    # 计算新点坐标
    x_r = (lambd**2 - p.x - q.x) % mod
    y_r = (lambd * (p.x - x_r) - p.y) % mod
    return ECPoint(x_r, y_r)

# 初始化参数
mod = 263 
a, b = 2, 3
P = ECPoint(0, 23)

# 计算kP（k=1到18）
current = P
points = [P]
for k in range(2, 19):
    current = elliptic_add(current, P, a, mod)
    points.append(current)
    # 若遇到无穷远点，后续结果均为O
    if current.is_infinity:
        points += [ECPoint(0, 0, is_infinity=True)] * (18 - k)
        break

# 输出结果
for i, point in enumerate(points, 1):
    print(f"{i}P = {point}")
