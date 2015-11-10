clf;

fid = fopen('neugen.txt','r');
s = 1; % Number of somas
a = 1; % Number of axons
d = 1; % Number of dendrites
while 1
    line = fgetl(fid);
    if ~ischar(line)
        break;
    end

    % Soma
    k = findstr('begin soma',line);
    if ~isempty(k) % Line begins with "begin soma".
        line = fgetl(fid); % Next line is (number of points - 1).
        n = str2num(line);
        tmp = [];
        for i = 1:n+1
            line = fgetl(fid);
            tmp = [tmp;str2num(line)];
        end
        S{s} = tmp;
        s = s+1;
        fgetl(fid); % Line that says "end".
    end

    % Axon
    k = findstr('begin axon',line);
    if ~isempty(k) % Line begins with "begin axon".
        line = fgetl(fid); % Parent information.
        line = fgetl(fid); % Next line is (number of points - 1).
        n = str2num(line);
        tmp = [];
        for i = 1:n+1
            line = fgetl(fid);
            tmp = [tmp;str2num(line)];
        end
        A{a} = tmp;
        a = a+1;
        fgetl(fid); % Line that says "end".
    end

    % Dendrite
    k = findstr('begin dendrite',line);
    if ~isempty(k) % Line begins with "begin dendrite".
        line = fgetl(fid); % Parent information.
        line = fgetl(fid); % Next line is (number of points - 1).
        n = str2num(line);
        tmp = [];
        for i = 1:n+1
            line = fgetl(fid);
            tmp = [tmp;str2num(line)];
        end
        D{d} = tmp;
        d = d+1;
        fgetl(fid); % Line that says "end".
    end

end
fclose(fid);

figure(11);clf;hold on;
for s = 1:length(S)
    plot3(S{s}(:,1),S{s}(:,2),S{s}(:,3),'k','LineWidth',3);
    for i = 1:size(S{s},1)-1
        plot3(S{s}(i:i+1,1),S{s}(i:i+1,2),S{s}(i:i+1,3),'k','LineWidth',eps+S{s}(i,4));
    end
end
for a = 1:length(A)
    plot3(A{a}(:,1),A{a}(:,2),A{a}(:,3),'b','LineWidth',3);
end
for d = 1:length(D)
    plot3(D{d}(:,1),D{d}(:,2),D{d}(:,3),'r','LineWidth',3);
end
view(3);
xlabel('x');
ylabel('y');
zlabel('z');
grid on;

figure(12);clf;hold on;
for s = 1:length(S)
    for i = 1:size(S{s},1)-1
        plot3(S{s}(i:i+1,1),S{s}(i:i+1,2),S{s}(i:i+1,3),'k','LineWidth',eps+S{s}(i,4));
    end
end
for a = 1:length(A)
    for i = 1:size(A{a},1)-1
        plot3(A{a}(i:i+1,1),A{a}(i:i+1,2),A{a}(i:i+1,3),'b','LineWidth',eps+10*A{a}(i,4));
    end
end
for d = 1:length(D)
    for i = 1:size(D{d},1)-1
        plot3(D{d}(i:i+1,1),D{d}(i:i+1,2),D{d}(i:i+1,3),'r','LineWidth',eps+3*D{d}(i,4));
    end
end
view(3);
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
