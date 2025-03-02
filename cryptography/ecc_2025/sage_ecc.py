from sage.all import FiniteField as GF
from sage.schemes.elliptic_curves.ell_finite_field import EllipticCurve_finite_field
F = GF(263)
C = EllipticCurve_finite_field(F, [0, 0, 0, 2, 3])  # [a1, a2, a3, a4, a6]
print(C)

