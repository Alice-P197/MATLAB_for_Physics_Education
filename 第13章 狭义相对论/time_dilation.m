%时间膨胀效应
clear                                  %清除变量
u=-1:0.01:1;                           %速度向量(以光速为单位)
u(1)=u(1)+eps;                         %第一个速度接近光速
u(end)=u(end)-eps;                     %最后一个速度接近光速
t=1./sqrt(1-u.^2);                     %运动时与速度的关系
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(u,t,'LineWidth',2)                %画时间膨胀曲线
grid on                                %加网格
axis([-1,1,0,8])                       %坐标范围
fs=16;                                 %字体大小
title('时间膨胀与系统相对速度的关系曲线','FontSize',fs)%标题
xlabel('\itu/c','FontSize',fs)         %横坐标
ylabel('\it\tau/\tau\rm_0','FontSize',fs)%纵坐标
text(0,0.5,'\itc\rm为光速,\it\tau\rm_0为本征时间','FontSize',fs)%显示光速和本征时

