function [ vwap ] = CalVWAP( side, clientprice, tradeamount, buyorsell )
%   [ vwap ] = CalVWAP( side, clientprice, tradeamount, buyorsell )
if buyorsell == 1
    side = side == 1;
elseif buyorsell == -1
    side = side == -1;
end
tradeamount = side .* tradeamount;
if dot(tradeamount, clientprice) == 0
    vwap = 0;
    return;
end
vwap = dot(tradeamount, clientprice) / sum(tradeamount);

end

