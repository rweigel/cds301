clear
clc

U = [1,4;2,3];
V = [1,1;1,1];
X = [1,2.5;1,2.5];
Y = [1,1;2.5,2.5];

px(1) = 1.0;
py(1) = 1.0;
vx(1) = interp2(X,Y,U,px(1),py(1));
vy(1) = interp2(X,Y,V,px(1),py(1));

h = 0.05;
Nsteps = 11;
for t = 2:Nsteps
    px(t) = px(t-1) + h*vx(t-1);
    py(t) = py(t-1) + h*vy(t-1);
    vx(t) = interp2(X,Y,U,px(t),py(t));
    vy(t) = interp2(X,Y,V,px(t),py(t));
end
px(10)
py(10)
