%横波的形成
clear                                  %清除变量
xm=2;                                  %横坐标右界,也是波长的个数
dx=0.01;                               %横坐标间隔
x=0:dx:xm;                             %横坐标向量
n=length(x);                           %坐标向量长度
u=zeros(1,n);                          %初位移为零
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=plot(x,u,'LineWidth',2,'EraseMode','xor');%波的句柄
%h=plot(x,u,'LineWidth',2);             %波的句柄(较慢)
grid on                                %加网格
axis([0,xm,-0.5,0.5])                  %曲线范围
axis equal                             %使坐标间隔相等
fs=16;                                 %字体大小
title('横波的形成','FontSize',fs)      %标题
xlabel('\itx\rm/\it\lambda','FontSize',fs)%x标签
ylabel('\itu\rm/\it\lambda','FontSize',fs)%y标签   
a=0.1;                                 %振幅
text(0,2*a,['\itA\rm=',num2str(a),'\it\lambda'],'FontSize',fs)%显示振幅
hold on                                %保持图像
t=0;                                   %初始时刻
dt=dx;                                 %时间间隔
tm=xm;                                 %最大时间,周期个数
pause                                  %暂停 
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
    t=t+dt;                            %下一时刻
    if get(gcf,'CurrentCharacter')==char(27),break,end%按ESC键退出循环
    if t<=tm                           %如果波没有传播到最右边
        u=[a*sin(2*pi*t),u(1:end-1)];  %插入第一个元素,其他前移
    else                               %否则
        u=[u(end),u(1:end-1)];         %最后一个元素移到第一个
    end                                %结束条件
    set(h,'YData',u)                   %设置横波纵坐标
    drawnow                            %更新屏幕
    pause(0.01)                        %延时 
end                                    %结束循环

