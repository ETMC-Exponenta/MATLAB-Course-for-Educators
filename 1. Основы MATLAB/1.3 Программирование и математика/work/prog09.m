figure; grid on, hold on;
% main figure
plot([-1 0],[0 1],...
    [0 1],[ -1 0],...
    'Color',[0 0.447 0.741],...
    'LineWidth',3);
% limits
plot([-1 -1],[-1.1 1.1],...
    [1 1],[-1.1 1.1],...
    'Color','k',...
    'LineWidth',0.5,...
    'LineStyle','--');
% left-right figures
plot([-1 0]-2,[0 1],...
    [0 1]-2,[ -1 0],...
    [-1 0]+2,[0 1],...
    [0 1]+2,[ -1 0],...
    'Color',[0 0.447 0.741],...
    'LineWidth',0.5);
% solid markers
plot([-1 0],[0 -1],...
    'LineStyle','none',...
    'Marker','o',...
    'MarkerSize',6,...
    'MarkerEdgeColor',[0 0.447 0.741],...
    'MarkerFaceColor',[0 0.447 0.741])
% empty markers
plot([0 1],[1 0],...
    'LineStyle','none',...
    'Marker','o',...
    'MarkerSize',6,...
    'MarkerEdgeColor',[0 0.447 0.741],...
    'MarkerFaceColor','w')
set(gca,...
    'XLim',[-3.1,3.1],...
    'YLim',[-1.1,1.1],...
    'XAxisLocation','origin',...
    'YAxisLocation','origin',...
    'DataAspectRatio',[1 1 1])