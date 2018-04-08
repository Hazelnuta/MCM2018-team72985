function result = suburban(urban_data, weight, urban)
result = [];
for i = 1:2143
    area = cell2num(urban_data(i, 1));
    mn = mean(area);
    area = area - mn;
    area = area*2.3;
    area = area + mn;
    for j = 1:5000
        polygon1 = get_polygon(area);
        if inpolygon(weight(j, 1), weight(j, 2), polygon1(:, 1), polygon1(:,2)) 
            if ismember(weight(j, :), urban)==0
                result = [result; weight(j, :)];
            end
        end
    end
end