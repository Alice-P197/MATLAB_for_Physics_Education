%等量异号直线电荷对的电场线和等势线(公式法)
clear                                  %清除变量
xm=2.5;                                %x坐标范围
ym=2;                                  %y坐标范围
u=0.5:0.5:3;                           %电势向量
c=exp(-u/2);                           %常数
xc=(c.^2+1)./(c.^2-1);                 %圆心的横坐标
r=2*c./(c.^2-1);                       %圆的半径
phi=linspace(0,2*pi,200);              %圆的角度向量
X=cos(phi')*r;                         %x坐标网格
Y=sin(phi')*r;                         %y坐标网格
XC=ones(size(phi'))*xc;                %圆心坐标网格
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(X+XC,Y,'LineWidth',2)             %画左边圆作为等势线
grid on                                %加网格
axis equal                             %使坐标间隔相等
axis([-xm,xm,-ym,ym])                  %确定坐标范围
h=legend(num2str(u',3),4);             %加图例
set(h,'FontSize',12)                   %放大字体
hold on                                %保持图像
plot(X-XC,Y,'LineWidth',2)             %画右边圆作为等势线

th=(20:20:160)*pi/180;                 %圆在(a,0)点的切线与x轴的夹角向量
c=cot(th);                             %计算圆心纵坐标
r=sqrt(1+c.*c);                        %计算圆的半径
X=cos(phi')*r;                         %x坐标网格
Y=sin(phi')*r;                         %y坐标网格
C=ones(size(phi'))*c;                  %圆心坐标矩阵
plot(X,Y+C,'b','LineWidth',2)          %画圆作为电场线
plot([-xm;xm],[0;0],'k',[0;0],[-ym;ym],'k','LineWidth',2)%画水平线和竖直线
title('等量异号直线电荷的电场线和等势线','FontSize',16)%显示标题
xlabel('\itx/a','FontSize',16)         %显示x坐标
ylabel('\ity/a','FontSize',16)         %显示y坐标
text(-xm,ym-0.5,'电势单位:\itk\lambda','FontSize',16)%标记电势单位

