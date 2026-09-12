%均匀半圆圈的质心坐标
clc;clear;close all;clear                                  %清除变量
r=0:0.01:1;                            %内半径与外半径之比向量
yc=4/3/pi*(1+r+r.^2)./(1+r);           %质心坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r,yc,'LineWidth',2)               %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('均匀半圆圈的质心坐标','FontSize',fs)%显示标题
xlabel('半径比\itR\rm_0/\itR','FontSize',fs)%显示横坐标
ylabel('质心坐标\ity\rm_C/\itR','FontSize',fs)%显示纵坐标
hold on                                %保持图像
y=[yc(1),yc(end)];                     %取半圆环和半圆盘的质心坐标
plot([0,1],y,'o')                      %画点
text([0,1],y,num2str(y'),'FontSize',fs)%显示质心高度

