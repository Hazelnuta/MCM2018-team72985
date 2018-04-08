function plot_us(coordinate)
m_grid;
for i = 1:50
    state = coordinate(i).coordi;
    longi = state(:, 2);
    lati = state(:, 1);
    m_proj('lambert','lon',[-120,-70],'lat',[20, 55]);m_plot(longi,lati,'k');
    hold on
end
hold on
end