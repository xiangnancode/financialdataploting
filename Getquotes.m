function [outdata,  outquotes] = Getquotes(indata, inquotes)
%   [outdata,  outquotes, pasttime] = Getquotes(indata, inquotes)
inquotes(:,1) = inquotes(:,1) - indata(1);
while (inquotes(1) < 0 && size(inquotes,1) > 1)
    ontimequote = inquotes(1,:);
    inquotes(1,:) = [];
end
inquotes = [ontimequote; inquotes];
inquotes(:,1) = inquotes(:,1) + indata(1);

outdata = ontimequote(2:3);
outquotes = inquotes;
end

