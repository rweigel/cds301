clear
[X,Y] = meshgrid([-pi:0.1:pi],[-2:0.1:2]);
U = Y;
V = -sin(X);

quiver(X,Y,U,V)


