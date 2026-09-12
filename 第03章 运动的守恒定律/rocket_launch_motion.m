%火箭发射的高度,速度和加速度
clear                                  %清除变量
M0=2.5e6;                              %火箭的初始质量
alpha=1e4;                             %火箭燃料的燃烧速度
u=3e3;                                 %火箭喷出气体的相对速度
g=9.8;                                 %重力加速度
t=0:60;                                %火箭运行时间向量
v=u*log(M0./(M0-alpha*t))-g*t;         %火箭上升的速度
z=u*t*(1+log(M0))+u/alpha*((M0-alpha*t).*log(M0-alpha*t)-M0*log(M0))...
    -g*t.*t/2;                         %火箭上升高度
a=alpha*u./(M0-alpha*t)-g;             %火箭上升的加速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选择第一个子窗口
plot(t,v,'LineWidth',2)                %画速度曲线
grid on                                %加网格
ylabel('速度\itv\rm/m\cdots^-^1')      %标记速度纵坐标
title('火箭发射的速度,高度和加速度','FontSize',16)%显示标题
vm=v(end);                             %取最大速度
text(0,vm,['\itv\rm(',num2str(t(end)),')=',num2str(vm),'m/s'],...
    'FontSize',16)                     %显示最大速度

subplot(3,1,2)                         %选择第二个子窗口
plot(t,z,'LineWidth',2)                %画高度曲线
grid on                                %加网格
ylabel('高度\itz\rm/m')                %标记高度纵坐标
zm=z(end);                             %取最大高度
text(0,zm,['\itz\rm(',num2str(t(end)),')=',num2str(zm),'m'],...
    'FontSize',16)                     %显示最大高度
%z=cumsum(v);                           %用矩形法求累积分
% z=cumtrapz(v);                         %用梯形法求累积分更精确
% hold on                                %保持属性
% plot(t,z,'r')                          %画曲线

subplot(3,1,3)                         %选择第三个子窗口
plot(t,a,'LineWidth',2)                %画加速度曲线
grid on                                %加网格
xlabel('时间\itt\rm/s')                %标记时间
ylabel('加速度\ita\rm/m\cdots^-^2')    %标记加速度纵坐标
am=a(end);                             %取最大加速度
text(0,am,['\ita\rm(',num2str(t(end)),')=',num2str(am),'m/s^2'],...
    'FontSize',16)                     %显示最大加速度
% a=diff([0,v]);                         %求差分
% hold on                                %保持属性
% plot(t,a,'r')                          %画曲线

