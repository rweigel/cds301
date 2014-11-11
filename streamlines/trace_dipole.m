% Trace a dipole field line using different methods
clear;clf;
x(1) = 1; y(1) = 0; z(1) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical solution: Euler integration method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ds = 0.01;
N = 1/ds;
for i = 1:N
  Bxyz = B_dipole([x(i),y(i),z(i)]);
  B = magrows(Bxyz);
  x(i+1) = x(i) + ds*Bxyz(1)/B;
  y(i+1) = y(i) + ds*Bxyz(2)/B;
  z(i+1) = z(i) + ds*Bxyz(3)/B;
end
X(1) = {[x',y',z']};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exact solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ro    = 1;
theta = (pi/180)*[90:150]';
r     = (ro*sin(theta)).^2;
x     = r.*sin(theta);
y     = 0.*theta;
z     = r.*cos(theta);
X(2) = {[x,y,z]};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical solution: ODE23 integration method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[s,tmp] = ode23('B_dipole',[0,0.4],[x(1);y(1);z(1)]);
% Sum of ds values, S, should be close to sf = 0.4. 
% However, this seems to hold only for small sf.  Why?
S = sum(magrows(diff(tmp))); 
X(3) = {tmp};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
legtxt    = {'Euler integration','Exact solution','ODE23 integration'};
linewidth = [4,3,2];
linecolor = ['g','r','k'];
for i = 1:length(X)
  plot(X{i}(:,1),X{i}(:,3),linecolor(i),'LineWidth',linewidth(i));
  xlabel('x')
  ylabel('z');
  hold on;
  grid on;
  axis([-1 1 -1 1])
end
legend(legtxt);
plot([-1 1],[0 0],'k');
plot([0 0],[-1 1],'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
