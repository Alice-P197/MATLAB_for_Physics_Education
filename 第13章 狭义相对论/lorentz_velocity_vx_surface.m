%洛伦兹速度vx变换曲面
clear                                  %清除变量
u=-1:0.1:1;                            %参考系S'相对S的速度向量u/c
u(1)=u(1)+eps;                         %第一个速度接近反方向光速
u(end)=u(end)-eps;                     %最后一个速度接近正方向光速
vx=u;                                  %质点在S系中的速度vx/c
% vx=-1:0.1:1;                           %质点在S系中的速度vx/c
% vx(1)=vx(1)+eps;                       %第一个速度接近反方向光速
% vx(end)=vx(end)-eps;                   %最后一个速度接近正方向光速
[Vx,U]=meshgrid(vx,u);                 %速度向量化为矩阵
VVx=(Vx-U)./(1-U.*Vx);                 %S'系中的速度v'x/c
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(vx,u,VVx)                         %画曲面
box on                                 %加框架
view(-60,50)                           %设置视角
fs=16;                                 %字体大小
title('洛伦兹速度变换的\itx\rm分量曲面','FontSize',fs)%标题
xlabel('\itv_x/c','FontSize',fs)       %横坐标
ylabel('\itu/c','FontSize',fs)         %纵坐标
zlabel('\itv\prime_x/c','FontSize',fs) %高坐标
hold on                                %保持图像
plot3(u,vx,zeros(size(u)),'LineWidth',2)%画零线

