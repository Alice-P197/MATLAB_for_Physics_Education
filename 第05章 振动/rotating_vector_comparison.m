%用旋转矢量法比较同频率不同初相位的简谐振动位移曲线的动画
clear                                  %清除变量
phi=input('请输入第一个初相位的度数:');%键入初相位
%phi=30;                                %参考值
phi1=phi*pi/180;                       %第一个振动的初相位
phi=input('请输入第二个初相位的度数:');%键入初相位
%phi=60;                                %参考值
phi2=phi*pi/180;                       %第一个振动的初相位
T=2;                                   %周期
omega=2*pi/T;                          %角速度
n=2;                                   %周期的个数
dt=0.01;                               %时间步长
t=(0:dt:T)*n;                          %时间向量
x1=cos(omega*t+phi1);                  %第一个振动的位移
y1=sin(omega*t+phi1);                  %第一个矢量y轴投影
x2=cos(omega*t+phi2);                  %第二个振动的位移
y2=sin(omega*t+phi2);                  %第二个矢量y轴投影
b=1.2;                                 %轴的半宽度
fs=12;                                 %字体大小
figure                                 %建立图形窗口并取句柄
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot('Position',[0,0.3,0.4,0.4])    %建立第一个图形子窗口
plot([-b,b],[0,0],[0,0],[-b,b],'b','LineWidth',2)%画横轴和纵轴
hold on                                %保持图像
plot(0,b,'^',-b,0,'b<','MarkerFaceColor','b')%加箭头
axis equal off                         %使轴相等
plot(0,0,'o')                          %画原点
text(0.1,b,'\itx','FontSize',fs)       %加位移符号
text(-b,0.2,'\ity','FontSize',fs)      %加符号
th=(0:100)/100*2*pi;                   %角度向量
plot(cos(th),sin(th),'--','LineWidth',2)%画参考圆
h1=quiver(0,0,-y1(1),x1(1),'r','LineWidth',3);%画第一个矢量并取句柄
h2=quiver(0,0,-y2(1),x2(1),'k--','LineWidth',3);%画第二个矢量并取句柄
subplot('position',[0.4,0.25,0.55,0.5])%建立第二个图形子窗口
plot([0,t(end)],[0,0],[0,0],[-b,b],'LineWidth',2)%画纵轴
hold on                                %保持图像
plot(0,b,'^',t(end),0,'>','MarkerFaceColor','b')%加箭头
text(t(end),-0.1,'\itt','FontSize',fs) %加时间符号
text(0.1,b,'\itx','FontSize',fs)       %加位移符号
axis off                               %隐轴
plot(0,0,'o')                          %画原点
plot(0,x1(1),'r.',0,x2(1),'k.')        %画位移的起点
title('两个简谐振动的相位差就两个旋转矢量之间的夹角','FontSize',fs)%显示标题
xlabel('时间\itt\rm/s','FontSize',fs)  %标记横轴
pause                                  %暂停
for i=2:length(t)                      %按时间循环
    set(h1,'UData',-y1(i),'VData',x1(i))%设置第一个矢量尖端的坐标
    set(h2,'UData',-y2(i),'VData',x2(i))%设置第二个矢量尖端的坐标
    drawnow                            %刷新屏幕
    tt=[t(i-1),t(i)];                  %相邻时间向量
    plot(tt,[x1(i-1),x1(i)],'r',tt,[x2(i-1),x2(i)],'k','LineWidth',2)%画位移曲线
end                                    %结束循环

