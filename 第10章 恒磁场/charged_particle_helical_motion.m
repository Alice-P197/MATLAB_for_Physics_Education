%带电粒子在匀强磁场中的螺旋运动
clear                                  %清除变量
theta=input('请输入初始角的度数:');     %键盘输入初速度方向与磁感应强度方向之间的夹角
%theta=30;                              %参考值
th=theta*pi/180;                       %化为弧度
rm=sin(th);                            %相对半径
n=10;                                  %圈数
zm=cos(th)*2*pi*n;                     %相对高度
wt=linspace(0,2*pi,1000);              %角度向量(代表时间)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
fs=16;                                 %字体大小
xlabel('\itx/R\rm_0','FontSize',fs)    %显示横坐标
ylabel('\ity/R\rm_0','FontSize',fs)    %显示纵坐标
zlabel('\itz/R\rm_0','FontSize',fs)    %显示高坐标
title('带电粒子在匀强磁场中的螺旋运动','FontSize',fs)%显示标题
box on                                 %加方框
grid on                                %加网格
axis([-rm,rm,-rm,rm,0,zm])             %坐标范围
%axis([0,zm,-rm,rm,-rm,rm])             %坐标范围
text(0,0,0,'\itR\rm_0=\itmv\rm_0/\itqB','FontSize',fs)%显示半径文本
text(sin(th),0,0,['\it\theta\rm=',num2str(theta),'\circ'],'FontSize',fs)%显示初始角
hold on                                %保持图像
pause                                  %暂停
for i=1:n                              %按圈循环
    x=sin(th)*cos(wt);                 %x坐标
    y=-sin(th)*sin(wt);                %y坐标
    z=cos(th)*wt;                      %z坐标
    comet3(x,y,z)                      %画螺旋上升彗星式轨迹
    plot3(x,y,z,'LineWidth',2)         %补画轨迹
%    comet3(z,y,x)                      %画螺旋右行彗星式轨迹
%    plot3(z,y,x)                       %补画轨迹
    wt=wt+2*pi;                        %加一圈角度
end                                    %结束循环

