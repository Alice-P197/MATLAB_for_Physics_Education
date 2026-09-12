%偏振片旋转的光强变化
clear                                  %清除变量
clc;close all
r=-1:0.01:1;                           %半径向量
[X,Y]=meshgrid(r);                     %坐标矩阵
R=sqrt(X.^2+Y.^2);                     %半径矩阵
I0=ones(size(R));                      %光强单位
I0(R>1)=0;                             %半径大于1的光强改为0
s=length(r)/2;                         %数据半长度
c=linspace(0,1,64)';                   %颜色的范围
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hi=image(I0*0);                        %画图像并取句柄
colormap([c,c*0,c*0])                  %形成红色色图
%ColorMap([c,c,c])                     %形成黑白色图
%ColorMap([c,c,c*0])                    %形成黄色色图
%axis([-0.1,2.1,-0.1,2.1]*s)
axis off equal                         %隐轴并使坐标间隔相等
hold on                                %保持图像
hp=plot([1,1]*s,[1,-0.1]*s,'m','LineWidth',2);%画线并取句柄
title('二块垂直偏振片中旋转偏振片的光强变化','FontSize',16)%显示标题
pause                                  %暂停
th=0;                                  %初始角度
while 1                                %无限循环
    th=th+0.02;                        %下一角度
    I=1-cos(4*th);                     %光强(不计系数)
    set(hi,'CData',I0*I*32)            %设置光强
    set(hp,'XData',[1,1-1.1*sin(th)]*s,'YData',[1,1-1.1*cos(th)]*s)%画偏振方向
    drawnow                            %更新屏幕
    if get(gcf,'CurrentCharacter')==char(27)
        break;
    end%按ESC键退出
end                                    %结束循环

