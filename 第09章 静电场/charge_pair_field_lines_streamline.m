%直线电荷对的电场线和等势线(等高线法和流线法)
clear                                  %清除变量
lambda=input('请输入电荷比:');         %键盘输入电荷比
%lambda=-1.5;-0.5;-1;                   %正负电荷的试验值
%lambda=1.5;1;0.5;                      %一对正电荷的试验值
xm=2.5;                                %x坐标范围
x=linspace(-xm,xm);                    %横坐标向量
ym=2;                                  %y坐标范围
y=linspace(0,ym);                      %纵坐标向量
y(1)=eps;                              %零改为小值
[X,Y]=meshgrid(x,y);                   %设置坐标网点
R1=sqrt((X+1).^2+Y.^2);                %第一个(正)电荷到场点的距离
R2=sqrt((X-1).^2+Y.^2);                %第二个电荷到场点的距离
U=2*(log(1./R1)+lambda*log(1./R2));	   %计算电势
u=-3:0.5:3;                            %电势向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
C=contour(X,Y,U,u,'LineWidth',2);      %画上面等势线并取等势线的坐标
%[C,h]=contour(X,Y,U,u);                %画等势线并取等势线的坐标和句柄(6.5版用)
%set(h,'LineWidth',2)                   %加粗曲线
clabel(C,'FontSize',16)                %标记等势线的值
grid on                                %加网格
axis equal                             %使坐标间隔相等
hold on                                %保持图像
contour(X,-Y,U,u,'LineWidth',2)	       %画下面等势线
%[C,h]=contour(X,Y,U,u);                %画等势线并取等势线的坐标和句柄(6.5版用)
%set(h,'LineWidth',2)                   %加粗曲线
plot([-xm;xm],[0;0],[0;0],[-ym;ym],'LineWidth',2)%画水平线和竖直线

C=atan((X+1)./Y)+lambda*atan((X-1)./Y);%计算电场线常数
r0=0.1;                                %电场线起点半径
dth=20;                                %第一个电荷的起始角和间隔
th=dth:dth:180-dth;                    %角度向量
th=th*pi/180;                          %化为弧度
x0=r0*cos(th)-1;                       %起点横坐标
y0=r0*sin(th);                         %起点纵坐标
c=atan((x0+1)./y0)+lambda*atan((x0-1)./y0);%计算等高线常数
contour(X,Y,C,c,'b','LineWidth',2)     %画上面等值线(电场线)
%[C,h]=contour(X,Y,U,u);                %画等势线并取等势线的坐标和句柄(6.5版用)
%set(h,'LineWidth',2)                   %加粗曲线
contour(X,-Y,C,c,'b','LineWidth',2)    %画下面等值线(电场线)
%[C,h]=contour(X,Y,U,u);                %画等势线并取等势线的坐标和句柄(6.5版用)
%set(h,'LineWidth',2)                   %加粗曲线
title('直线电荷的电场线和等势线','FontSize',16)%显示标题
xlabel('\itx/a','FontSize',16)         %显示x坐标
ylabel('\ity/a','FontSize',16)         %显示y坐标
txt=['电势单位:\itk\lambda\rm_1,电荷密度比:',num2str(lambda)];%电势文本
text(-xm,ym-0.5,txt,'FontSize',16)     %标记电势文本

Ey=Y.*(R2.^2+lambda*R1.^2);            %场强的y分量
Ex=(X+1).*R2.^2+lambda*(X-1).*R1.^2;   %场强的x分量
h=streamline(X,Y,Ex,Ey,x0,y0);         %画左上部流线
set(h,'LineWidth',2,'Color','r')       %加粗曲线并取红色
h=streamline(X,-Y,Ex,-Ey,x0,-y0);      %画左下部流线
set(h,'LineWidth',2,'Color','r')       %加粗曲线并取红色

if lambda>0                            %如果是同种电荷
    dth=dth*abs(1/lambda);             %第二个电荷的起始角和步长
    th=dth:dth:180-dth;                %角度向量
    th=th*pi/180;                      %化为弧度
    x0=r0*cos(th)+1;                   %起点横坐标
    y0=r0*sin(th);                     %起点纵坐标
    c=atan((x0+1)./y0)+lambda*atan((x0-1)./y0);%计算等高线常数
    contour(X,Y,C,c,'b','LineWidth',2) %画上面等值线(电场线)
    %[C,h]=contour(X,Y,U,u);            %画等势线并取等势线的坐标和句柄(6.5版用)
    %set(h,'LineWidth',2)               %加粗曲线
    contour(X,-Y,C,c,'b','LineWidth',2)%画下面等值线(电场线)
    %[C,h]=contour(X,Y,U,u);            %画等势线并取等势线的坐标和句柄(6.5版用)
    %set(h,'LineWidth',2)               %加粗曲线
    h=streamline(X,Y,Ex,Ey,x0,y0);     %画右上部流线
    set(h,'LineWidth',2,'Color','r')   %加粗曲线并取红色
    h=streamline(X,-Y,Ex,-Ey,x0,-y0);  %画右下部流线
    set(h,'LineWidth',2,'Color','r')   %加粗曲线并取红色
end                                    %结束条件

