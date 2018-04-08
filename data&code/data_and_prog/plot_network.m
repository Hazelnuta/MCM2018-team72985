function plot_network(county_info)
figure
county = [];
for i = 1:51
    data = cell2num(county_info(i).MBR);
    center = [(data(:, 1) + data(:, 3))./2, (data(:, 2) + data(:, 4))./2];
    county = [county; center];
end
number = size(county);
number = number(1, 1);
scatter(county(:, 1), county(:, 2), 'ro');hold on
for i = 1:number
    for j = 1:number
        plot(county(i,:), county(i,:));
        hold on
    end
end
end