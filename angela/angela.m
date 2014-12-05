clear;
fid = fopen('a.csv');
i = 1;
line = fgetl(fid);
line = fgetl(fid);
line = fgetl(fid);

while (1)
    line = fgetl(fid);
    if ~ischar(line)
        break;
    end
    fprintf('%02d Original: %s\n',i,line);
    line = regexprep(line,'NONE','0');
    line = regexprep(line,'none','0');

    line = regexprep(line,'SA','0');

    line = regexprep(line,'VH','1');
    line = regexprep(line,'RS','2');
    line = regexprep(line,'GF','3');
    line = regexprep(line,'IN','4');
    line = regexprep(line,'NA','5');

    line = regexprep(line,'A','1','ignorecase');
    line = regexprep(line,'B','2','ignorecase');
    line = regexprep(line,'C','3','ignorecase');
    line = regexprep(line,'D','4','ignorecase');
    line = regexprep(line,'E','5','ignorecase');
    line = regexprep(line,'F','6','ignorecase');
    line = regexprep(line,'W','7','ignorecase');

    line = regexprep(line,'-,',',');
    line = regexprep(line,'+,',',');

    line = regexprep(line,'^,','-1,');
    line = regexprep(line,',$',',-1');

    fprintf('%02d Modified: %s\n',i,line);

    if (1)
        line = regexprep(line,',,',',-1,');
        fprintf('%02d Modified: %s\n',i,line);
        line = regexprep(line,',,',',-1,');
        fprintf('%02d Modified: %s\n',i,line);
    end
    b(i,:) = str2num(line);
    fprintf('%02d Length: %d\n',i,length(b));
    fprintf('_____________________________________\n');
    
    i = i+1;

end
fclose(fid);
b(:,end) = b(:,end)*100; % Convert GPA to integer.
fprintf('G#   SECT   ENT   Q26   Q27   Q28   Q29   Q30   EXIT   Q26   Q27   Q28   Q29   Q30   GRADE   INST   GP\n');
for i = 1:size(b,1)
    fprintf('%d   ',b(i,:)');
    fprintf('\n');
end

I = find(b(:,2) == 206);
b(I,17)

I = find(b(:,3) > -1 & b(:,9) > -1); % Remove empties
figure(1);
plot(b(I,3),b(I,9),'.','MarkerSize',30);
xlabel('Entrance Score');
ylabel('Exit Score');
tmp = corrcoef(b(:,3),b(:,9));
title(sprintf('cc = %.2f',tmp(2)));
grid on;

I = find(b(:,3) > -1 & b(:,17) > -1); % Remove empties
figure(2);
plot(b(I,3),b(I,17)/100,'.','MarkerSize',30);
xlabel('Entrance Score');
ylabel('Final Grade [GPA]');
tmp = corrcoef(b(:,3),b(:,17));
title(sprintf('cc = %.2f',tmp(2)));
grid on;

I = find(b(:,9) > -1 & b(:,17) > -1); % Remove empties
figure(3);
plot(b(I,9),b(I,17)/100,'.','MarkerSize',30);
xlabel('Exit Score');
ylabel('Final Grade [GPA]');
tmp = corrcoef(b(:,9),b(:,17));
title(sprintf('cc = %.2f',tmp(2)));
grid on;

for i = 0:5
    I = find(b(:,3) > -1 & b(:,4) == i); % Remove empties
    mean(b(I,3));
    fprintf('Mean (std/sqrt(N)) of Entrance for Q26 answer of %d = %.1f (%.1f) (N=%d)\n',i,mean(b(I,3)),std(b(I,3))/sqrt(length(I)),length(I));
end

fprintf('\n');

for i = 0:5
    I = find(b(:,3) > -1 & b(:,5) == i); % Remove empties
    mean(b(I,3));
    fprintf('Mean (std/sqrt(N)) of Entrance for Q27 answer of %d = %.1f (%.1f) (N=%d)\n',i,mean(b(I,3)),std(b(I,3))/sqrt(length(I)),length(I));
end

fprintf('\n');

for i = 0:5
    I = find(b(:,3) > -1 & b(:,6) == i); % Remove empties
    mean(b(I,3));
    fprintf('Mean (std/sqrt(N)) of Entrance for Q28 answer of %d = %.1f (%.1f) (N=%d)\n',i,mean(b(I,3)),std(b(I,3))/sqrt(length(I)),length(I));
end

fprintf('\n');

for i = 0:5
    I = find(b(:,3) > -1 & b(:,7) == i); % Remove empties
    mean(b(I,3));
    fprintf('Mean (std/sqrt(N)) of Entrance for Q29 answer of %d = %.1f (%.1f) (N=%d)\n',i,mean(b(I,3)),std(b(I,3))/sqrt(length(I)),length(I));
end

fprintf('\n');

for i = 0:5
    I = find(b(:,3) > -1 & b(:,8) == i); % Remove empties
    mean(b(I,3));
    fprintf('Mean/std of Entrance for Q30 answer of %d = %.1f/%.1f (N=%d)\n',i,mean(b(I,3)),std(b(I,3))/sqrt(length(I)),length(I));
end
