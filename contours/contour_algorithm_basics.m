clear;
x = [0:20:100];
y = [0:20:100];

for i = 1:length(x)
    for j = 1:length(y)
        z(i,j) = (x(i)-50)^2 + (y(j)-50)^2;
    end
end
z = z/1000;

figure(1);clf;
axis([-20 120 -20 120]); % Set axis wider than default
hold on;
for i = 1:length(x)
    for j = 1:length(y)
        plot(x(i),y(j),'b.','MarkerSize',20);
        text(2+x(i),2+y(j),['z=',num2str(z(i,j))],'Color','blue');
    end
end

ylabel(gca, 'y','Rotation',0);
xlabel(gca,'x');
axis square
set(gca,'XTick',[0:20:100])
set(gca,'YTick',[0:20:100])
grid on;

text(25,114,'Values of z=0.1[(x-50)^2+(y-50)^2]')

showlines = false;
if (showlines)
% Draw contour lines for z = 1.
for i = 2:length(x)-1
    for j = 2:length(y)-1
        if (z(i,j) == 1)
            fprintf('z(%d,%d) = 1 (x=%d,y=%d)\n',i,j,x(i),y(j));
            if (z(i-1,j) == 1) % Left
                fprintf('   Left: z(%d,%d) = 1 (x=%d,y=%d)\n',i-1,j,x(i-1),y(j));
                plot([x(i),x(i-1)],[y(j),y(j)]); % Draw line that connects.
            end
        end
    end
end
end

% Add index axes.
% Based on technique from http://stackoverflow.com/questions/19569134/overlaying-two-axes-in-a-matlab-plot
% Create a new axes in the same position as the first one, overlaid on top
h2 = axes('position', get(gca, 'position')); 
% Put the new axes' y labels on the right, set the x limits the same as the
% original axes', and make the background transparent
set(h2, 'YAxisLocation', 'right', 'YLim',[0,length(y)+1],'Xlim', [0,length(x)+1], 'Color', 'none'); 
ylabel(h2, 'j','Rotation',0);
xlabel(h2, 'i');
set(h2,'XTick',[1:length(x)])
set(h2,'YTick',[1:length(y)])
set(h2, 'XAxisLocation', 'top');
axis square;
hold on;


if (showlines)
    print -dpng contour_algorithm_basics_w_lines.png
    print -depsc contour_algorithm_basics_w_lines.eps
else
    print -dpng contour_algorithm_basics.png
    print -depsc contour_algorithm_basics.eps    
end
%!display contour_algorithm_basics.png &


figure(2);clf;
[c,h] = contour(x,y,z);
clabel(c,h);
xlabel('x');
ylabel('y','rotation',0);
title('Countours of z=0.1[(x-50)^2+(y-50)^2]')
grid on;
axis square;
hold on;
axis square
set(gca,'XTick',[0:20:100])
set(gca,'YTick',[0:20:100])
grid on;

axis([-20 120 -20 120]); % Set axis wider than default

for i = 1:length(x)
    for j = 1:length(y)
        plot(x(i),y(j),'b.','MarkerSize',20);
        text(2+x(i),2+y(j),num2str(z(i,j)),'Color','Blue');
    end
end

figure(3);clf;
contourf(x,y,z);
ch = colorbar;
th = get(ch,'Title');
set(th,'String','z');
xlabel('x');
ylabel('y');
title('Countours of z=0.1[(x-50)^2+(y-50)^2]')
grid on;
axis square;


