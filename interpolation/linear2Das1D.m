figure(1);clf
plot([1,1,2,2],[1,2,1,2],'k.','MarkerSize',10)
grid on;
hold on;
text(1.2,1,'H = 10')
text(1.2,2,'H = 20')
text(2.2,1,'H = 10')
text(2.2,2,'H = 20')
axis([0 3 0 3])
xlabel('x')
ylabel(gca, 'y','Rotation',0);
set(gca,'XTick',[1,2])
set(gca,'YTick',[1,2])
axis square
print -dpng linear2Das1D.png