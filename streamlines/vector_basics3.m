vector_basics2;

px(1) = 1.0;
py(1) = 1.0;
vx(1) = 1.0;
vy(1) = 1.5;

h = 0.1;
Nsteps = 100;
for t = 2:Nsteps
    px(t) = px(t-1) + h*vx(t-1);
    py(t) = py(t-1) + h*vy(t-1);
    vx(t) = interp2(X,Y,U,px(t),py(t));
    vy(t) = interp2(X,Y,V,px(t),py(t));
    if (px(t) > 10) || (py(t) > 10)
        break
    end
end

figure(1);
plot(px(1),py(1),'k.','MarkerSize',20);
plot(px,py,'g','LineWidth',3);
plot(px,py,'k.','MarkerSize',10)