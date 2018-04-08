function result = county_find_state(county_raw_data)
number = size(county_raw_data.content);
number = number(1, 1);
record1 = 1;
record2 = 0;
for i = 1:number
    state_num = cell2num(county_raw_data.content(i, 10));
    if state_num ~= record1
        record1 = state_num;
        record2 = i;
    end
    result(state_num).MBR(i - record2 + 1, :) = county_raw_data.content(i, 3:6);
    result(state_num).id(i - record2 + 1, 1)  = i;
end