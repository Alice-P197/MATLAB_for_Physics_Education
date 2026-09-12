%平面波的衍射
clc
clear                                  %清除变量
close all

d=0.5;                                %缝的半宽度
%d=0.01;                                %缝的半宽度
xm=1;                                  %横坐标范围
ym=0.75;                               %纵坐标范围
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0,0;0,0],[ym,-ym;d,-d],'k','LineWidth',3)%画上下档板
rectangle('position',[-xm,-ym,2*xm,2*ym],'LineWidth',3)%画方框
axis off equal                         %不显示坐标并使坐标间隔相等
axis([-xm,xm,-ym,ym])                  %设定坐标范围
title('平面波遇到障碍物的衍射','FontSize',20)%显示标题
hold on                                %保持图像
pause                                  %暂停 
th=linspace(0,pi/2);                   %角度向量
x0=0.1;                                %相邻波阵面之间的距离 
n=1;                                   %第1个波阵面 
while 1                                %无限循环
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    hl(n)=plot([-xm;-xm],[-ym;ym],'r','LineWidth',2);%新波阵面的句柄
	xr=0.01;                           %波阵面的相对初位置
    while xr<x0                        %波阵面前进的距离小于波阵面距离时循环
        for i=1:n                      %按波阵面循环
            x=-xm+x0*(i-1)+xr;         %波阵面的横坐标
            if x<0                     %如果没有达到档板
                set(hl(i),'XData',[x;x],'YData',[-ym;ym]);%设置直线波阵面
            else                       %否则
                xx=x*cos(th);          %1/4圆的横坐标
                yy=d+x*sin(th);        %1/4圆的纵坐标
                xx=[fliplr(xx),x,x,xx];%连接横坐标
                yy=[fliplr(yy),d,-d,-yy];%连接纵坐标
                set(hl(i),'XData',xx,'YData',yy);%设置弯曲波阵面
            end                        %结束条件
        end                            %结束循环
        drawnow                        %更新屏幕
        pause(0.05)                    %延时 
        xr=xr+0.01;                    %前进一步
    end                                %结束循环 
    if n<=22 n=n+1;end                 %判断增加一个波阵面
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
end                                    %结束循环

