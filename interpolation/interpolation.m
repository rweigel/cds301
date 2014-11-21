
x = [1,2,3];
y = [2,4,5];

figure(1);clf
plot(x,y,'k.','MarkerSize',30);
axis equal
axis([0 4 0 6]);
xlabel('x');
ylabel('y');
grid on;
print -dpng interpolation1.png
print -depsc interpolation1.eps

figure(2);clf;
plot(x,y,'k.','MarkerSize',30);
axis equal
axis([0 4 0 6]);
xlabel('x');
ylabel('y');
grid on;hold on;
plot([1 2],[2 2],'b','LineWidth',3);
plot([2 2],[2 4],'b','LineWidth',3);
plot([1 2],[2 4],'b','LineWidth',3);
text(1.4,1.5,'1.0','Color','b','FontWeight','bold');
text(2.2,3.0,'2.0','Color','b','FontWeight','bold');

plot([1 1.6],[2 2],'g','LineWidth',1);
plot([1.6 1.6],[2 3.2],'g','LineWidth',1);
plot([1 1.6],[2 3.2],'g','LineWidth',1);

text(1.2,1.8,'0.6','Color','g','FontWeight','bold');
text(1.7,2.5,'?','Color','g','FontWeight','bold');
print -dpng interpolation2.png
print -depsc interpolation2.eps

interp1(x,y,1.6)

figure(3);clf;hold on;
x = [0 1 1 0];
y = [0 0 1 1];
z = [2 1 0.5 0.5];
plot3(x,y,z,'.','MarkerSize',30);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
axis equal
axis([0 2 0 2 0 3]);
plot3([0 0],[0 0],[0 2],'b-.');
plot3([1 1],[0 0],[0 1],'b-.');
plot3([1 1],[1 1],[0.0 0.5],'b-.');
plot3([0 0],[1 1],[0.0 0.5],'b-.');
view(45+90,30)
plot3(0.25,0.75,0,'kx');
print -dpng interpolation3.png
print -depsc interpolation3.eps

figure(4);clf;hold on;
x = [0 1 1 0];
y = [0 0 1 1];
z = [2 1 0.5 0.5];
plot3(x,y,z,'.','MarkerSize',30);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
axis equal
axis([0 2 0 2 0 3]);
plot3([0 0],[0 0],[0 2],'b-.');
plot3([1 1],[0 0],[0 1],'b-.');
plot3([1 1],[1 1],[0.0 0.5],'b-.');
plot3([0 0],[1 1],[0.0 0.5],'b-.');
plot3([1 1],[0 1],[1 0.5],'k');
plot3([0 0],[0 1],[2 0.5],'k');
view(45+90,30)
plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
plot3([0 0],[0.75 0.75],[0 0.875],'g-');
plot3([0 1],[0.75 0.75],[0 0],'g-');
plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
plot3(0.25,0.75,0,'kx');

figure(5);clf;hold on;
x = [0 1 1 0];
y = [0 0 1 1];
z = [2 1 0.5 0.5];
plot3(x,y,z,'.','MarkerSize',30);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
axis equal
axis([0 2 0 2 0 3]);
plot3([0 0],[0 0],[0 2],'b-.');
plot3([1 1],[0 0],[0 1],'b-.');
plot3([1 1],[1 1],[0.0 0.5],'b-.');
plot3([0 0],[1 1],[0.0 0.5],'b-.');
plot3([1 1],[0 1],[1 0.5],'k');
plot3([0 0],[0 1],[2 0.5],'k');
view(65+90,20)
plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
plot3([0 0],[0.75 0.75],[0 0.875],'g-');
plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
plot3([1 0],[0.75 0.75],[0.5+1/8,0.875],'k-')
plot3(0.25,0.75,0,'kx');
plot3(0.25,0.75,0.6125+.1969,'r.','MarkerSize',30)
plot3([0.25,0.25],[0.75,0.75],[0,0.6125+.1969],'r-')

