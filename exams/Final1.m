% In this solution, I give many versions of the plot that were tested
% before I was satified with the presentation.  Note that this was
% done on MATLAB R2015a.  On older versions of MATLAB, the final plot
% may look different and/or not acceptable.

% Important:
%
% Always save a raster (png) and vector (pdf) version.  Use
% the raster for ppts and pdf for printable documents.
%
% What you see in the figure window may differ from what is saved.
% Modify plots based on saved file and not what you see in figure window.
%
% Adjust the size of the axes in the figure window by modifying the figure
% window size to be about the same as png size to make them more
% nearly match.

urlwrite('http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt','particles3.txt');
load particles3.txt

t = particles3(:,1);
y = particles3(:,3:4:end);

% Check - I looked at first few lines of particles3.txt
% to make sure numbers were correct.

I = find(particles3(:,1) < 2);
t = t(I);
y = y(I,:);

% or
if (0)
    for i = 1:size(particles3,1)
        t(i) = particles3(i,1);
        y(i,1) = particles3(i,3);
        y(i,2) = particles3(i,7);
        y(i,3) = particles3(i,10);
    end
end

if (0)
% First try
figure(1);clf
    plot(t,y)
    legend('Particle 1','Particle 2','Particle 3',...
        'Location','SouthWest');
    ylabel('[m]');
    xlabel('[sec]');
    title('Particle y-values')
    print -dpng Final1.png
    print -dpdf Final1.pdf

figure(2);clf
    % Make line width 2 so easier to see.
    plot(t,y,'LineWidth',2);
    ylabel('[m]');
    xlabel('[sec]');
    % Add space before first letter.
    legend(' Particle 1',' Particle 2',' Particle 3');
    % Show grid to make easy to read off positions.
    grid on;
    title('Particle y-values')
    print -dpng Final2.png
    print -dpdf Final2.pdf
    
figure(3);clf
    % Make line width 2 so easier to see.
    plot(t,y,'LineWidth',2);
    hold on;
    set(gca,'FontSize',16)
    ylabel('[m]','FontSize',16);
    xlabel('[sec]','FontSize',16);
    % Used colored text near lines so legend is not needed.
    % It is easier to match particle number to line using this
    % approach.
    text(1.7,2.5,'Particle 1','Color','Blue');
    text(1.1,3.2,'Particle 2','Color','Green');
    text(1.105,2.7,'Particle 3','Color','Red');
    grid on;
    title('Particle y-values')
    print -dpng Final3.png
    print -dpdf Final3.pdf

figure(4);clf
    % Default line colors did not exactly match text color.  Need
    % to set explicitly.
    plot(t,y(:,1),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t,y(:,2),'LineWidth',2,'Color','Green');
    plot(t,y(:,3),'LineWidth',2,'Color','Red');
    % Increase font size on axis numbers
    set(gca,'FontSize',16)
    % Use larger font size on axis labels.
    ylabel('[m]','FontSize',16);
    xlabel('[sec]','FontSize',16);
    % Use larger font size on text labels.  Also try bold.
    text(1.6,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.1,3.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold');
    text(1.105,2.7,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold');
    grid on;
    title('Particle y-values')
    print -dpng Final4.png
    print -dpdf Final4.pdf
    
figure(5);clf
    % Default line colors did not match text color specs.
    plot(t,y(:,1),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t,y(:,2),'LineWidth',2,'Color','Green');
    plot(t,y(:,3),'LineWidth',2,'Color','Red');
    set(gca,'FontSize',16)
    % Add "y" to label so not needed in title.
    yl = ylabel('y [m]','FontSize',16);
    % Explicity state that horizontal variable is time.
    xlabel('time [sec]','FontSize',16);
    text(1.6,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.1,3.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold');
    text(1.105,2.7,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold');
    % Use title for giving more information.
    title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    grid on;
    % When larger font is used, default tick spacing is too small.
    % Set it explicitly here.  Note that the value at t=1 appears
    % as "1", but should be "1.0" for consistency.  Should probably change
    % that.
    set(gca,'XTick',[0:0.2:2])
    print -dpng Final5.png
    print -dpdf Final5.pdf

 figure(6);clf
    % If the relative movement is more important than the offset,
    % plot the difference of each position from its mean.
    % Default line colors did not match text color specs.
    plot(t,y(:,1)-mean(y(:,1)),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t,y(:,2)-mean(y(:,2)),'LineWidth',2,'Color','Green');
    plot(t,y(:,3)-mean(y(:,3)),'LineWidth',2,'Color','Red');
    yl = ylabel('y - ave(y) [m]','FontSize',16);
    xlabel('time [sec]','FontSize',16);
    % Some of the text overlapped with a grid line.  Avoid this by setting
    % alignment.
    text(0.8,0.05,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    text(0.6,-0.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    text(1.2,0.2,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    th = title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    % The saved images had a title that did not fit.  Modify font size and
    % weight.
    set(th,'FontSize',12,'FontWeight','Normal')
    set(th,'FontSize',12)
    grid on;
    set(gca,'FontSize',16)
    set(gca,'XTick',[0:0.2:2])
    print -dpng Final6.png
    print -dpdf Final6.pdf

figure(7);clf
    % I want to show black dots where measurements were made to emphasize
    % that continuous line is to guide the eye.
    plot(t,y(:,1)-mean(y(:,1)),'LineWidth',2,'Color','Blue','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    hold on;
    plot(t,y(:,2)-mean(y(:,2)),'LineWidth',2,'Color','Green','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    plot(t,y(:,3)-mean(y(:,3)),'LineWidth',2,'Color','Red','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    % The ave(y) in label looks amateur.  Use a LaTeX symbol instead.
    ylabel('y-$\bar{\mbox{y}}$ [m]','Interpreter','latex','FontSize',16)
    xlabel('time [sec]','FontSize',16);
    text(0.8,0.05,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    text(0.6,-0.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    text(1.2,0.2,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold','VerticalAlignment','bottom');
    th = title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    set(th,'FontSize',12,'FontWeight','Normal')
    grid on;
    set(gca,'FontSize',16)
    set(th,'FontSize',12)
    set(gca,'XTick',[0:0.2:2])
    print -dpng Final7.png
    print -dpdf Final7.pdf
end
    
figure(8);clf
    plot(t,y(:,1)-mean(y(:,1)),'LineWidth',2,'Color','Blue','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    hold on;
    plot(t,y(:,2)-mean(y(:,2)),'LineWidth',2,'Color','Green','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    plot(t,y(:,3)-mean(y(:,3)),'LineWidth',2,'Color','Red','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    yl = ylabel('y - ave(y) [m]','FontSize',16);
    % Grrr.  Now I need to modify all of the fonts to match the font used for the y
    % label.
    ylabel('y-$\bar{\mbox{y}}$ [m]','Interpreter','latex','FontSize',16)
    xlabel('time [sec]','FontSize',16,'Interpreter','latex');
    text(0.8,0.05,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    text(0.6,-0.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    text(1.2,0.2,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    th = title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    set(th,'FontSize',12,'FontWeight','Normal')
    grid on;
    % Add a black line to make zero y value stand out.
    plot([0,2],[0,0],'k');
    set(gca,'TickLabelInterpreter','latex','FontSize',16)
    set(th,'FontSize',12,'Interpreter','latex')
    % Manually set numbers with same precision on x labels.
    set(gca,'XTick',[0:0.2:2])
    set(gca,'XTickLabel',sprintf('%.1f\n',[0:0.2:2]))
    % Manually set numbers with same precision on y labels.
    set(gca,'YTick',[-0.5:0.1:0.3])
    % Grr. The following resulted in "-0.0" being shown.
    %set(gca,'YTickLabel',sprintf('%.1f\n',[-0.5:0.1:0.3]))
    % So set values without using array notation:
    set(gca,'YTickLabel',sprintf('%.1f\n',[-0.5,-0.4,-0.3,-0.2,-0.1,0.0,0.1,0.2,0.3]))
    print -dpng Final8.png
    print -dpdf Final8.pdf
