%小球受到与速率成正比的摩擦阻力作用时上升的高度和落回原处的时间以及速度
clear                                  %清除变量
v0=0:0.05:7;                           %较密的初速度向量
h=v0-log(1+v0);                        %最大高度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v0,h,'LineWidth',2)               %画最大高度曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('小球上升的最大高度与上升初速度的关系','fontsize',fs)%显示标题
xlabel('上升初速度\itv\rm_0/\itV\rm_0','fontsize',fs)%显示横坐标标签
ylabel('最大高度\itH/h\rm_0','fontsize',fs)%显示纵坐标标签
txt1='\ith\rm_0=\itm\rm^2\itg/k\rm^2'; %高度单位文本
txt2='\itV\rm_0=\itmg/k';              %速度单位文本
txt3='\it\tau\rm=\itm/k\rm';           %时间单位文本
text(0,3,[txt1,',',txt2],'fontsize',fs)%标记高度单位和速度单位

t=0:0.05:1;                             %落回时间向量
[V0,T]=meshgrid(v0,t);                 %初速度和时间矩阵
H=T+exp(-T)-1-V0+log(1+V0);            %下落的高度差函数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=contour(V0,T,H,[0,0]);               %高度差为零的落回时间与初速度等值线
v0=h(1,2:end);                         %取初速度
t2=h(2,2:end);                         %取落回时间
t1=log(1+v0);                          %上升时间
%plot(v0,[t1;t2;t1+t2;2*v0])            %画时间曲线
plot(v0,t1,'o-',v0,t2,'d-',v0,t1+t2,'s-',v0,2*v0,'^-')%画时间曲线
legend('上升到最高点的时间\itT/\tau','落回原处的时间\itT\prime/\tau',...
       '上升和落回的总时间','无空气阻力上升和落回的总时间',2)%图例
title('小球运动的时间与上升初速度的关系','FontSize',fs)%显示标题
xlabel('上升初速度\itv\rm_0/\itV\rm_0','FontSize',fs)%显示横坐标标签
text(0,1,[txt3,',',txt2],'FontSize',fs)%标记时间单位和速度单位
grid on                                %加网格

v2=1-exp(-t2);                         %落回的速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v0,v2,'LineWidth',2)              %画有空气阻力的速度曲线
grid on                                %加网格
axis equal                             %使坐标间隔相等
title('小球上抛后落回原处的速度与上升初速度的关系','FontSize',fs)%显示标题
xlabel('上升初速度\itv\rm_0/\itV\rm_0','FontSize',fs)%显示横坐标标签
ylabel('落回末速度\itv/V\rm_0','FontSize',fs)%显示纵坐标标签
text(0,0,txt2,'FontSize',fs)           %标记速度单位
hold on                                %保持图像
plot(v0,v0,'r--','LineWidth',2)        %画无空气阻力的速度曲线
legend('有空气阻力','无空气阻力',2)     %图例
