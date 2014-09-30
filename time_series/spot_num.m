% Easy way to download file (Linux and OS-X usually have curl
% !curl http://solarscience.msfc.nasa.gov/greenwch/spot_num.txt > spot_num.txt

% Save the file to the working directory and then
% delete the header from the file using a text editor.
clear;

load spot_num_modified.txt
d = spot_num_modified;           % Use a shorter name
t = d(:,1)+d(:,2)/12;   % time is year + fraction of year.

% Plot the Sunspot number only
figure(1);
% Clear any existing plots in this window.
clf;
% Plot all rows and the third column (The ":" means all rows)
% Rarely should you use the default LineWidth (which is 1)
plot(t,d(:,3),'r','LineWidth',3);
legend('Sunspot # Monthly Average');
xlabel('Date [Fractional Year]');
grid on;
title('http://solarscience.msfc.nasa.gov/greenwch/spot\_num.txt')
set(gca,'XLim',[1745,2015])
print -dpng spot_num_tseries.png

% Perhaps the data will be more clear if fill is used.
figure(2);
clf;
area(t,d(:,3));
% Important: Use consistent labels on legends.
legend('Sunspot # Monthly Average');
xlabel('Date [Fractional Year]');
grid on;
title('http://solarscience.msfc.nasa.gov/greenwch/spot\_num.txt')
% Use same limits as previous plot.
set(gca,'XLim',[1745,2015]);
print -dpng spot_num_tseries_area.png

break
% Show plot in figure window named "1".
figure(1);
% Clear any existing plots in this window.
clf;
% Plot all rows and the third column (The ":" means all rows)
% Rarely should you use the default LineWidth (which is 1)
plot(t,d(:,3),'r','LineWidth',3); 
% Tell MATLAB to not clear figure before next plot command.
hold on;
% Plot all rows and the fourth column (The ":" means all rows)
plot(t,d(:,4),'g','LineWidth',3);
% Add Legend
legend('Sunspot # Monthly Average','Sunspot # Monthly STD');
% Add label on horizontal axis
xlabel('Date [Fractional Year]');
% Show a grid
grid on;
% Add a title that references the data source
title('http://solarscience.msfc.nasa.gov/greenwch/spot\_num.txt');
% Manually set x-limits.
set(gca,'XLim',[1745,2015])
% Save figure as an image.
print -dpng spot_num_tseries_both.png


% It seems that the standard deviation and sunspot number are correlated.
% Plot one versus the other to see the relationship more clearly.

figure(7)
plot(t,cumsum(d(:,3)));
legend('Cumulative Sum of SSN Monthly Average');
xlabel('Date [Fractional Year]');
grid on;
title('http://solarscience.msfc.nasa.gov/greenwch/spot\_num.txt')
set(gca,'XLim',[1745,2015])
print -dpng spot_num_tseries_cumsum.png


figure(3);
title('http://solarscience.msfc.nasa.gov/greenwch/spot\_num.txt')
plot(d(:,3),d(:,4),'.','MarkerSize',10);
grid on;
xlabel('SSN Monthly Average');
ylabel('SSN Monthly STD');
print -dpng spot_num_tseries.png

figure(4);
ssn = d(:,3);
ssnr = reshape(ssn(1:24*11*12),12*11,24);
imagesc(ssnr);
ch = colorbar;
th = get(ch,'Title');
set(th,'String','SSN')
ylabel('Month in 11-year Cycle');
xlabel('Cycle Number');

figure(5)
t = [1:24*11*12];
x = sin(2*pi*t/(11*12));
xr = reshape(x,11*12,24);
imagesc(xr);
ch = colorbar;
th = get(ch,'Title');
set(th,'String','A')

title('A = sin(2\pi*t/(11*12)), t=[1:24*11*12]');
ylabel('Month in 11-year Cycle')
xlabel('Cycle Number');
break