%磁聚集原理
clear                                  %清除变量
theta=-3:0.5:3;                        %发散角向量的度数
th=theta*pi/180;                       %化为弧度
n=2;                                   %整数(焦点或周期个数)
t=linspace(0,n);                       %时间向量
[TH,T]=meshgrid(th,t);                 %矩阵
X=tan(TH)/2/pi/n.*(cos(2*pi*T)-1);     %x坐标
Y=tan(TH)/2/pi/n.*sin(2*pi*T);         %y坐标
Z=T/n;                                 %z坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot3(Z,X,Y,'LineWidth',2)             %画轨迹
box on                                 %加方框
grid on                                %加网格
view(-20,30)                           %设置视角
fs=16;                                 %字体大小
title('磁聚集原理','FontSize',fs)      %显示标题
xlabel('\itz/L','FontSize',fs)         %显示横坐标
ylabel('\itx/L','FontSize',fs)         %显示纵坐标
zlabel('\ity/L','FontSize',fs)         %显示高坐标
r=max(abs(X(:)));                      %圆的半径
th=(0:15:360)*pi/180;                  %圆的角度
x=r*cos(th);                           %圆的横坐标
y=r*sin(th);                           %圆的纵坐标
hold on                                %保持图像
plot3(zeros(size(x)),x,y,'--',ones(size(x)),x,y,'--','LineWidth',2)%画两个圆
plot3([zeros(size(th));ones(size(th))],[x;x],[y;y],'m')%画磁感应线
pause                                  %暂停
view(90,0)                             %设置左视角
axis equal tight                       %使间隔相等

