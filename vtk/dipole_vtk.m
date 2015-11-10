clear;
fid = fopen('dipole_vtk.vtk','w');
fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Dipole Field\n');
fprintf(fid,'ASCII\n');

x = [-10:1:10];
y = [-10:1:10];
z = [-10:1:10];

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
            p(l,:) = [x(i),y(j),z(k)];
            l = l+1;
        end
    end
end

b = B_dipole(p);

b(isnan(b)) = 0;
fprintf(fid,'%e %e %e\n',b');
fclose(fid);
type dipole_vtk.vtk

