function result = urban(total, urban)
result = [];
for i = 1:2143
    area = cell2num(urban(i, 1));
    for j = 1:5000
        polygon = get_polygon(area);
        if inpolygon(total(j, 1), total(j, 2), polygon(:, 1), polygon(:,2))
            result = [result; total(j, :)];
        end
    end
end
end