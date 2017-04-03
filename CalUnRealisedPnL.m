function [ UnRealisedPnL ] = CalUnRealisedPnL(side, clientprice, midprice, tradeamount)
%   [ UnRealisedPnL ] = CalUnRealisedPnL(side, midprice, tradeamount)
NetOpenPosition = CalNetOpenPosition(side, tradeamount);

vwap_sell = CalVWAP(side, clientprice, tradeamount, -1);
vwap_buy = CalVWAP(side, clientprice, tradeamount, 1);

vwap_all = vwap_sell + vwap_buy;

UnRealisedPnL = (midprice - vwap_all) / vwap_all * NetOpenPosition;

end

