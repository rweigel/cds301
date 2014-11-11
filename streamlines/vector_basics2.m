x = [1:10];
y = [1:10];
[X,Y] = meshgrid(x,y);

for i = 1:length(x)
    for j = 1:length(y)
        U(i,j) = 1.0;
        V(i,j) = 1.0+i/2;
    end
end


figure(1);clf;hold on;
axis([0 11 0 11]); % Set axis wider than default
quiver(X,Y,U,V);

hold on;
for i = 1:length(x)
    for j = 1:length(y)
        text(x(i)-0.5,y(j)-0.2,[sprintf('(%.1f,%.1f)',U(i,j),V(i,j))],'Color','black','FontSize',8);
        plot(x(i),y(j),'b.','MarkerSize',20);
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

print -depsc vector_basics2_quiver.eps
print -dpng vecgtor_basics2_quiver.png

figure(2);clf
contourf(X,Y,V);
hc = colorbar;
xlabel('x');
ylabel('y');
set(get(hc,'Title'),'String','v_y')

print -depsc vector_basics2_contour.eps
print -dpng vecgtor_basics2_contour.png
