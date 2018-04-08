function U = recover(fcm_result)
a = [14411, 14411, 14411, 14411, 14411, 14411, 14410, 14410, 14410, 14410, 14410, 14410, 14410, 14410,  14410];
U = zeros(216156, 5);
for i = 1:15
    tmp =  fcm_result(i).affi;
    for j = 1:a(1, i)
        U(15*(j - 1)+1 + i, :) = tmp(j, :);
    end
end
end