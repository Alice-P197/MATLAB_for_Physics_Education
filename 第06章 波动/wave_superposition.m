%波的叠加原理
clear                                  %清除变量
xm=5;                                  %最大宽度
x=-xm:0.1:xm;                          %坐标向量
a1=0.5;                                %右行波的振幅
y1=a1*cos(pi*x);                       %右行余弦波的初位移
y1(x>-1.5|x<-2.5)=0;                   %右行波的初位移
a2=0.2;                                %左行波的振幅
y2=a2*cos(pi*x/2);                     %左行波
y2(x<3)=0;                             %左行波的初位移
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选子图
h1=plot(x,y1,'LineWidth',2);           %画右行波并取句柄
title('波的叠加原理','FontSize',16)    %显示标题
text(0,a1,'右行波','FontSize',16)      %显示说明
axis([-xm,xm,-0.1,a1+a2])              %设定坐标范围
grid on                                %加网格
hold on                                %保持图像
subplot(3,1,2)                         %选子图
h2=plot(x,y2,'g','LineWidth',2);       %画左行波并取句柄
text(0,a1,'左行波','FontSize',16)      %显示说明
axis([-xm,xm,-0.1,a1+a2])              %设定坐标范围
grid on                                %加网格
hold on                                %保持图像
subplot(3,1,3)                         %选子图
h=plot(x,y1+y2,'r','LineWidth',2);     %画合成波并取句柄
text(0,a1,'叠加波','FontSize',16)      %显示说明
axis([-xm,xm,-0.1,a1+a2])              %设定坐标范围
grid on                                %加网格
hold on                                %保持图像
pause                                  %暂停
while 1                                %无限循环
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    y1=[y1(end),y1(1:end-1)];          %元素右移
    set(h1,'YData',y1)                 %设置坐标
    y2=[y2(2:end),y2(1)];              %元素左移
    set(h2,'YData',y2)                 %设置坐标
    set(h,'YData',y1+y2)               %设置坐标
    drawnow                            %更新屏幕
    pause(0.05)                        %延时 
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
end                                    %结束循环

