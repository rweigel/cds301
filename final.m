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

figure(1);clf
    % Make line width 2 so easier to see.
    plot(t(I),y(I,:))
    legend('Particle 1','Particle 2','Particle 3',...
        'Location','SouthWest');
    % Show grid to make easy to read.
    grid on;
    print -dpng final1.png
    
figure(2);clf
    plot(t(I),y(I,:),'LineWidth',2);
    % Add space before 1st character.
    legend(' Particle 1',' Particle 2',' Particle 3',...
        'Location','SouthWest');
    % Show grid to make easy to read.
    grid on;
    print -dpng final2.png

figure(3);clf
    plot(t(I),y(I,:),'LineWidth',2);
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
    plot(t(I),y(I,:),'LineWidth',2,'Color','Blue');
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
    plot(t(I),y(I,1),'LineWidth',2,'Color','Blue');
    hold on;
    plot(t(I),y(I,2),'LineWidth',2,'Color','Green');
    plot(t(I),y(I,3),'LineWidth',2,'Color','Red');
    set(gca,'FontSize',16)
    ylabel('[m]','FontSize',16); % Show units!
    xlabel('[sec]','FontSize',16); % Show units!
    text(1.7,2.5,'Particle 1','Color','Blue','FontSize',16,'FontWeight','Bold');
    text(1.1,3.2,'Particle 2','Color','Green','FontSize',16,'FontWeight','Bold');
    text(1.105,2.7,'Particle 3','Color','Red','FontSize',16,'FontWeight','Bold');
    grid on;
    title('Particle y-values')
    print -dpng final5.png
    
    