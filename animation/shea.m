clear
x = [-9.05:0.05:9.05];
y = x;
a = 1;
k = 1;
k2 = 1.1;

[X,Y] = meshgrid(x,y);
theta = atan2(Y,X);
r = X./cos(theta);
phi = -j*(1./sqrt(k*r))*sin(k*a-pi/4).*exp(j*(r-k*a));
phi2 = -j*(1./sqrt(k2*r))*sin(k2*a-pi/4).*exp(j*(r-k2*a));

%phi = -j*sin(rs-pi/4).*exp(j*(r-rs));

figure(1);clf;
imagesc(x,y,(180/pi)*theta);
colorbar;

w  = k/100;
w2 = k2/100;

%for t=[0:100:10000]
for t=[0:1:200]	
	figure(2);clf
	colormap('gray')
	axis square

	Z = real(exp(-2*j*pi*w*t).*phi);
	Z2 = real(exp(-2*j*pi*w2*t).*phi2);

	%imagesc(x,y,Z+Z2,[-1,1])
	imagesc(x,y,Z,[-1,1])
	cb = colorbar;
	set(cb,'YTick',[-1:0.05:1])
	set(cb,'YLim',[-1 1])
	%break
	%sh = surf(X,Y,Z)	;
	%set(sh,'EdgeColor','none');
	drawnow
%	input('continue?');
end

figure(3);clf
imagesc(x,y,1./r)
colorbar