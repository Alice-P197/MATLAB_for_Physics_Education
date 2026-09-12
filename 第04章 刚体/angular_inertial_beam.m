%均匀细棒的转动惯量
clc;clear;close all;                                  %清除变量
d=0:0.01:1;                            %距离与长度之比向量
j=1/12+d.^2;                           %转动惯量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(d,j,'LineWidth',2)                %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('均匀细棒的转动惯量','FontSize',fs)%显示标题
xlabel('轴的距离\itD/L','FontSize',fs) %显示横坐标
ylabel('转动惯量\itJ/ML\rm^2','FontSize',fs)%显示纵坐标
hold on                                %保持图像
stem([0,0.5],[1/12,1/3],'--')          %画杆图
text(0,1/12,'\itJ_C=\itML\rm^2/12','FontSize',fs)%标记绕中心轴的转动惯量
text(0.5,1/3,'\itJ_L=\itML\rm^2/3','FontSize',fs)%标记绕端点轴的转动惯量

