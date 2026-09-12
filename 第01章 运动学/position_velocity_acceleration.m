%质点运动的位置,速度和加速度
clear                                  %清除变量
tm=3;                                  %最大时间
dt=0.1;                                  %时间间隔
t1=0:tm;                               %以1秒为间隔的时间向量
x1=5*t1-t1.^3;                         %位置坐标
v1=diff(x1)/dt;                        %速度的平均值
v1=[5,v1];                             %补充初速度
a1=diff(v1)/dt;                        %加速度的平均值
a1=[0,a1];                             %补充初加速度

dt=0.1;                                %时间间隔
t2=0:dt:tm;                            %以0.1秒为间隔的时间向量
x2=5*t2-t2.^3;                         %位移
v2=diff(x2)/dt;                        %速度的平均值
v2=[5,v2];                             %补充初速度
a2=diff(v2)/dt;                        %加速度的平均值
a2=[0,a2];                             %补充初加速度

dt=0.01;                               %时间间隔
t3=0:dt:tm;                            %以0.01秒为间隔的时间向量
x3=5*t3-t3.^3;                         %位移
v3=diff(x3)/dt;                        %速度的平均值
v3=[5,v3];                             %补充初速度
a3=diff(v3)/dt;                        %加速度的平均值
a3=[0,a3];                             %补充初加速度

x=5*t2-t2.^3;                          %坐标的瞬时值
v=5-3*t2.^2;                           %速度的瞬时值
a=-6*t2;                               %加速度的瞬时值
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(t1,x1,'-*',t2,x2,'-+',t3,x3,'.-',t2,x,'-o')%画位置坐标曲线族
legend('1','0.1','0.01','瞬时值')      %插入时间差图例
grid on                                %加网格
title('质点的位置','FontSize',16)      %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\itx\rm/m','FontSize',16)      %纵坐标标签
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(t1,v1,'-*',t2,v2,'-+',t3,v3,'.-',t2,v,'-o')%画速度曲线族
legend('1','0.1','0.01','瞬时值')      %插入时间差图例
grid on                                %加网格
title('质点的速度','FontSize',16)      %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\itv\rm/m\cdots^-^1','FontSize',16)%纵坐标标签
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(t1,a1,'-*',t2,a2,'-+',t3,a3,'.-',t2,a,'-o')%画加速度曲线族
legend('1','0.1','0.01','瞬时值')      %插入时间差图例
grid on                                %加网格
title('质点的加速度','FontSize',16)    %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\ita\rm/m\cdots^-^2','FontSize',16)%纵坐标标签

