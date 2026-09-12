%直线电流的磁感应线
clear                                  %清除变量
k0=input('请输入比例系数:');           %键入比例系数
%k0=1.2;                                %比例系数参考值
%k0=0.8;                                %比例系数参考值
n=7;                                   %磁感应线条数
r=ones(1,n-1)*k0;                      %半径向量的初值
r=[1,r];                               %补充第一个半径
r=cumprod(r);                          %累积连乘形成半径向量
%r=logspace(0,log10(k0^(n-1)),n);       %等比数列表示半径向量
theta=linspace(0,2*pi);                %角度向量
X=cos(theta')*r;                       %横坐标矩阵
Y=sin(theta')*r;                       %纵坐标矩阵
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(X,Y,'LineWidth',2)                %画圆
grid on                                %加网格
axis equal                             %等轴
hold on                                %保持图像
plot(0,0,'o',0,0,'.','MarkerSize',10)  %画直线电流的剖面
plot(r,zeros(1,n),'^','MarkerFace','k')%画向上的箭头
plot(-r,zeros(1,n),'v','MarkerFace','k')%画向下的箭头
plot(zeros(1,n),r,'<','MarkerFace','k')%画向左的箭头
plot(zeros(1,n),-r,'>','MarkerFace','k')%画向右的箭头
fs=16;                                 %字体大小
title('直线电流的磁感应线','FontSize',fs)%标题
xlabel('\itx/r\rm_0','FontSize',fs)    %标记横坐标
ylabel('\ity/r\rm_0','FontSize',fs)    %标记纵坐标
text(-1,-0.5,['比例系数为\itk\rm_0=',num2str(k0)],'FontSize',fs)%标记文本

