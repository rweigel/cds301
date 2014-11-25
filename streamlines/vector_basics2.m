clear; clc;

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
        plot(x(i),y(j),'k.','MarkerSize',20);
        text(2+x(i),2+y(j),num2str(z(i,j)));
    end
end

axis square;
xlabel('x');
ylabel('y');
title('Values of z=0.1[(x-50)^2+(y-50)^2]')

%figure(2);clf;clc;
%axis([-20 120 -20 120]);

hold on;

for i = 2:length(x)-1
    for j = 2:length(y)-1
        if (z(i,j) == 1)
            fprintf('z(%d,%d) = 1 (x=%d,y=%d)\n',i,j,x(i),y(j));
                
            if (z(i-1,j) == 1) % Left
                fprintf('   Left: z(%d,%d) = 1 (x=%d,y=%d)\n',i-1,j,x(i-1),y(j));
                plot([x(i),x(i-1)],[y(j),y(j)]); % Draw line that connects.
            end
            if (z(i+1,j) == 1) % Right
                fprintf('   Right: z(%d,%d) = 1 (x=%d,y=%d)\n',i+1,j,x(i+1),y(j));
            end
            if (z(i,j+1) == 1) % Above
                fprintf('   Above: z(%d,%d) = 1 (x=%d,y=%d)\n',i+1,j,x(i),y(j+1));
                plot([x(i),x(i)],[y(j),y(j+1)]); % Draw line that connects.
            end
            if (z(i,j-1) == 1) % Below
                fprintf('   Below: z(%d,%d) = 1 (x=%d,y=%d)\n',i+1,j,x(i),y(j-1));
            end
            if (z(i-1,j-1) == 1) % Up 1, Right 1
               plot([x(i),x(i-1)],[y(j),y(j-1)]); % Draw line that connects.
            end
            if (z(i-1,j+1) == 1) % Up 1, Left 1
               plot([x(i),x(i-1)],[y(j),y(j+1)]); % Draw line that connects.
            end
        end
    end
end

axis square;
xlabel('x');
ylabel('y');
title('Values of z=0.1[(x-50)^2+(y-50)^2]')