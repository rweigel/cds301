urlwrite('http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt','particles3.txt');
load particles3.txt

t = particles3(:,1);
y = particles3(:,3:4:end);

% Check - I looked at first few lines of particles3.txt
% to make sure numbers were correct.
figure(1);clf
    % Make line width 2 so easier to see.
    plot(t,y,'LineWidth',2);
    ylabel('[m]'); % Show units!
    xlabel('[sec]'); % Show units!
    % Add space before first letter.
    legend(' Particle 1',' Particle 2',' Particle 3');
    % Show grid to make easy to read.
    grid on;

%1. 
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
figure(1);clf
    % Make line width 2 so easier to see.
    plot(t,y)
    legend('Particle 1','Particle 2','Particle 3',...
        'Location','SouthWest');
    % Show grid to make easy to read.
    grid on;
    print -dpng final1.png
    
figure(2);clf
    plot(t,y,'LineWidth',2);
    % Add space before 1st character.
    legend(' Particle 1',' Particle 2',' Particle 3',...
        'Location','SouthWest');
    % Show grid to make easy to read.
    grid on;
    print -dpng final2.png

figure(3);clf
    plot(t,y,'LineWidth',2);
    % Add space before 1st character.
    legend(' Particle 1',' Particle 2',' Particle 3',...
        'Location','SouthWest');
    ylabel('[m]'); % Show units!
    xlabel('[sec]'); % Show units!
    % Show grid to make easy to read.
    grid on;
    print -dpng final3.png

figure(4);clf
    % Make line width 2 so easier to see.
    plot(t,y,'LineWidth',2);
    hold on;
    set(gca,'FontSize',16)
    ylabel('[m]','FontSize',16);
    xlabel('[sec]','FontSize',16);
    text(1.7,2.5,'Particle 1','Color','Blue');
    text(1.1,3.2,'Particle 2','Color','Green');
    text(1.105,2.7,'Particle 3','Color','Red');
    grid on;
    title('Particle y-values')
    print -dpng final4.png

figure(5);clf
    % Default line colors did not match text color specs.
    plot(t,y(:,1),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t,y(:,2),'LineWidth',2,'Color','Green');
    plot(t,y(:,3),'LineWidth',2,'Color','Red');
    set(gca,'FontSize',16)
    ylabel('[m]','FontSize',16); % Show units!
    xlabel('[sec]','FontSize',16); % Show units!
    %text(1.7,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.6,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.1,3.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold');
    text(1.105,2.7,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold');
    grid on;
    title('Particle y-values')
    print -dpng final5.png
    
figure(6);clf
    % Default line colors did not match text color specs.
    plot(t,y(:,1),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t,y(:,2),'LineWidth',2,'Color','Green');
    plot(t,y(:,3),'LineWidth',2,'Color','Red');
    set(gca,'FontSize',16)
    yl = ylabel('y [m]','FontSize',16); % Show units!
    xlabel('time [sec]','FontSize',16); % Show units!
    %text(1.7,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.6,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.1,3.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold');
    text(1.105,2.7,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold');
    th = title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    set(th,'FontSize',12,'FontWeight','Normal')
    grid on;
    set(th,'FontSize',12)
    set(gca,'XTick',[0:0.2:2])
    print -dpng final6.png
end
    
figure(7);clf
    % Default line colors did not match text color specs.
    plot(t,y(:,1)-mean(y(:,1)),'LineWidth',2,'Color','Blue','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    hold on;
    plot(t,y(:,2)-mean(y(:,2)),'LineWidth',2,'Color','Green','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    plot(t,y(:,3)-mean(y(:,3)),'LineWidth',2,'Color','Red','Marker','.','MarkerFaceColor','k','MarkerEdgeColor','k');
    yl = ylabel('y - ave(y) [m]','FontSize',16); % Show units!
    ylabel('y-$\bar{\mbox{y}}$ [m]','Interpreter','latex','FontSize',16)
    xlabel('time [sec]','FontSize',16,'Interpreter','latex'); % Show units!
    %text(1.7,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(0.8,0.05,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    text(0.6,-0.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    text(1.2,0.2,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold','Interpreter','latex','VerticalAlignment','bottom');
    th = title('Source: http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt');
    set(th,'FontSize',12,'FontWeight','Normal')
    grid on;
    set(gca,'TickLabelInterpreter','latex','FontSize',16)
    set(th,'FontSize',12,'Interpreter','latex')
    set(gca,'XTick',[0:0.2:2])
    print -dpng final7.png        