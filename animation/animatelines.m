clear;clf

x = [1:10];
y = [1:10];
for frame = 1:10
   
   % Ca is a three-element (rgb) array used as an argument to
   % plot for the line color.
   Ca = [frame/10 frame/10 frame/10];
   plot(x,y*frame,'-','LineWidth',3,'Color',Ca);
   hold on; % Don't clear figure when next plot command issued.

   % Tells MATLAB to render immediately.  If this is not done,
   % and plots happen quickly, MATLAB may wait until things slow down
   % before rendering.
   drawnow; 

   % Uncomment the following to make MATLAB wait until you 
   % hit enter to show the next plot.  Useful for debugging.
   %input('Continue?');

   % Set axis limits.  See help axis.
   axis([1 10 0 100]);

   % Create a filename for the image.  %02d means "a 2 digit integer that is
   % zero padded, e.g., 01, 02, 03, ...
   fname = sprintf('lines_%02d.png',frame)

   print('-dpng',fname);
end