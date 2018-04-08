function charger_number_in_county = charger_in_county(county_raw_info, weight)
charger_number_in_county = zeros(3133, 1);
for i = 1:5000
    disp(i);
    for j = 1:3133
        rect = cell2num(county_raw_info.content(j, 3:6));
        rect = get_MBR(rect);
        if inpolygon(weight(i, 3), weight(i, 4), rect(:, 1), rect(:, 2))
            charger_number_in_county(j, 1) = charger_number_in_county(j, 1) + 1;
        end
    end
end
end