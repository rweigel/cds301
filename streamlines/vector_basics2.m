clear;
% Create a matrix of X and Y points.
% Create a matrix of velocities in X and Y directions (U and V)
for i = 1:10
    for j = 1:10
        X(i,j) = j;
        Y(i,j) = i;
        U(i,j) = 1.0;
        V(i,j) = 1.0+j/2;
    end
end

% or, short-hand method
% [X,Y] = meshgrid([1:10],[1:10]);
% U = ones(size(X));
% V = 1+X/2;

figure(1);clf;hold on;
  
axis([0 11 0 11]); % Set axis limits
% Plot vectors at positions given by X and Y
% and velocities given by U and V
quiver(X,Y,U,V);   

hold on;
% Add a dot at the vector base and display value.
for i = 1:10
    for j = 1:10
        text(j-0.5,i-0.2,[sprintf('(%.1f,%.1f)',U(i,j),V(i,j))],'Color','black','FontSize',8);
        plot(j,i,'b.','MarkerSize',20);
    end
end
% Add text at position (x,y) = (3,0.2)
text(3,0.2,'Measurements of velocity (v_x,v_y)','FontSize',16);

% Set the x-axis label
ylabel(gca, 'y','Rotation',0,'FontSize',16);
% Set the y-axis label
xlabel(gca,'x','FontSize',16);
% Make 1 unit in x = 1 unit in y 
axis square
% Set the labels for the x ticks
set(gca,'XTick',[1:1:10])
% Set the labels for the y ticks
set(gca,'YTick',[1:1:10])
% Show a grid
grid on;
% Increase the font size
set(gca,'FontSize',16)

% Save the image as PDF and PNG
print -dpdf vector_basics2quiver.pdf
print -dpng vector_basics2quiver.png

% Start the streamline calculation.
px(1) = 1.0; % Initial x position
py(1) = 1.0; % Initial y position
% Estimate of vx(1) given px(1) and py(1).
vx(1) = interp2(X,Y,U,px(1),py(1));
% Estimate of vy(1) given px(1) and py(1).
vy(1) = interp2(X,Y,V,px(1),py(1));

h = 0.1; % Step size
Nsteps = 100; % Number of steps.
for t = 2:Nsteps

    % New x position is old position + term proportional to x velocity
    px(t) = px(t-1) + h*vx(t-1);
    % New y position is old position + term proportional to x velocity
    py(t) = py(t-1) + h*vy(t-1);

    if (px(t) > 10.0 || py(t) > 10.0 || px(t) < 1.0 || py(t) < 1.0)
        % If next position is out-side of grid, stop computing positions.
        break; % This stops execution of the for loop.
    end
   
    % Compute an estimate of the new x velocity given the new positions.
    vx(t) = interp2(X,Y,U,px(t),py(t));

    % Compute an estimate of the new y velocity given the new positions.
    vy(t) = interp2(X,Y,V,px(t),py(t));

    % Display some information
    fprintf('px(%d) = %.2f  py(%d) = %.2f  vx(%d) = %.2f  vy(%d) = %.2f\n',...
            t,px(t),t,py(t),t,vx(t),t,vy(t));
    
end

% Plot the positions as a green line
plot(px,py,'g','LineWidth',3);
% Plot the positions as a black dot
plot(px,py,'k.','MarkerSize',10);
% Plot an x at the initial position
plot(px(1),py(1),'kx','MarkerSize',15);

% Save as PDF and PNG
print -dpdf vector_basics2contour.pdf
print -dpng vector_basics2contour.png
