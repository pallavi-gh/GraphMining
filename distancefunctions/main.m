[keywords timeseries] = load_data('final.txt');
[a b] = load_data('annual.txt');
b = b(:,1:568);
keywords = strvcat(a,keywords);
timeseries = [b;timeseries];
[c d] = load_data('biannual.txt');
d = d(:,1:568);
keywords = strvcat(c,keywords);
timeseries = [d;timeseries];
distances = [];

b = timeseries./repmat(max(timeseries, [], 2),[1 size(timeseries,2)]);
[ksc cent] = ksc_toy(timeseries, 6);
size(cent)
fprintf('2');
size(ksc)
save('ksc_output.mat');
figure;
for i=1:6
  subplot(2,3,i);
  plot(cent(i,:));
  title('ksc');
  axis([0 130 0 1.2 * max(cent(i,:))]);
end
cluster1 = keywords(ksc==1,:);
cluster2 = keywords(ksc==2,:);
cluster3 = keywords(ksc==3,:);
cluster4 = keywords(ksc==4,:);
cluster5 = keywords(ksc==5,:);
cluster6 = keywords(ksc==6,:);
