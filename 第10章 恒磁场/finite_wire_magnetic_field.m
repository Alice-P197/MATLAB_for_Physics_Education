%有限长通电直线的磁感应强度的分布面和曲线族
clear                                  %清除变量
rm=4;                                  %坐标限度
r=linspace(-rm,rm,30);                 %坐标向量
[X,Y]=meshgrid(r);                     %坐标矩阵
r1='sqrt((x+1).^2+y.^2)';              %场点到左边端点的距离字符串
r2='sqrt((x-1).^2+y.^2)';              %场点到右边端点的距离字符串
B=inline(['((x+1)./',r1,'-(x-1)./',r2,')./y']);%磁感应强度内线函数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(r,r,B(X,Y))                       %画场强曲面
hold on                                %保持图像
plot3([-1;1],[0;0],[0;0],'r','LineWidth',3)%画直线电流
box on                                 %加框
fs=16;                                 %字体大小
tit='长度为2\itL\rm的通电直线的磁感应强度\itB\rm的分布面';%标题
title(tit,'FontSize',fs)               %显示标题
xlabel('\itx/L','FontSize',fs)         %显示x坐标
ylabel('\ity/L','FontSize',fs)         %显示y坐标
zlabel('\itB/k\rm_m\itIL\rm^-^1','FontSize',fs)%显示z坐标

