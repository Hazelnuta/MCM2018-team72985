function final = netword_heat(state_info, number, state_pop)
node = [];
for i = 1:number
    data = cell2num(state_info.ncst(i, 1));
    inner_number = size(data);
    inner_number = inner_number(1, 1);
    points = [0, 0];
    for j = 1:inner_number
        if data(j, 1) > -200 && data(j, 1)<200 && data(j, 2) > -200 && data(j, 2) < 200
            points = points + data(j, :);
        end
    end
    points = points./inner_number;
    node = [node; points];
end  
scatter(node(:, 1), node(:, 2), '.');
dic = [];
for i = 1:number
    num = state_pop(i, 1);
    for j = 1:num
        dic = [dic; i];
    end
end
total = size(dic);
total = total(1, 1)
final = [];
for i = 1:10000
    START = dic(ceil(total*rand(1, 1)), 1);
    while START == 2 || START == 12
        START = dic(ceil(total*rand(1, 1)), 1);
    end
    END = dic(ceil(total*rand(1, 1)), 1);
    while END == 2 || END == 12
        END = dic(ceil(total*rand(1, 1)), 1);
    end
    POWER = 50 + 250*rand(1, 1);
    START_coordi = node(START, :);
    END_coordi = node(END, :);
    dis = ((START_coordi(1, 1) - END_coordi(1, 1))^2 + (START_coordi(1, 2) - END_coordi(1, 2))^2)^(1/2)
    way = mod(POWER,dis*111.11);
    way = way/111.11;
    des = START_coordi + way*(END_coordi - START_coordi);
    final = [final; des];
end
end