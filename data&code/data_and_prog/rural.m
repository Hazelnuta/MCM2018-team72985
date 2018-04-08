function result = rural(urban, suburban, weight)
result = [];
for i = 1:5000
    point = weight(i, 3:4);
    if ~ismember(point, urban)
        if ~ismember(point, suburban)
            result = [result; point];
        end
    end
end
end