
fid = fopen('NuGen.txt','r');
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