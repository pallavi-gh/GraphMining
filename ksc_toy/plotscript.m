    cluster = 4
temp = []
counter = 0
for i = 1:size(X(ksc == cluster,:),1)
    counter = counter + 1
    subplot(10, 1, counter)
    temp = X(ksc == cluster,:)
    plot(temp(i,:))
    if counter == 10
        counter = 0
        figure(i);
    end
end
