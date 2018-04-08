function result = divide_fcm(data, time1, time2)
for j = 1:time1
    cur = j;
    number = size(data);
    number = number(1, 1);
    data_part = [];
    while cur <= number
        data_part = [data_part; data(cur, :)];
        cur = cur + time1;
    end
    [result(j).centers, affiliation_tmp] = fcm(data_part, 100, 50);
    affiliation_tmp = affiliation_tmp';
    number = size(affiliation_tmp);
    number = number(1, 1);
    affi = [];
    for i = 1:number
        temp = get_most_n(affiliation_tmp(i, :), time2);
        affi = [affi; temp];
    end
    clear affiliation_tmp;
    result(j).affi = affi;
end     
end