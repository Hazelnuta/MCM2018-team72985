function [a_sequence, charger_sequence, iteration, charger_number_record] = TRY(a_initial, county_num, thresh, network_thresh, county_raw_info, state_car, des_ultimate_number, sp_ultimate_number)
    a = a_initial;
    charger_sequence =[];
    a_sequence = [a_initial];
    destination_set = cell(1, county_num);
    iteration = 0;
    total_car = 0;
    %networ_candidate = cell(1, county_num);
    for i = 1:county_num
        county(i).number = 0;
        county(i).pop = cell2num(county_raw_info.content(i, 9));
        state_number = cell2num(county_raw_info.content(i, 10));
        county(i).acp = state_car(state_number, 1);
        total_car = total_car + county(i).acp * county(i).pop;
        county(i).k = des_ultimate_number(i, 1);
    end
    while a < 1
        charger_number_record = 0;
        iteration = iteration + 1;
%         disp('iteration')
%         disp(iteration);
%         disp(a);
        for i = 1:county_num
            if a*county(i).pop*county(i).acp > thresh
                destination_set{i} = i;
                county(i).number = a*county(i).k;
                charger_number_record = charger_number_record + a*county(i).k;
            end
        end
        if a > network_thresh
            charger_number_record = charger_number_record + a * sp_ultimate_number;
        end
        charger_sequence = [charger_sequence; charger_number_record];
        a = exp(0.06*30.32 + 0.92*log(2.54) + 0.33*log(a*charger_number_record) + 0.19*log(55.17) + 23.08*log(519.3) - 1.52*log(66817.2) + 0.12*log(93.5) - 134.36);
        a_sequence = [a_sequence; a];
                if a == 0 
                    iteration = 0;
                    break
                end
                if abs(a_sequence(end, 1) - a_sequence(end - 1, 1))<0.001
                    break
                end
     end
end              