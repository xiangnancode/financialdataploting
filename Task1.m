clear all
Trade = readtable('ExampleTradesMar2016.csv');
QuotesEURUSD = readtable('ExampleQuotesEURUSDMar2016.csv');
QuotesGBPUSD = readtable('ExampleQuotesGBPUSDMar2016.csv');
QuotesEURGBP = readtable('ExampleQuotesEURGBPMar2016.csv');

EURUSD = strcmp(Trade.sym,'EURUSD');
GBPUSD = strcmp(Trade.sym,'GBPUSD');
EURGBP = strcmp(Trade.sym,'EURGBP');
% EURGBP = 1, GBPUSD = 2, EURGBP = 3
sym = EURUSD + 2*GBPUSD + 3*EURGBP;

data = [datenum(Trade.time,'yyyy-mm-ddTHH:MM:SS.FFF') sym Trade.Side Trade.Amount Trade.ClientPrice];
quotes1 = [datenum(QuotesEURUSD.time,'yyyy-mm-ddTHH:MM:SS.FFF') QuotesEURUSD.bid QuotesEURUSD.ask];
quotes2 = [datenum(QuotesGBPUSD.time,'yyyy-mm-ddTHH:MM:SS.FFF') QuotesGBPUSD.bid QuotesGBPUSD.ask];
quotes3 = [datenum(QuotesEURGBP.time,'yyyy-mm-ddTHH:MM:SS.FFF') QuotesEURGBP.bid QuotesEURGBP.ask];

PlotNetOpenPosition = [0];
PlotRealisedPnL = [0];
PlotUnRealisedPnL = [0];

for i = 1 : size(data, 1)
    if (data(i,2) == 1)
        [data(i,6:7), quotes1] = Getquotes(data(i,:), quotes1);
    elseif (data(i,2) == 2)
        [data(i,6:7), quotes2] = Getquotes(data(i,:), quotes2);
    elseif (data(i,2) == 3)
        [data(i,6:7), quotes3] = Getquotes(data(i,:), quotes3);
    end
%     PlotNetOpenPosition = notrade(passedtime, PlotNetOpenPosition);
%     PlotRealisedPnL = notrade(passedtime, PlotRealisedPnL);
%     PlotUnRealisedPnL = notrade(passedtime, PlotUnRealisedPnL);
    PlotNetOpenPosition = [PlotNetOpenPosition CalNetOpenPosition(data(1:i,3), data(1:i,4))];
    PlotRealisedPnL = [PlotRealisedPnL CalRealisedPnL(data(1:i,3), data(1:i,5), data(1:i,4))];
    PlotUnRealisedPnL = [PlotUnRealisedPnL CalUnRealisedPnL(data(1:i,3), data(1:i,5), mean(data(i,6:7)), data(1:i,4))];
end


% figure;
% plot(PlotNetOpenPosition);
% figure;
% plot(PlotRealisedPnL);
% figure;
% plot(PlotUnRealisedPnL);