function pointset = get_dataset(raw_data, number)
i = 1;
pointset = zeros(number,2);
count = 0;
while i < 52
    state = raw_data(i).taz_in_state;
    taz_state_size = size(state);
    taz_number = taz_state_size(1, 1);
    for  j = 1:taz_number
        pointset(count + j, :) = state(j, :);
    end
    count = count + taz_number;
    i = i + 1;
end
end