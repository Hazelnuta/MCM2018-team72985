function rough = get_rough(origin, time)
cur_num = 1;
total = size(origin);
total = total(1, 1);
rough = [];
while cur_num < total
    rough = [rough; origin(cur_num, :)];
    cur_num = cur_num + time;
end
end