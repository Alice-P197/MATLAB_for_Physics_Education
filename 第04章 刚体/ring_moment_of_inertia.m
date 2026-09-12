%均匀圆圈绕中心轴的转动惯量
clc;close all;clear                                  %清除变量
r=0:0.01:1;                            %内半径与外半径之比向量
j=(1+r.^2)/2;                          %转动惯量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r,j,'LineWidth',2)                %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('均匀圆圈绕中心轴的转动惯量','FontSize',fs)%显示标题
xlabel('半径比\itR\rm_0/\itR','FontSize',fs)%显示横坐标
ylabel('转动惯量\itJ/\itMR\rm^2','FontSize',fs)%显示纵坐标

