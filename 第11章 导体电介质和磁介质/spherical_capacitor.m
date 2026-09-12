%球形电容器的电容
clear                                  %清除变量
r=1.1:0.01:5;                          %半径向量
c=1./(1-1./r);                         %电容
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r,c,'LineWidth',2)                %画电容曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('球形电容器的电容','FontSize',fs)%显示标题
xlabel('\itR/R\rm_0','FontSize',fs)    %显示x坐标
ylabel('\itC\rm/4\pi\it\epsilonR\rm_0','FontSize',fs)%显示y坐标

