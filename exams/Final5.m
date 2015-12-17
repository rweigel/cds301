urlwrite('http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt','particles3.txt');
load particles3.txt

t = particles3(:,1);
p = particles3(:,[2,3,6,7,10,11]);
v = particles3(:,[4,5,8,9,12,13]);
K1 = sqrt(sum(v(:,1:2).^2,2));
K2 = sqrt(sum(v(:,3:4).^2,2));
K3 = sqrt(sum(v(:,5:6).^2,2));
maxK = max([K1;K2;K3]);
K1 = K1/maxK;
K2 = K2/maxK;
K3 = K3/maxK;

s = 1.0; % Scale factor for vertical line
figure(1);clf;
    for i = 1:size(p,1)
        plot(p(i,1),p(i,2),'r.','MarkerSize',40);
        hold on;
        plot(p(i,3),p(i,4),'g.','MarkerSize',40);
        plot(p(i,5),p(i,6),'b.','MarkerSize',40);
        axis([0 4 0 4])
        set(gca,'XTick','')
        set(gca,'YTick','')
        xlabel('Length of vertical bar proportional to KE')
        axis square
        plot(p(i,1),p(i,2),'r.','MarkerSize',255);
        plot([p(i,1),p(i,1)],[p(i,2)-K1(i)*s,p(i,2)+K1(i)*s],'k-','LineWidth',5);
        plot(p(i,3),p(i,4),'g.','MarkerSize',255);
        plot([p(i,3),p(i,3)],[p(i,4)-K2(i)*s,p(i,4)+K2(i)*s],'k-','LineWidth',5);
        plot(p(i,5),p(i,6),'b.','MarkerSize',255);
        plot([p(i,5),p(i,5)],[p(i,6)-K3(i)*s,p(i,6)+K3(i)*s],'k-','LineWidth',5);
        lh = legend(...
            sprintf('Particle 1; KE = %.2f [J]',maxK*K1(i)),...
            sprintf('Particle 2; KE = %.2f [J]',maxK*K2(i)),...
            sprintf('Particle 3; KE = %.2f [J]',maxK*K3(i)),...
            'Location','BestOutside');
        set(lh,'FontSize',16);
        title(sprintf('t = %.2f [s]',t(i)));
        drawnow
        %input('Continue?');
        clf;
    end
    