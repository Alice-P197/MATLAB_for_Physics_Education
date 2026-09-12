%火车笛鸣的多普勒效应
clear                                  %清除变量
xm=10;                                 %最大坐标
x=-xm:0.1:xm;                          %坐标向量
v=0.1:0.1:0.4;                         %火车速度向量
n=length(v);                           %火车速度个数
[V,X]=meshgrid(v,x);                   %速度和坐标矩阵
F=1./(1+V.*X./sqrt(1+X.^2));           %路人听到的频率
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(x,F,'LineWidth',2)               %画频率曲线族
%plot(x,F(:,1),'o-',x,F(:,2),'d-',x,F(:,3),'s-',x,F(:,4),'p-','LineWidth',2)%画频率曲线族
plot(x,F(:,1),x,F(:,2),'--',x,F(:,3),'-.',x,F(:,4),':','LineWidth',2)%画频率曲线族
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itx/d','FontSize',fs)         %x标签
ylabel('\itf_B/f\rm_0','FontSize',fs)  %y标签   
title('火车笛鸣的多普勒效应','FontSize',fs)%标题
%leg=[repmat('\itv_A/v\rm=',n,1),num2str(v')];%图例字符串
legend([repmat('\itv_A/v\rm=',n,1),num2str(v')])%图例

f=1./(1-v);                            %火车在远处过来时路人听到的频率
x=ones(1,length(v));                   %全1向量
hold on                                %保持图像
plot(-x*xm,f,'.')                      %画点
text(-x*xm,f,num2str(num2str(f')),'FontSize',16)%标记火车在远处时接收者接收的频率
f=1./(1+v);                            %火车离开到远处时路人听到的频率
plot(x*xm,f,'.')                       %画点
text(x*xm,f,num2str(num2str(f')),'FontSize',16,...
    'HorizontalAlignment','Right')     %标记火车离开在远处时接收者接收的频率

