function result = get_2017_charger(clustering_info, charger_num)
%cur_charger = get_2017_charger(clustering_info, 3491, centers)
tmp = clustering_info;
for i = 1:charger_num
    [~, pos] = max(tmp.weight);
    result(i).weight = clustering_info(pos).weight;
    result(i).size = clustering_info(pos).size;
    result(i).coordi = clustering_info(pos).centers;
    tmp(pos).weight = 0;
end
end