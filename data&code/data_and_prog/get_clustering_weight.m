function result = get_clustering_weight(fcm_result, taz_num, taz_by_county, clustering_number, affi_top_n)
%clustering_info = get_clustering_weight(fcm_result, taz_count, taz_info, 5000, 5)
result = zeros(clustering_number, 4);
real_centers = zeros(clustering_number, 2);
U = recover(fcm_result);
size(U);
for i = 1:15
    real_centers = real_centers + fcm_result(i).centers;
end
real_centers = real_centers./15;
for i = 1:taz_num
    cur_affi = U(i, :);
    for j = 1:affi_top_n
        if cur_affi(1, j) == 0
            continue
        end
        test = taz_by_county(i).pop .* taz_by_county(i).car .* taz_by_county(i).ev;
        result(cur_affi(1, j), 2) = result(cur_affi(1, j), 2) + 1;
        tmp = cur_affi(1, j);
        try
            result(tmp, 1) =  test/10000 + result(tmp, 1);
        end
        disp(result(tmp, 1));
    end
end  
weight_sum = 0;
for i = 1:clustering_number
    weight_sum = weight_sum + result(i, 1);
end
for i = 1:clustering_number
    result(i, 1) = result(i, 1)/weight_sum;
    result(i, 3:4) = real_centers(i, :);
end
end