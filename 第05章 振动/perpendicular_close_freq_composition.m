%互相垂直的频率相差很小的简谐振动的合成
clear                                  %清除变量
w1=2*pi;                               %x角频率
w2=w1+pi/50;                           %y角频率
T=2*pi/w1;                             %x周期
n=100;                                 %周期个数
t=(0:0.00001:T)*n;                     %时间向量
a2=0.8;                                %y振幅
x=cos(w1*t);                           %计算横坐标
y=a2*cos(w2*t);                        %计算纵坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
comet(x,y)                             %画彗星式曲线
plot(x,y)                              %画轨迹
axis equal                             %使坐标相等
axis([-1,1,-a2,a2])                    %坐标范围
fs=16;                                 %字体大小
xlabel('\itx/A\rm_1','FontSize',fs)    %加x标签
ylabel('\ity/A\rm_1','FontSize',fs)    %加y标签
title('互相垂直的频率相差很小的简谐振动的合成','FontSize',fs)%加标题

