function result = get_county_coordinate(database, origin)
result = origin;
all_rough_bound = database.mbr(:, :);
for i = 1:3148
    all_coordi(i).coordi = cell2num(database.ncst(i, 1));
end
name_list = database.dbfdata(:, 7);
for i = 1:51
    county_number = size(result(i).data);
    county_number = county_number(1, 1);
    for j = 1:county_number
        for k = 1:3148
            if strcmp(name_list{k, 1}, result(i).name{j, 1})
                result(i).coordi(j).border = all_coordi(k).coordi;
                result(i).coordi(j).rough = all_rough_bound(k, :);
                test = size(all_rough_bound(k, :));
                test = test(1, 1);
                if test == 0
                    disp('warning')
                end
                name_list{k, 1} = 'done';
            end
        end
    end
end         
end