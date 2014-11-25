clear;

figure(1);clf
[X,Y] = meshgrid([-pi:0.1:pi],[-2:0.1:2]);
U = Y;
V = -sin(X);

quiver(X,Y,U,V);
hold on;

px(1) = 1.0;
py(1) = 1.0;
vx(1) = interp2(X,Y,U,px(1),py(1));
vy(1) = interp2(X,Y,V,px(1),py(1));

h = 0.01;
Nsteps = 1000;
for t = 2:Nsteps
    px(t) = px(t-1) + h*vx(t-1);
    py(t) = py(t-1) + h*vy(t-1);
    
    if (px(t) > pi || py(t) > 2 || px(t) < -pi || py(t) < -2.0)
        % If next position is out-side of grid, stop computing positions.
        break;
    end
   
    vx(t) = interp2(X,Y,U,px(t),py(t));
    vy(t) = interp2(X,Y,V,px(t),py(t));
    fprintf('px(%d) = %.2f  py(%d) = %.2f  vx(%d) = %.2f  vy(%d) = %.2f\n',...
            t,px(t),t,py(t),t,vx(t),t,vy(t));
    
end

plot(px,py,'g','LineWidth',3);
plot(px,py,'k.','MarkerSize',10);
plot(px(1),py(1),'kx','MarkerSize',15);

print -depsc vector_basics3contour.eps
print -dpng vector_basics3contour.png
