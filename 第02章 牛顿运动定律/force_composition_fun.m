%力的合成的函数
function fun(f,theta)                  %定义函数
th=theta*pi/180;                       %度数化为弧度数
fx=f.*cos(th);                         %求力的x分量
fy=f.*sin(th);                         %求力的y分量
fxc=cumsum(fx);                        %力的x分量累积求和
fyc=cumsum(fy);                        %力的y分量累积求和
fxm=fxc(end);                          %取出x分量的最终的和
fym=fyc(end);                          %取出y分量的最终的和
fxc=[0 fxc(1:end-1)];                  %箭杆起点的横坐标
fyc=[0 fyc(1:end-1)];                  %箭杆起点的纵坐标
f=sqrt(fxm^2+fym^2);                   %合力的大小
th=atan2(fym,fxm);                     %合力的方向
theta=th*180/pi;                       %化为度数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
quiver(fxc,fyc,fx,fy,0,'LineWidth',2)                %画力矢量多边形(0表示不用自动刻度)
grid on                                %加网格
axis equal                             %两轴间隔相等
hold on                                %保持图像
quiver(0,0,fxm,fym,0,'LineWidth',2)    %画合力箭杆
quiver(0,0,0,fym,0,'LineWidth',2)      %画合力x分量箭杆
quiver(0,0,fxm,0,0,'LineWidth',2)      %画合力y分量箭杆
plot([0,fxm,fxm],[fym,fym,0],'--')     %画虚线
fs=16;                                 %字体大小
title('力的合成','FontSize',fs)        %显示标题
xlabel('\itf_x\rm/N','FontSize',fs)    %标记横坐标
ylabel('\itf_y\rm/N','FontSize',fs)    %标记纵坐标
text(fxm,0,['\itf_x\rm=',num2str(fxm),'N'],'FontSize',fs)%标记分力fx
text(0,fym,['\itf_y\rm=',num2str(fym),'N'],'FontSize',fs)%标记分力fy
text(fxm,fym,['\itf\rm=',num2str(f),'N'],'FontSize',fs)%标记合力大小
text(0,0,['\it\theta\rm=',num2str(theta),'\circ'],'FontSize',fs)%标记合力方向

