from sympy.solvers import solve
from sympy.abc import a, b, c, d

eq = [a+b-3*c-d, -a-b-2*d, c+d]
print(solve(eq,[a,b,c,d]))