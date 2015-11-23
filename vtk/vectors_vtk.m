clear;
fid = fopen('vectors_vtk.vtk','w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Vectors on STRUCTURED_POINTS grid using MATLAB\n');
fprintf(fid,'ASCII\n');

x = [-1:1:1];
y = [-1:1:1];
z = [-1:1:1];

fprintf(fid,'DATASET STRUCTURED_POINTS\n');
fprintf(fid,'DIMENSIONS %d %d %d\n',length(x),length(y),length(z));
fprintf(fid,'ORIGIN %f %f %f\n',x(1),y(1),z(1));
fprintf(fid,'SPACING 1.0 1.0 1.0\n');

fprintf(fid,'POINT_DATA %d\n',length(x)*length(y)*length(z));
fprintf(fid,'VECTORS MagneticField float\n');

l = 1;
for k = 1:length(z)
    for j = 1:length(y)
        for i = 1:length(x)
            V(l,:) = [x(i),y(j),10.0*z(k)];
            l = l+1;
        end
    end
end

for i = 1:size(V,1)
    fprintf(fid,'%f %f %f\n',V(i,1),V(i,2),V(i,3));
end

%Above without a loop:
%fprintf(fid,'%e %e %e\n',V');

fclose(fid);
type vectors_vtk.vtk



