function distance = get_diff_distance(pointset1 ,pointset2, size)
result = zeros(size, size);
for i = 1:size
    for j = 1:size
        result(i, j) = ((pointset1(i, 1) - pointset2(j, 1))^2 + (pointset1(i, 2) - pointset2(j, 2))^2)^(1/2);
    end
end
figure
distance = 0;
for i = 1:size
    dis = min(result(:, i));
    if dis > 0.7
        dis = 0;
    end
    distance = distance + dis;
end
distance = distance/size;
end