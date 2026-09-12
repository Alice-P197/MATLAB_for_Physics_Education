%通电螺线管轴线上的场强分布
clear                                  %清除变量
%l=1:2:13;                              %半长度与半径比的向量
l=1:3:11;                              %半长度与半径比的向量
zm=20;                                 %横坐标的最大范围
z=-zm:0.1:zm;                          %横坐标向量
[L,X]=meshgrid(l,z);                   %坐标和比值矩阵
B=((L-X)./sqrt(1+(L-X).^2)+(L+X)./sqrt(1+(L+X).^2))/2;%相对磁感应强度
fs=16;                                 %字体大小
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,B,'LineWidth',2)                %画B的曲线族
plot(z,B(:,1),z,B(:,2),'--',z,B(:,3),'-.',z,B(:,4),':','LineWidth',2)%画曲线族
grid on                                %加网格
axis([-zm,zm,0,1])                     %曲线范围
hold on                                %保持图像
legend([repmat('\itL/a\rm=',length(l),1),num2str(l')])%加图例
plot([-zm;zm],[0.5;0.5],'-.')          %画水平零线
title('通电螺线管轴线上的磁感应强度分布','FontSize',fs)%显示标题
xlabel('\itz/a','FontSize',fs)         %显示横坐标
ylabel('\itB\rm/\it\mu\rm_0\itnI','FontSize',fs)%显示纵坐标

