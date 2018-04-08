function result = get_most_n(vec, n)
result = [];
for i = 1:n
    [~, b] = max(vec);
    result = [result, b];
    vec(1, b) = min(vec);
end