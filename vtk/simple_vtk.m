
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method 1.  Write each line but do not use format strings (%f, %d, etc.)
clear;
outfile = 'simple_vtk_method_1.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with one polyline and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA');
fprintf(fid,'POINTS 3 float');
fprintf(fid,'0.0 0.0 0.0\n');
fprintf(fid,'1.0 0.0 0.0\n');
fprintf(fid,'1.0 1.0 0.0\n');
fprintf(fid,'\n');
fprintf(fid,'LINES 1 4\n');
fprintf(fid,'3 0 1 2\n');

% Close the file
fclose(fid);

% Display the contents of outfile to screen
type(outfile);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method 2.  Write each line and use format strings (%f, %d, etc.)
clear;
outfile = 'simple_vtk_method_2.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with one polyline and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA');
fprintf(fid,'POINTS %d float',3);
fprintf(fid,'%f %f %f\n',0.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 1.0, 0.0');
fprintf(fid,'LINES %d %d\n',1,4);
fprintf(fid,'%d %d %d %d\n',3, 0, 1, 2);
fclose(fid);
type(outfile);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method 3.  Use format strings (%f, %d, etc.) and use variable
% references in fprintf (instead of literal numbers).
clear;

 % Each row is a (x,y,z) value for a point.
P = [0.0, 0.0, 0.0; 1.0, 0.0, 0.0; 1.0, 1.0, 0.0];
Npts = size(P,1);

outfile = 'simple_vtk_method_3.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with one polyline and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA');
fprintf(fid,'POINTS %d float',Npts);
fprintf(fid,'%f %f %f\n',P(1,1),P(1,2),P(1,3));
fprintf(fid,'%f %f %f\n',P(2,1),P(2,2),P(2,3));
fprintf(fid,'%f %f %f\n',P(3,1),P(3,2),P(3,3));
fprintf(fid,'LINES %d %d\n',1,4);
fprintf(fid,'%d %d %d %d\n',3, 0, 1, 2);
fclose(fid);
type(outfile);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that the last two lines printed could be re-written as
% lines = [0:2];
% fprintf(fid,'LINES %d %d\n',1,length(lines) + 1);
% fprintf(fid,'%d %d %d %d\n',length(lines), lines(1), lines(2), lines(3));
