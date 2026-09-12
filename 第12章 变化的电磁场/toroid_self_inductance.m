%圆螺绕环的自感系数
clear                                  %清除变量
a=0:0.01:1;                            %半径之比a/R
l=1-sqrt(1-a.^2);                      %自感系数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(a,l,'LineWidth',2)                %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('圆形螺绕环的自感系数与截面半径的关系','FontSize',fs)%显示标题
xlabel('\ita/R','FontSize',fs)         %显示x坐标
ylabel('\itL/\mu\rm_0\itN\rm^2\itR','FontSize',fs)%显示y坐标

