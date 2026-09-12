%带电粒子在磁场中的圆周运动
clear                                  %清除变量
v=0:0.01:1;                            %速度向量
r=v./sqrt(1-v.^2);                     %求半径
t=1./sqrt(1-v.^2);                     %求周期
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v,r,v,t,'--','LineWidth',2)       %画半径和周期曲线
fs=16;                                 %字体大小
title('带电粒子在磁场中圆周运动的半径和周期','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
grid on                                %加网格
legend('\itR/R\rm_0','\itT/T\rm_0',2)  %图例
text(0,2,'\itR\rm_0=\itm\rm_0\itc/qB','FontSize',fs)%显示半径单位
text(0,4,'\itT\rm_0=2\pi\itm\rm_0/\itqB','FontSize',fs)%显示周期单位

