%牛顿环
clear                                  %清除变量
rm=5;                                  %最大半径(相对坐标)
r=-rm:0.01:rm;                         %横坐标或纵坐标向量
[X,Y]=meshgrid(r);                     %横坐标和纵坐标矩阵
R=sqrt(X.^2+Y.^2);                     %求各点到圆心的距离
I=cos(pi*(R.^2+1/2)).^2;               %反射光的相对光强
I(R>rm)=0;          %最大半径外的光强改为0(将方形图改为圆形图,四角为黑色)
c=linspace(0,1,64)';                   %颜色范围
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=image(I*64);                         %画图像
colormap([c,c*0,c*0])                  %形成红色色图
%ColorMap([c,c,c*0])                    %形成黄色色图
%ColorMap([c,c,c])                      %形成白色色图
axis off equal                         %隐轴
title('牛顿环(反射光)','FontSize',16)  %标题
pause                                  %暂停
d=0;                                   %初始距离
while 1                                %无限循环
    d=d+0.02;                          %增加距离
    I=cos(pi*(R.^2+1/2+2*d)).^2;       %反射光的相对光强
    I(R>rm)=0;                         %最大半径外的光强改为0
    set(h,'CData',64*I)                %设置光强
    drawnow                            %更新屏幕
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出
end                                    %结束循环

