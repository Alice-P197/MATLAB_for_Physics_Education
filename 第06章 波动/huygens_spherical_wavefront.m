%用惠更斯作图法确定球面波的波阵面
clear                                  %清除变量
r0=0.2;                                %子波源的半径
th1=(0:360)*pi/180;                    %圆的角度向量
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=plot(r0*cos(th1),r0*sin(th1),'LineWidth',2);%画圆并取句柄
axis off equal                         %不显示坐标并使坐标间隔相等
axis([-1,1,-1,1])                      %设定坐标范围
title('用惠更斯作图法确定球面波的波阵面','FontSize',20)%显示标题
dth=18;                                %波线或子波源的角度间隔
th2=(0:dth:360-dth)*pi/180;            %波线或子波源的角度向量
n=length(th2);                         %波线的条数
x0=r0*cos(th2);                        %波线终点的横坐标向量
y0=r0*sin(th2);                        %波线终点的纵坐标向量
hold on                                %保持图像
quiver(zeros(1,n),zeros(1,n),x0,y0,0,'LineWidth',2)%画箭杆波线
plot([zeros(1,n);x0],[zeros(1,n);y0],'LineWidth',2)%画彩色波线
hc=plot(zeros(n),zeros(n),'LineWidth',2);%画点为了取子波的句柄
pause                                  %暂停
plot(r0*cos(th1),r0*sin(th1),'r','LineWidth',2)%画第一个子波源的波阵面
r=0.01;                                %子波的半径
R=r0;                                  %子波源波阵面的半径
o=ones(100,1);                         %全1向量
while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    theta=pi-acos(r/2/R);              %计算子波的半张角
    th=linspace(-theta,theta);         %计算子波的角度向量
    for i=1:n                          %按子波循环
        phi=(i-1)*dth*pi/180;          %取子波源的角度
        x=r*cos(th+phi);               %子波的横坐标向量
        y=r*sin(th+phi);               %子波的纵坐标向量
        set(hc(i),'XData',x0(i)+x,'YData',y0(i)+y)%设置子波圆弧
    end                                %结束循环
    set(h,'XData',(R+r)*cos(th1),'YData',(R+r)*sin(th1))%设置子波波阵面
    drawnow                            %刷新
    pause(0.1)                         %延时
    if r>r0                            %如果半径超过最初的半径
        pause                          %暂停
        [N,TH]=meshgrid(0:n-1,th);     %整数和角度矩阵
        X=r*cos(TH+N*dth*pi/180);      %子波圆弧的横坐标矩阵
        Y=r*sin(TH+N*dth*pi/180);      %子波圆弧的纵坐标矩阵
        plot(o*x0+X,o*y0+Y,'LineWidth',2)%补画彩色圆弧作为子波波阵面
%         for i=1:n                      %按子波循环(除了颜色外,效果同上)
%             phi=(i-1)*dth*pi/180;      %取子波源的角度
%             x=r*cos(th+phi);           %子波圆弧的横坐标向量
%             y=r*sin(th+phi);           %子波的纵坐标向量
%             plot(x0(i)+x,y0(i)+y,'LineWidth',2)%补画蓝色圆弧
%         end                            %结束循环
        r=0;                           %半径复原
        R=R+r0;                        %子波源的波阵面向前移
        plot(R*cos(th1),R*sin(th1),'r','LineWidth',2)%补画波阵面(公切面)
        x0=R*cos(th2);                 %子波源的横坐标向量
        y0=R*sin(th2);                 %子波源的纵坐标向量
    end                                %结束条件
	r=r+0.01;                          %子波源的半径增加
end                                    %结束循环

