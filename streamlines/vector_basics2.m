clear;
for i = 1:10
    for j = 1:10
        X(i,j) = j;
        Y(i,j) = i;
        U(i,j) = 1.0;
        V(i,j) = 1.0+j/2;
    end
end

% or
% [X,Y] = meshgrid([1:10],[1:10]);
% U = ones(size(X));
% V = 1+X/2;

figure(1);clf;hold on;
axis([0 11 0 11]); % Set axis wider than default
quiver(X,Y,U,V);

hold on;
for i = 1:10
    for j = 1:10
        text(j-0.5,i-0.2,[sprintf('(%.1f,%.1f)',U(i,j),V(i,j))],'Color','black','FontSize',8);
        plot(j,i,'b.','MarkerSize',20);
    end
end
text(3,0.2,'Measurements of velocity (v_x,v_y)','FontSize',16);
ylabel(gca, 'y','Rotation',0,'FontSize',16);
xlabel(gca,'x','FontSize',16);
axis square
set(gca,'XTick',[1:1:10])
set(gca,'YTick',[1:1:10])
grid on;
set(gca,'FontSize',16)

print -depsc vector_basics2quiver.eps
print -dpng vector_basics2quiver.png

px(1) = 1.0;
py(1) = 1.0;
vx(1) = interp2(X,Y,U,px(1),py(1));
vy(1) = interp2(X,Y,V,px(1),py(1));

h = 0.1;
Nsteps = 100;
for t = 2:Nsteps
    px(t) = px(t-1) + h*vx(t-1);
    py(t) = py(t-1) + h*vy(t-1);
    
    if (px(t) > 10.0 || py(t) > 10.0 || px(t) < 1.0 || py(t) < 1.0)
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

print -depsc vector_basics2contour.eps
print -dpng vector_basics2contour.png
