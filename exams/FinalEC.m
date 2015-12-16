urlwrite('http://mag.gmu.edu/git-data/cds301/md2/data/particles3.txt','particles3.txt');
load particles3.txt

t = particles3(:,1);
y = particles3(:,2:end);

% Find elements in t with values less than or equal to 10.
I = find(t <= 10.0);
% Keep only those elements.
t = t(I);
y = y(I,:);

% The time grid to interpolate on to.
ti = [0:0.01:10.0]';

% Gives error because last 3 values have same time stamp of 10.0
% yi = interp1(t,y,ti);

% Remove last three values
yr = y(1:end-3,:);
tr = t(1:end-3);

% For value at t=10.0, use middle one of three values.
yr = [yr;y(end-1,:)];
tr = [tr;t(end-1)];

yi = interp1(tr,yr,ti);

% Visually check results (use zoom tool to look at first few points,
% middle, and end points). Also compare with values in second col. file.
figure(1);clf;
    plot(tr,yr(:,1),'k.','MarkerSize',20);
    hold on;
    plot(ti,yi(:,1),'g.','MarkerSize',10);
    xlabel('time [s]');
    ylabel('y [m]')
    legend('y_1 Measured','y_1 Interpolated')

% Visually check results (use zoom tool to look at first few points,
% middle, and end points).  Also compare with values in last col. of file.
figure(2);clf;
    plot(tr,yr(:,end),'k.','MarkerSize',20);
    hold on;
    plot(ti,yi(:,end),'g.','MarkerSize',10);
    xlabel('time [s]');
    ylabel('y [m]')
    legend('v_3 Measured','v_3 Interpolated')

fid = fopen('particles3interpolated.txt','w');
M = [ti,yi]';
fprintf(fid,'%g %g %g %g %g %g %g %g %g %g %g %g %g\n',M);
fclose(fid);

clear;

% Load file and create plots to compare with figure 1 and figure 2
% to make sure file was saved in correct format.
load particles3interpolated.txt
t = particles3interpolated(:,1);
y = particles3interpolated(:,2:end);

figure(3);
    plot(t,y(:,1),'k.','MarkerSize',20);
    xlabel('time [s]');
    ylabel('y [m]')
    legend('y_1 Interpolated from file')

figure(4);clf;
    plot(t,y(:,end),'k.','MarkerSize',20);
    xlabel('time [s]');
    ylabel('y [m]')
    legend('v_3 Interpolated from file')
