[keywords timeseries] = load_data('final.txt');
[a b] = load_data('annual.txt');
b = b(:,1:568);
keywords = strvcat(a,keywords);
timeseries = [b;timeseries];
periods = [];
periodsx = [];
for item = 1:23
smoothser = [];
nonsmooth = [];
movingavg = [];
movingsd = [];
window = 48;
windowsm = 8;
for i = 1:(size(timeseries,2)-window)
    smoothser = [smoothser sum(timeseries(item,i:(i+windowsm)))/windowsm];
    nonsmooth = [nonsmooth timeseries(item,i)];
    movingavg = [movingavg sum(timeseries(item,i:(i+window)))/window];
    movingsd = [movingsd std(timeseries(item,i:(i+window)))];
end
boolvec = smoothser > movingavg + 1*movingsd;
start = 0;
ending = 0;
midpts = [];
for i = 1:length(boolvec)
    if (boolvec(i) & ~start)
        start = i;
    end
    if (~boolvec(i) & start)
        ending = i-1;
        midpts = [midpts ceil((start + ending)/2)];
        start =0;
        ending = 0;
    end
    
end
period = 0;
for i=1:length(midpts)-1
    period = period + (midpts(i+1) - midpts(i))/(length(midpts)-1);
end
periods = [periods period];
boolvec = nonsmooth > movingavg + 1*movingsd;
start = 0;
ending = 0;
midpts = [];
for i = 1:length(boolvec)
    if (boolvec(i) & ~start)
        start = i;
    end
    if (~boolvec(i) & start)
        ending = i-1;
        midpts = [midpts ceil((start + ending)/2)];
        start =0;
        ending = 0;
    end
    
end
period = 0;
for i=1:length(midpts)-1
    period = period + (midpts(i+1) - midpts(i))/(length(midpts)-1);
end
periodsx = [periodsx period];
end

item = 3
% plot(timeseries(item,:))
% hold on 
% plot(cumsum(timeseries(item,:))./[1:length(timeseries(item,:))])
Mdl = arima(20,0,20);
EstMdl = estimate(Mdl,timeseries(item,1:300)');
[Y,E] = simulate(EstMdl,300);
plot(Y,':r')
hold on 
plot (timeseries(item,1:300)')
% figure(1)
% hist(periods)
% figure(2)
% hist(periodsx)

% 
% figure(1)
% plot(movingavg)
% hold on 
% plot(smoothser)
% hold on 
% plot(movingavg + 1*movingsd)
% hold on 
% plot( midpts,smoothser(midpts), '*')


