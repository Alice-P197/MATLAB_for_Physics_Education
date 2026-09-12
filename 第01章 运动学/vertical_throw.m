clc; clear; close all;
%% 速度动画
v0 = input('初速度：');

g = 10;           % 重力加速度 (m/s^2)
tm = 2*v0/g;      % 总运动时间
t = linspace(0, tm, 100);
% 坐标范围
range =v0^2/2/g;
xlim = [-range, range];
ylim = [-range, range];
% 速度箭头缩放因子：最大速度 v0 对应箭头长度 2 个单位
arrowScale = range*2*0.1 / v0;
% 创建白色背景的图形窗口
figure('Color', 'w', 'Position', [500 200 600 600]);
for i = 1:length(t)
    % 当前时刻的高度和速度
    H = v0*t(i) - 0.5*g*t(i)^2;
    v = v0 - g*t(i);
    % 清空坐标区并保持
    cla;
    hold on;
    % ---------- 画地面 ----------
    % 地面填充（浅灰色）
    fill([xlim(1), xlim(2), xlim(2), xlim(1)], ...
         [0, 0, ylim(1), ylim(1)], ...
         [0.88, 0.88, 0.88], 'EdgeColor', 'none');
    % 地面主线
    plot([xlim(1), xlim(2)], [0, 0], 'k-', 'LineWidth', 3);
    % 地面斜线纹理
    for xx = xlim(1):0.4:xlim(2)
        plot([xx, xx-0.25], [0, -0.35], 'k-', 'LineWidth', 1);
    end
    
    % ---------- 画小球 ----------
    plot(0, H, 'bo', 'MarkerSize', 20, ...
         'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
    % ---------- 画速度箭头 ----------
    if abs(v) > 1e-3
        % 箭头起点 (0, H)，方向竖直，长度正比于 |v|
        quiver(0, H, 0, v*arrowScale, 0, ...
               'LineWidth', 2.5, 'Color', 'r', 'MaxHeadSize', 0.8);
    end
    % ---------- 显示高度和速度 ----------
    text(xlim(1)+0.2, ylim(2)-0.5, ...
         sprintf('$h = %.2f \rm{m}$', H), 'interpreter',"latex",...
         'FontSize', 14, 'Color', 'k', 'FontName', 'Times New Roman');
    text(xlim(1)+0.2, ylim(2)-1.2, ...
         sprintf('$ v = %.2f \rm{m/s}$', v), 'interpreter',"latex",...
         'FontSize', 14, 'Color', 'k', 'FontName', 'Times New Roman');
    text(xlim(1)+0.2, ylim(2)-0.3, ...
         sprintf('$ t = %.2f \rm{s}$', t(i)), 'interpreter',"latex",...
         'FontSize', 14, 'Color', 'k', 'FontName', 'Times New Roman');
    % 速度方向提示
    if v > 0
        dirStr = '↑ 向上';
    elseif v < 0
        dirStr = '↓ 向下';
    else
        dirStr = '— 最高点';
    end
    text(xlim(1)+0.2, ylim(2)-1.9, ...
         ['速度方向: ', dirStr], ...
         'FontSize', 14, 'Color', 'r', 'FontName', '宋体');
    
    % ---------- 坐标轴设置 ----------
    axis([xlim, ylim]);
    axis square;
    axis off;
    set(gca, 'Color', 'w');
    
    pause(0.05);
    drawnow;
end

vertical_throw_plot(v0,g)
