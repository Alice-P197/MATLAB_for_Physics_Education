%对心碰撞损失的机械能曲面和曲线
clear                                  %清除变量
m21=0:0.1:3;                           %质量比m2/m1向量
v21=-4:0.1:4;                          %速度比v20/v10向量
[V0,M]=meshgrid(v21,m21);              %速度比和质量比矩阵
DT=M./(1+M).*(1-V0).^2./(1+M.*V0.^2);  %物体系统碰撞后的损失的机械能
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surfc(v21,m21,DT)                      %画曲面
ColorBar                               %加色值图
box on                                 %加框架
axis tight                             %使图形窗口紧帖图形
fs=16;                                 %字体大小
title('对心碰撞损失的机械能曲面','FontSize',fs)%加标题
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%初速度标签
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%质量标签
zlabel('|\Delta\itT\rm|/\itT\rm_0(1-\ite\rm^2)','FontSize',fs)%损失动能
m=0.3:0.01:3;                          %峰值质量比向量
v=-1./m;                               %峰值速度比
dtm=ones(size(m));                     %机械能损失的峰值
hold on                                %保持图像
plot3(v,m,dtm,'y','LineWidth',2)       %补画峰值线

dt=0.1:0.1:1;                          %机械能损失等值向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
[c,h]=contour(v21,m21,DT,dt,'LineWidth',2);%画等值线并取句柄
Clabel(c,h)                            %给等值线添加数值
hold on                                %保持图像
plot(-1./(m21+eps),m21,'LineWidth',2)  %补画最大的等值线
plot([1,1],[0,m21(end)],'LineWidth',2) %补画零值线
grid on                                %加网格
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%初速度标签
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%质量标签
title('对心碰撞损失的机械能等值曲线','FontSize',fs)%标题

