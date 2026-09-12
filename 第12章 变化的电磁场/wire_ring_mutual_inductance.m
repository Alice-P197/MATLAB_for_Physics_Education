%直线和共面圆环的互感系数
clear                                  %清除变量
d=linspace(-3,3);                      %距离向量
m=d-sign(1+d).*sqrt(d.^2-1);           %互感系数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(d,m)                              %画互感系数曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('直线和共面圆环的互感系数与距离的关系','FontSize',fs)%显示标题
xlabel('\itd/a','FontSize',fs)         %显示横坐标
ylabel('\itM/\mu\rm_0\ita','FontSize',fs)%显示纵坐标
f='k*sin(x)^2/(1+k*cos(x))';           %被积符号函数
i=int(f);                              %符号积分
s=subs(i,'x',pi-sqrt(eps));            %积分变量x替换积分上限
m=subs(s,'k',1./d+sqrt(eps))/pi;       %参数k替换数值再算互感系数
hold on                                %保持图像
plot(d,m,'.')                          %再画互感系数曲线(点)

