function result = get_MBR(data)
x = [data(1, 1), data(1, 1), data(1, 3), data(1, 3), data(1, 1)];
y = [data(1, 2), data(1, 4), data(1, 4), data(1, 2), data(1, 2)];
result = [x; y]';
end