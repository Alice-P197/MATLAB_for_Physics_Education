%通电直线磁场中半圆环电流所受的安培力
clear                                  %清除变量
th=pi/2;                               %角度上限
d=-3:0.05:2;                           %相对距离向量(保留奇点)
%d=linspace(-3,2);                      %相对距离向量(绕过奇点)
fx=(sign(d+1)*2.*atan(sqrt((d-1)./(d+1))).*d./sqrt(d.^2-1)-th)/pi;%半圆环受的安培力
%fx=(sign(d+1)*2.*atanh(sqrt((1-d)./(1+d))).*d./sqrt(1-d.^2)-th)/pi;%半圆环受的安培力
%fx=(log((1+sqrt(1-d.^2))./d).*d./sqrt(1-d.^2)-th)/pi;%半圆环受的安培力(效果同上)
f1=figure;                             %创建图形窗口
plot(d,fx)                             %画半圆环的受力曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itd/a','FontSize',fs)         %显示x坐标
ylabel('{\itF_x}/{\it\mu}_0{\itI}_1{\itI}_2','FontSize',fs)%显示y坐标
title('半圆环电流受直线电流的安培力','FontSize',fs)%显示标题
f2=figure;                             %创建图形窗口
plot(d,1/pi./d+fx)                     %画封闭半圆环的受力曲线
grid on                                %加网格
xlabel('\itd/a','FontSize',fs)         %显示x坐标
ylabel('{\itF}/{\it\mu}_0{\itI}_1{\itI}_2','FontSize',fs)%显示y坐标
title('封闭半圆环电流受直线电流的安培力','FontSize',fs)%显示标题

syms x k                               %定义符号变量
y=k*cos(x)/(1+k*cos(x));               %被积符号函数
i=int(y);                              %符号积分
s=subs(i,x,th);                        %替换积分上限
fx=-subs(s,k,1./d)/pi;                 %替换数值计算安培力
figure(f1)                             %再开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
plot(d,fx,'.')                         %再画半圆环的受力曲线
figure(f2)                             %再开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
plot(d,1./d/pi+fx,'.')                 %再画封闭半圆环的受力曲线

