function county_info = get_county_info_by_state(database, name, population)
state_name = database.dbfdata(:, 5);
county_name = database.dbfdata(:, 7);
count = 1;
flag = 0;
dictionary_number = size(population.data);
dictionary_number = dictionary_number(1, 1);
for i = 1:3148
    if strcmp(state_name{i}, name)
        if flag == 0
            start = i;
            flag = 1;
        end
    end
    if ~strcmp(state_name{i}, name)
        if flag == 1
            End = i - 1;
            break
        end
    end
end
for i = start:End
    county_info(count).name = county_name(i, 1);
    county_info(count).border = cell2num(database.ncst(i, 1));
    for j = i - start + 1:dictionary_number
        if strcmp(population.name{j}, name)
            pos = j;
            county_info(count).pop = population.data(pos, 5);
        end
    end
    count = count + 1;
end
end