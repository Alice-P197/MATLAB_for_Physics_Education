%贝托齐极限速率实验曲线
clear                                  %清除变量
c=3e8;                                 %光速
e=1.6e-19;                             %电子电量
m0=9.11e-31;                           %电子质量
e0=m0*c*c;                             %电子静止能量
e0=e0/e/1e6;                           %单位化为兆电子伏
tm=6;                                  %单位是兆电子伏的最大动能
T=0:0.1:tm;                            %相对论动能向量
vv=(1-1./(1+T/e0).^2)*9;               %相对论速率平方
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(T,vv,'LineWidth',2)               %画曲线
grid on                                %加网格
axis([0,tm,0,10])                      %曲线范围
fs=16;                                 %字体大小
xlabel('\itT\rm/MeV','FontSize',fs)    %标记横坐标
ylabel('\itv\rm^2/(10^1^6m^2\cdots^-^2)','FontSize',fs)%标记纵坐标
title('贝托齐极限速率实验结果','FontSize',fs)%标题
t=0:0.01:0.5;                          %经典动能向量
vv=2*t/e0*9;                           %经典速率平方
hold on                                %保持图像
plot(t,vv,'r--','LineWidth',2)         %画曲线
[x,y]=ginput(4)                        %从键盘上取点
plot(x,y,'ko')                         %画点
h=legend(['相对论理论 ';'牛顿力学预言';'实验结果  '],4);%加图例
set(h,'FontSize',fs)                   %放大字体

