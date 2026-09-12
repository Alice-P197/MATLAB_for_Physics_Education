%轻质杆两端小球和质心运动的动画
clc;clear;close all;                                  %清除变量
g=9.8;                                  %重力加速度
v0=10;                                 %初速度
theta=input('请输入抛射角:');          %键盘输入抛射角
%theta=90;                               %参考值
%theta=60;                              %参考值
th=theta*pi/180;                       %化为弧度
w=10*pi;                               %角速度
l=1;                                   %杆长
m1=0.1;                                %第一个小球质量
m2=0.1;                                %第二个小球质量
r1=l*m2/(m1+m2);                       %第一个小球到质心的距离
r2=l*m1/(m1+m2);                       %第二个小球到质心的距离
t0=2*v0*sin(th)/g;                     %抛射时间
n=200;                                 %时间份数
t=linspace(0,t0,n);                    %时间向量
xc=v0*cos(th)*t;                       %质心横坐标分量
yc=v0*sin(th)*t-g*t.*t/2;              %质心纵坐标分量
x1=xc+r1*cos(w*t);                     %小球1的横坐标
y1=yc+r1*sin(w*t);                     %小球1的纵坐标
x2=xc-r2*cos(w*t);                     %小球2的横坐标
y2=yc-r2*sin(w*t);                     %小球2的纵坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h12=plot([x1(1);x2(1)],[y1(1);y2(1)],'-o','LineWidth',3);%画杆并取句柄
grid on                                %加网格
axis([-0.5,xc(end)+1,-1.5,max(yc)+1])  %坐标轴范围
axis equal                             %坐标轴间隔相等
fs=16;                                 %字体大小
title('轻杆斜抛时质心和两端小球的运动','FontSize',fs)%加标题
xlabel('\itx\rm/m','FontSize',fs)      %加横坐标标签
ylabel('\ity\rm/m','FontSize',fs)      %加纵坐标标签
hold on                                %保持图像
%pause                                  %暂停
for i=1:n-1                            %按时间循环
    set(h12,'XData',[x1(i);x2(i)],'YData',[y1(i);y2(i)]);%设置杆的位置
    plot([xc(i);xc(i+1)],[yc(i);yc(i+1)],'LineWidth',2)%画质心轨迹
    plot([x1(i);x1(i+1)],[y1(i);y1(i+1)],'k')%画球1轨迹
    plot([x2(i);x2(i+1)],[y2(i);y2(i+1)],'r')%画球2轨迹
    if floor((i-1)/20)==(i-1)/20       %每隔一定时间
        plot([x1(i);x2(i)],[y1(i);y2(i)],'LineWidth',2)%重画杆
        plot(x1(i),y1(i),'ko')         %重画球1
        plot(x2(i),y2(i),'ro')         %重画球2
    end                                %结束条件
%    pause(0.01)                        %暂停
    drawnow                            %刷新屏幕
end                                    %结束循环

