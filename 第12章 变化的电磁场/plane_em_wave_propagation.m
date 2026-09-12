%平面简谐电磁波的传播
clear                                  %清除变量
m=3;                                   %波的个数
x=(0:0.01:1)*m;                        %位置向量(波长倍数)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
grid on                                %加网格
box on                                 %加框架
axis([0,m,-1,1,-1,1])                  %坐标范围
fs=16;                                 %字体大小
title('平面简谐电磁波的传播','FontSize',fs)%标题
xlabel('\itx/\it\lambda','FontSize',fs)%x标签
ylabel('\itE/E\rm_0','FontSize',fs)    %y标签   
zlabel('\itH/H\rm_0','FontSize',fs)    %z标签   
e=zeros(size(x));                      %零向量
hold on                                %保持图像
he=plot(x,e,'LineWidth',2);            %电场强度曲线的句柄
hh=plot3(x,e,e,'LineWidth',2);         %磁场强度曲线的句柄
hes=stem(x,e,'r.');                    %电场强度杆图的句柄
hhs=stem3(x,e,e,'g.');                 %磁场强度杆图的句柄
pause                                  %暂停 
n=length(x);                           %坐标向量长度
i=1;                                   %起点下标
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出
    if i>n                             %如果波传播到最右边
        e=[e(end),e(1:end-1)];         %最后一个元素移到第一个
    else                               %否则
        e=[sin(2*pi*x(i)),e(1:end-1)]; %插入第一个元素,其他后移
    end                                %结束条件
    set(he,'YData',e)                  %设置电场纵坐标
    set(hh,'ZData',e)                  %设置磁场高坐标(磁场与电场同步)
    set(hes,'YData',e)                 %设置电场杆图
    set(hhs,'ZData',e)                 %设置磁场杆图
    drawnow                            %更新屏幕
    pause(0.02)                        %延时 
    i=i+1;                             %下一个点的下标
end                                    %结束循环

