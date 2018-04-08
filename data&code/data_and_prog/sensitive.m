function [result1, result2, result3, result4] = sensitive(a_ini, th_ini, county_raw_info, state_car, des_ultimate_number, sp_ultimate_number)
a = 0.05:0.005:0.5;
result1 = [];
result2 = [];
result3 = [];
result4 = [];
thresh = th_ini;
for i = 1:(0.5 - 0.05)/0.005
    i
    [~, ~, iteration, charger] = TRY(a(1, i), 3133, thresh, 0.15, county_raw_info, state_car, des_ultimate_number, sp_ultimate_number);
    result1 = [result1; iteration];
    result3 = [result3; charger];
    iteration
    charger
end
thresh = th_ini-2500:10:th_ini+2500;
for i = 1:500
    i
    [~, ~, iteration] = TRY(a_ini, 3133, thresh(1, i), 0.15, county_raw_info, state_car, des_ultimate_number, sp_ultimate_number);
    result2 = [result2; iteration];
    result4 = [result4; charger];
    iteration
    charger
end
end