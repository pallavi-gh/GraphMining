cluster1=[];
cluster2=[];
cluster3=[];
cluster4=[];
cluster5=[];
cluster6=[];
load('ksc_output_Twt.mat');
load('listkeywordsnew.mat');
for i=1:n/2 -1
    if ksc(i)==1
        cluster1=strvcat(cluster1,keylist(i,:));
    elseif ksc(i)==2
        cluster2=strvcat(cluster2,keylist(i,:));
    elseif ksc(i)==3
        cluster3=strvcat(cluster3,keylist(i,:));
    elseif ksc(i)==4
        cluster4=strvcat(cluster4,keylist(i,:));
    elseif ksc(i)==5
        cluster5=strvcat(cluster5,keylist(i,:));
    elseif ksc(i)==6
        cluster6=strvcat(cluster6,keylist(i,:));
    end
end
save('findkeylistcluster.mat');
    