%直线电荷与带电线段之间的作用力
clear                                  %清除变量
theta=0:30:90;                         %角度向量
th=theta*pi/180;                       %化为弧度
dm=2;                                  %最大距离(与半长之比)
d=linspace(-dm,dm,400);                %距离向量
[TH,D]=meshgrid(th+sqrt(eps),d);       %化为矩阵
F=log(abs((D+sin(TH))./(D-sin(TH))))./sin(TH);%求电场力
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(d,F,'LineWidth',2)                %画曲线族
plot(d,F(:,1),d,F(:,2),'--',d,F(:,3),'-.',d,F(:,4),':','LineWidth',2)%画曲线族
grid on                                %加网格
axis([-dm,dm,-8,8])                    %曲线范围
fs=16;                                 %字体大小
title('直线电荷与带电线段之间的作用力','FontSize',fs)%标题
xlabel('\itd/L','FontSize',fs)         %标记横坐标
ylabel('\itF/F\rm_0','FontSize',fs)    %标记纵坐标
n=length(th);                          %角度个数
legend([repmat('\it\theta\rm=',n,1),num2str(theta'),...
    repmat('\circ',n,1)],2)            %加图例
text(-dm,0,'\itF\rm_0=\itk\lambdaq/L','FontSize',fs)%标记力的单位

