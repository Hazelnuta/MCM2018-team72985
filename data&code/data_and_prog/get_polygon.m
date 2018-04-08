function result = get_polygon(data)
cen = mean(data);
ang = atan2(data(:, 1) - cen(1), data(:, 2) - cen(2));
data = [data, ang];
data = sortrows(data, 3);
result = [data(:, 1) data(:, 2)];
result = [result; result(1, :)];
end
