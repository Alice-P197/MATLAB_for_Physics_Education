%气体分子运动的动画(不考虑分子之间的碰撞)
clear                                  %清除变量
n=input('请输入分子个数:');            %键盘输入分子个数
%n=1000;                                %不加箭杆时分子个数参考值
%n=50;                                 %加箭杆时分子个数参考值
rand('state',0)                        %均匀分布随机数初始化
randn('state',0)                       %正态分布随机数初始化
xm=1.4e-6;                             %横坐标范围
ym=1e-6;                               %纵坐标范围
x0=xm*(2*rand(1,n)-1);                 %分子初始横坐标
y0=ym*(2*rand(1,n)-1);                 %分子初始纵坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([-1,1,1,-1,-1]*xm,[-1,-1,1,1,-1]*ym,'LineWidth',3)%画器壁
axis equal off                         %使纵横坐标间隔相等
axis([-xm,xm,-ym,ym])                  %设置坐标范围
title('气体分子与器壁的碰撞(不考虑分子间的碰撞)','FontSize',16)%标题
text(xm,ym,['\itN\rm=',num2str(n)],'FontSize',12)%显示粒子数
vx=randn(1,n);                         %分子x速度
vy=randn(1,n);                         %分子y速度
hold on                                %保持图像
for i=1:n                              %按分子循环
    h(i)=plot(x0(i),y0(i),'.','MarkerSize',15,'Color',rand(1,3));%画点并取句柄
%    hh(i)=quiver(x0(i),y0(i),vx(i),vy(i),1e-7);%画分子的箭杆取句柄
end                                    %结束循环
hh=quiver(x0,y0,vx,vy);                %画所有分子的箭杆取句柄
h1=quiver(x0(1),y0(1),vx(1),vy(1),1e-6);%画第一个分子的箭杆取句柄
dt=1e-7;                               %时间间隔
pause                                  %暂停
set(hh,'UData',zeros(1,n),'VData',zeros(1,n))%去箭杆
%while 1                                %无限循环
%    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键结束
while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    for i=1:n                          %按分子循环
        xx=x0(i);                      %取横坐标
        yy=y0(i);                      %取纵坐标
        dx=vx(i)*dt;                   %取横位移
        dy=vy(i)*dt;                   %取纵位移
        if xx+dx>xm                    %如果超过右边界
            y=yy+dy/dx*(xm-xx);        %计算与右壁碰撞的纵坐标
            set(h(i),'XData',xm,'YData',y)%设置点的坐标
            x0(i)=xm;                  %右壁横坐标
            y0(i)=y;                   %右壁纵坐标
            dx=-(dx-(xm-xx));          %反弹横位移
            dy=dy-(y-yy);              %反弹纵位移
            vx(i)=-vx(i);              %速度反向
        end                            %结束条件
        if xx+dx<-xm                   %如果超过左边界
            y=yy+dy/dx*(-xm-xx);       %计算与左壁碰撞的纵坐标
            set(h(i),'XData',-xm,'YData',y)%设置点的坐标
            x0(i)=-xm;                 %左壁横坐标
            y0(i)=y;                   %左壁纵坐标
            dx=-(dx-(-xm-xx));         %反弹横位移
            dy=dy-(y-yy);              %反弹纵位移
            vx(i)=-vx(i);              %速度反向
        end                            %结束条件
        if yy+dy>ym                    %如果超过上边界
            x=xx+dx/dy*(ym-yy);        %计算与上壁碰撞的横坐标
            set(h(i),'XData',x,'YData',ym)%设置点的坐标
            x0(i)=x;                   %上壁横坐标
            y0(i)=ym;                  %上壁纵坐标
            dx=dx-(x-xx);              %反弹横位移
            dy=-(dy-(ym-yy));          %反弹纵位移
            vy(i)=-vy(i);              %速度反向
        end                            %结束条件
        if yy+dy<-ym                   %如果超过下边界
            x=xx+dx/dy*(-ym-yy);       %计算与下壁碰撞的横坐标
            set(h(i),'XData',x,'YData',-ym)%设置点的坐标
            x0(i)=x;                   %下壁横坐标
            y0(i)=-ym;                 %下壁纵坐标
            dx=dx-(x-xx);              %反弹横位移
            dy=-(dy-(-ym-yy));         %反弹纵位移
            vy(i)=-vy(i);              %速度反向
        end                            %结束条件
        x0(i)=x0(i)+dx;                %新的起点横坐标
        y0(i)=y0(i)+dy;                %新的起点纵坐标
        set(h(i),'XData',x0(i),'YData',y0(i))%设置点的坐标
%        set(hh(i),'XData',x0(i),'YData',y0(i),'UData',vx(i),'VData',vy(i))%设置箭杆
    end                                %结束循环
    set(h1,'XData',x0(1),'YData',y0(1),'UData',vx(1),'VData',vy(1))%设置第一个分子的箭杆
    drawnow                            %刷新屏幕
end                                    %结束循环
quiver(x0,y0,vx,vy);                   %画所有分子的箭杆

