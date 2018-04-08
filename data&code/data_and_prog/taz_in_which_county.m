function result1= taz_in_which_county(all_taz_point, county_info)
count = 1;
for i = 1:51
    county_number = size(county_info(i).MBR);
    county_number = county_number(1, 1);
    taz_in_state = all_taz_point(i).taz_in_state;
    taz_number = size(taz_in_state);
    taz_number = taz_number(1, 1);
    for j = 1:county_number
%         disp('county: ');
%         disp(j);
        polygon = get_MBR(cell2num(county_info(i).MBR(j,:)));
        plot(polygon(:, 1), polygon(:, 2));
        hold on;
        for k = 1:taz_number
            test = size(polygon);
            test = test(1, 1);
            if test == 0
                disp('warning')
                continue
            end
            if inpolygon(taz_in_state(k, 1), taz_in_state(k, 2), polygon(:, 1), polygon(:, 2))
                result1(i).taz(k).affi_county = j;
%                 disp('taz: ');
%                 disp(k);
            end
            count = count + 1;
        end
    end
end
end