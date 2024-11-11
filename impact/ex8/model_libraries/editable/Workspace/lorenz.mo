within Workspace;
model lorenz
    parameter Real s = 10;
    parameter Real p = 28;
    parameter Real b = 8/3;
    Real z(start=50);
    Real x(start=50);
    Real y(start=50);
equation
    der(x) = s*(y-x);
    der(y) = x*(p-z)-y;
    der(z) = x*y-b*z;
end lorenz;
