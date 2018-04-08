function [maxtrix22, affi2] = adjust_center(matrix1, matrix2, affi, cluster_num, point_num)
result = zeros(cluster_num, cluster_num);
for i = 1:cluster_num
    for j = 1:cluster_num
        result(i, j) = ((matrix1(i, 1) - matrix2(j, 1))^2 + (matrix1(i, 2) - matrix2(j, 2))^2)^(1/2);
    end
end
real_pos = zeros(cluster_num, 1);
for i = 1:cluster_num
    [~, tmp] = min(result(:, i));
    real_pos(i, 1) = tmp;
    result(tmp, :) = 100000;
end
maxtrix22 = zeros(cluster_num, 2);
affi2 = zeros(point_num, 5);
for i = 1:cluster_num
    maxtrix22(real_pos(i), :) = matrix2(i, :);
end
for i = 1:point_num
    for j = 1:5
        affi2(i, j) = real_pos(affi(i, j), 1);
    end
end
end