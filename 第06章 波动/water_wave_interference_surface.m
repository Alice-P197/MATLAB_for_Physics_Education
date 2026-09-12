%水波的振动曲面和干涉图样
clear                                  %清除变量
a=1.5;                                 %两缝中心的半距离(以波长为单位)
%a=2;                                   %两缝中心的半距离(以波长为单位)
xm=10;                                 %横坐标右边界(以波长为单位)
x=0:0.05:xm;                           %横坐标向量
ym=5;                                  %纵坐标范围(以波长为单位)
y=-ym:0.05:ym;                         %纵坐标向量
[X,Y]=meshgrid(x,y);                   %坐标矩阵
R1=sqrt(X.^2+(Y-a).^2);                %第一孔的光程
R2=sqrt(X.^2+(Y+a).^2);                %第二孔的光程
A0=0.1;                                %分振幅(波长的倍数)
A=2*A0*abs(cos(pi*(R2-R1)));           %波的振幅
PHI=atan2(-(sin(2*pi*R1)+sin(2*pi*R2)),...
    (cos(2*pi*R1)+cos(2*pi*R2)));      %合位移的相位
U=A.*cos(PHI);                         %各点的相对位移
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=surf(X,Y,U);                         %画曲面并取句柄
axis off equal                         %不显示坐标并使坐标间隔相等
shading interp                         %染色
title('水波的传播曲面','FontSize',20)   %显示标题
c=linspace(0,1,64)';                   %颜色的范围
%colormap([c,c,c])                      %形成黑白色图
ColorMap([c,0*c,0*c])                  %形成红色图
%ColorMap([0*c,c,0*c])                  %形成绿色图
%ColorMap([0*c,0*c,c])                  %形成蓝色图
%ColorMap([c,c,0*c])                    %形成黄色图
%ColorMap([c,0*c,c])                    %形成紫色图
%ColorMap([0*c,c,c])                    %形成青色图
%ColorMap([0.5*c,0.5*c,0.5*c])          %形成红色图
hold on                                %保持图像
wt=0;                                  %初始无量纲时间
while 1                                %无限循环
    U=A.*cos(wt+PHI);                  %某时各点波的位移
    set(h,'ZData',U)                   %设置曲面坐标
    drawnow                            %更新屏幕
    if wt==0,pause,end                 %初始时暂停
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则中断循环
    wt=wt+0.2;                         %时间延续
end                                    %结束循环
view(2)                                %设置俯视
title('水波的干涉图样','FontSize',20)  %显示标题

