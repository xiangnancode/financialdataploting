function [ outvector ] = notradeuntill(position, invector)
%    [ outvector ] = notradeuntill(position, invector)
outvector = invector;
if position == 0
    return
end
diff = position - size(invector, 1);
append = zeros(diff, 1) + invector(end);
outvector = [outvector; append];
end

