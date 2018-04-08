function bag = korea(urban_info)
bag = [];
poly = get_MBR([125.081802368164,33.1120834350586,130.940414428711,38.6121520996096]);
for i = 1:2143
    point = cell2num(urban_info.ncst(i, 1));
    if inpolygon(point(1, 1), point(1, 2), poly(:, 1),  poly(:, 2))
        bag = [bag; point];
    end
end
end