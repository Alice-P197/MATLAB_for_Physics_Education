%长直圆柱形载流导线内外的磁感应强度曲线
clear                                  %清除变量
rm=4;                                  %窗口的最大宽度
dr=0.01;                               %间隔
r=1:dr:rm;                             %柱外的自变量向量
b=1./r;                                %柱外磁感应强度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子窗口
plot([0,1,r],[0,0,b],'LineWidth',2)    %画磁感应强度
fs=16;                                 %字体大小
title('电流均匀分布在圆柱导体表面上的磁感应强度','FontSize',fs)%标题
xlabel('\itr/a','FontSize',fs)         %标记横坐标
ylabel('\itB\rm/\itB\rm_0','FontSize',fs)%标记纵坐标
grid on                                %加网格
text(0,0.5,'\itB\rm_0=2\itk\rm_m\itI/a','FontSize',fs)%标记单位
subplot(2,1,2)                         %子窗口
plot([0,1,r],[0,1,b],'LineWidth',2)    %画磁感应强度
grid on                                %加网格
title('电流均匀分布在圆柱导体载面上的磁感应强度','FontSize',fs)%标题
xlabel('\itr/a','FontSize',fs)         %标记横坐标
ylabel('\itB\rm/\itB\rm_0','FontSize',fs)%标记纵坐标

