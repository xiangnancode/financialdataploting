function [ position ] = passedtime(data, i)
%   [ position ] = passedtime(data, i)

time = data(:,1);
time = time - time(1);

position = round(time(i) / time(end) * 30000 );

end

