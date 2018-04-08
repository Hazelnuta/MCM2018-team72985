function res = get_taz_by_county(taz_by_state, county_info_raw, state_car, state_ev)
count = 1;
for i = 1:51
    number = size(taz_by_state(i).taz);
    number = number(1, 2);
    for j = 1:number
        res(count).data = taz_by_state(i).taz(j).affi_county;
        res(count).pop = cell2num(county_info_raw.content(res(count).data, 9));
        res(count).car = state_car(i, 1);
        res(count).ev = state_ev(i, 1);
        count = count + 1;
    end
end