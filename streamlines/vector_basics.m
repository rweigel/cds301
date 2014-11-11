clear;

x = [1:10];
y = [1:10];
[X,Y] = meshgrid(x,y);

U = ones(size(X));
V = ones(size(Y));

figure(1);clf;hold on;
axis([0 11 0 11]); % Set axis wider than default
hold on;
for i = 1:length(x)
    for j = 1:length(y)
        plot(x(i),y(j),'b.','MarkerSize',20);
        text(.2+x(i),y(j),[sprintf('(%.1f,%.1f)',U(i,j),V(i,j))],'Color','blue');
    end
end
title('Measurements of velocity (vx,vy)');
ylabel(gca, 'y','Rotation',0);
xlabel(gca,'x');
axis square
set(gca,'XTick',[1:1:10])
set(gca,'YTick',[1:1:10])
grid on;

quiver(X,Y,U,V);
% Add index axes.
% Based on technique from http://stackoverflow.com/questions/19569134/overlaying-two-axes-in-a-matlab-plot
% Create a new axes in the same position as the first one, overlaid on top
h2 = axes('position', get(gca, 'position')); 
% Put the new axes' y labels on the right, set the x limits the same as the
% original axes', and make the background transparent
set(h2, 'YAxisLocation', 'right', 'YLim',[0,length(y)+1],'Xlim', [0,length(x)+1], 'Color', 'none'); 
ylabel(h2, 'j','Rotation',0,'FontSize',16);
xlabel(h2, 'i','FontSize',16);
set(h2,'XTick',[1:length(x)])
set(h2,'YTick',[1:length(y)])
set(h2, 'XAxisLocation', 'top');
axis square;
hold on;
set(gca,'FontSize',16)

print -depsc vector_basics.eps
print -dpng vecgtor_basics.png