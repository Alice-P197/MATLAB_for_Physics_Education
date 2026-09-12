%用惠更斯作图法确定平面波的波阵面
clear                                  %清除变量
x1=-0.2;                               %左边界
x2=2;                                  %右边界
cc='bgrymck';                          %颜色符号
n=length(cc);                          %符号个数,表示子波源个数
y0=0.2;                                %子波源之间的距离
y1=0;                                  %下边界
y2=(n+1)*y0;                           %上边界
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([x1,x2,x2,x1,x1],[y1,y1,y2,y2,y1],'k','LineWidth',2);%画方框
%rectangle('position',[x1,y1,x2-x1,y2],'LineWidth',3)%画方框
axis off equal                         %不显示坐标并使坐标间隔相等
axis([x1,x2,y1,y2])                    %设定坐标范围
title('用惠更斯作图法确定平面波的波阵面','FontSize',20)%显示标题
hold on                                %保持图像
xy=0.05;                               %箭头大小
for i=1:n                              %按子波源循环
    yi=y0*i;                           %计算纵坐标
    plot([x1;0],[yi;yi],cc(i),'LineWidth',1.5)%画波线
    plot([0,0;-xy,-xy],[yi,yi;yi+xy,yi-xy],cc(i),'LineWidth',1.5)%画箭头
%    hc(i)=plot(0,yi,cc(i),'LineWidth',2,'erasemode','xor');%半圆的句柄
    hc(i)=plot(0,yi,cc(i),'LineWidth',2);%半圆的句柄
end                                    %结束循环
%plot([x1,x1;x2,x2],[y1,y2;y1,y2])      %画上线和下线
%plot([x1,x2],[y2,y2])                  %画上线
plot([0,0],[y1,y2],'r','LineWidth',2)  %第一个波阵面
h=plot([0,0],[y1,y2],'r','LineWidth',2);%取波阵面的句柄
pause                                  %暂停
theta=(-1:0.01:1)*pi/2;                %角度向量
r=0;                                   %球面波的半径的初值
r0=0.5;                                %子波波阵面之间的距离
x0=0;                                  %子波波阵面的初始横坐标
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
	r=r+0.01;                          %增加半径
    if r>r0                            %如果半径超过面间距
        pause                          %暂停
        for i=1:n                      %按子波循环
            plot(x0+x,y0*i+y,cc(i),'LineWidth',2)%补画半圆
        end                            %结束循环
        r=0;                           %圆的半径清零
        x0=x0+r0;                      %波阵面向前推
        plot([x0,x0],[y1,y2],'r','LineWidth',2)%补画波阵面
    end                                %结束条件
    x=r*cos(theta);                    %计算半圆的相对横坐标
	y=r*sin(theta);                    %计算半圆的相对纵坐标
    for i=1:n                          %按子波循环
        set(hc(i),'XData',x0+x,'YData',y0*i+y)%设置半圆的坐标
    end                                %结束循环
    set(h,'XData',[x0+r,x0+r])         %设置波阵面的横坐标
    drawnow                            %刷新
    pause(0.02)                        %延时
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
end                                    %结束循环

