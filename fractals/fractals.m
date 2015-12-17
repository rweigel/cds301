clear;
more off;
all = 0;  % Display all steps
M = 5000; % Maximum number of steps
x = [-1, -0.5];
y = [0, 0.5];
d = 0.01;
x = [-2.0:d:2.0];
y = [-2.0:d:2.0];

for a = 1:length(x)
  for b = 1:length(y)
    fprintf('x = %+.1f, y = %+.1f\n',x(a),y(b))
    n = 1;
    z(n) = 0.0;
    if (all),fprintf(' z(%d) = %+.2f%+.2fj, abs(z(%d)) = %.2f\n',n,real(z(n)),imag(z(n)),n,abs(z(n)));,end
    for n = 2:M
      z(n) = (z(n-1))^2 + x(a) + sqrt(-1)*y(b);
      if (all),fprintf(' z(%d) = %+.2f%+.2fj, abs(z(%d)) = %.2f\n',n,real(z(n)),imag(z(n)),n,abs(z(n)));,end
      if abs(z(n)) > 2
	if (~all),fprintf(' z(%d) = %+.2f%+.2fj, abs(z(%d)) = %.2f\n',n,real(z(n)),imag(z(n)),n,abs(z(n)));,end
	C(a,b) = 0;
	break
      end
    end
    if (n == M)
      if (~all),fprintf(' z(%d) = %+.2f%+.2fj, abs(z(%d)) = %.2f\n',n,real(z(n)),imag(z(n)),n,abs(z(n)));,end
      C(a,b) = 255;
    end
  end
end

figure(1);clf;
colormap([0,0,0;1,1,1])
image(x,y,C)
xlabel('x')
ylabel('y')
set(gca,'YDir','normal')
hold on;
axis square

if (length(x) == 2)
  plot([-1.25,-0.25],[0.25,0.25],'k')
  plot([-1.25,-0.25],[-0.75,-0.75],'k')
  plot([-1.25,-0.25],[-0.25,-0.25],'k')

  plot([-0.25,-0.25],[-0.75,0.25],'k')
  plot([-1.25,-1.25],[-0.75,0.25],'k')
  plot([-0.75,-0.75],[-0.75,0.25],'k')

  set(gca,'XLim',[-1.3 -0.2])
  set(gca,'YLim',[-0.8 0.3])
  set(gca,'XTick',[-1.5:0.5:0.0]);
  set(gca,'YTick',[-1:0.5:1]);
  print -dpng fractals2x2.png
else
  fname = sprintf('fractals%dx%d.png',length(x),length(y));
  print('-dpng',fname);
end

