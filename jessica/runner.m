D = load('Cheetah2.txt');
E = load('Greyhound2.txt');

for t = 1:283
   
    clf; hold on
    plot ([1.0*(500-(300+E(t,2))),500-(300+E(t,4))],[E(t,3),E(t,5)],'g','LineWidth',3)
    plot ([D(t,2),D(t,4)],[D(t,3),D(t,5)],'b','LineWidth',3)
    legend('Cheetah','Greyhound');
    
    axis([-300, 700, -350, 100])
    plot (1.0*(500-(300+E(t,2))),E(t,3),'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,4))),E(t,5), 'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,6))),E(t,7), 'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,8))),E(t,9), 'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,10))),E(t,11), 'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,12))),E(t,13), 'g.','MarkerSize',30)
    plot (1.0*(500-(300+E(t,14))),E(t,15), 'g.','MarkerSize',30)

    plot ([1.0*(500-(300+E(t,2))),500-(300+E(t,4))],[E(t,3),E(t,5)],'g','LineWidth',3)
    plot ([1.0*(500-(300+E(t,2))),500-(300+E(t,8))],[E(t,3),E(t,9)],'g','LineWidth',3)
    plot ([1.0*(500-(300+E(t,4))),500-(300+E(t,6))],[E(t,5),E(t,7)],'g','LineWidth',3)
    plot ([1.0*(500-(300+E(t,8))),500-(300+E(t,10))],[E(t,9),E(t,11)],'g','LineWidth',3)
    plot ([1.0*(500-(300+E(t,10))),500-(300+E(t,12))],[E(t,11),E(t,13)],'g','LineWidth',3)
    plot ([1.0*(500-(300+E(t,8))),500-(300+E(t,14))],[E(t,9),E(t,15)],'g','LineWidth',3)
    drawnow

    plot (D(t,2),D(t,3),'.','MarkerSize',30)
    plot (D(t,4),D(t,5), '.','MarkerSize',30)
    plot (D(t,6),D(t,7), '.','MarkerSize',30)
    plot (D(t,8),D(t,9), '.','MarkerSize',30)
    plot (D(t,10),D(t,11), '.','MarkerSize',30)
    plot (D(t,12),D(t,13), '.','MarkerSize',30)
    plot (D(t,14),D(t,15), '.','MarkerSize',30)
    plot (D(t,16),D(t,17), '.','MarkerSize',30)


    plot ([D(t,2),D(t,4)],[D(t,3),D(t,5)],'b','LineWidth',3)
    plot ([D(t,2),D(t,6)],[D(t,3),D(t,7)],'b','LineWidth',3)
    plot ([D(t,2),D(t,8)],[D(t,3),D(t,9)],'b','LineWidth',3)
    plot ([D(t,4),D(t,14)],[D(t,5),D(t,15)],'b','LineWidth',3)
    plot ([D(t,8),D(t,10)],[D(t,9),D(t,11)],'b','LineWidth',3)
    plot ([D(t,10),D(t,12)],[D(t,11),D(t,13)],'b','LineWidth',3)
    plot ([D(t,12),D(t,16)],[D(t,13),D(t,17)],'b','LineWidth',3)
    title(sprintf('Frame=%d | t = %.2f [s]',t,D(t,1)-D(1,1)));
    grid on;
    com = sprintf('print -dpng runner_%02d.png',t);
    eval(com);
    drawnow
    %input('Continue?')
end
