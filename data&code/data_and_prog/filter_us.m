function result = filter_us(data, border)
number = size(data);
number = number(1, 1);
is_in = inpolygon(data(:, 2), data(:, 1), border(:, 1), border(:, 2));
result = [];
for i = 1:number
    if is_in(i, 1) == 1
        result = [result; data(i, :)];
    end
end
end