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
text(1,0.2,'Measurements of velocity (v_x,v_y)','FontSize',16);
ylabel(gca, 'y','Rotation',0,'FontSize',16);
xlabel(gca,'x','FontSize',16);
axis square
set(gca,'XTick',[1:1:10])
set(gca,'YTick',[1:1:10])
grid on;
set(gca,'FontSize',16)

print -depsc vector_basics2quiver.eps
print -dpng vector_basics2quiver.png