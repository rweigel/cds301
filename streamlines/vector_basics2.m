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


% Add index axes.
% Based on technique from http://stackoverflow.com/questions/19569134/overlaying-two-axes-in-a-matlab-plot
% Create a new axes in the same position as the first one, overlaid on top
h2 = axes('position', get(gca, 'position')); 
% Put the new axes' y labels on the right, set the x limits the same as the
% original axes', and make the background transparent
set(h2, 'YAxisLocation', 'right', 'YLim',[0,11],'Xlim', [0,11], 'Color', 'none'); 
ylabel(h2, 'j','Rotation',0,'FontSize',16);
xlabel(h2, 'i','FontSize',16);
set(h2,'XTick',[1:10])
set(h2,'YTick',[1:10])
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
