function [ RealisedPnL ] = CalRealisedPnL(side, clientprice, tradeamount )
%   [ RealisedPnL ] = CalRealisedPnL( side, clientprice, tradeamount )
vwap_sell = CalVWAP(side, clientprice, tradeamount, -1);
vwap_buy = CalVWAP(side, clientprice, tradeamount, 1);

NetOpenPosition = CalNetOpenPosition(side, tradeamount);
buyamount = sum( (side == 1) .* tradeamount);
sellamount = sum( (side == -1) .* tradeamount);

if NetOpenPosition > 0
    RealisedPnL = (vwap_sell - vwap_buy) / vwap_buy * buyamount;
elseif NetOpenPosition < 0
    RealisedPnL = (vwap_sell - vwap_buy) / vwap_sell * sellamount;
else
    RealisedPnL = 0;
end

end

