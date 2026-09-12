%圆板电容器充电时的位移电流和磁感应强度
clear                                  %清除变量
rm=4;                                  %窗口的最大宽度
r=0:0.01:rm;                           %距离向量
i=r.^2;                                %板内位移电流
i(r>1)=1;                              %板外位移电流
b=r;                                   %板内磁感应强度
l=r>1;                                 %板外逻辑值
b(l)=1./r(l);                          %板外磁感应强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot([r,rm],[i,1],'LineWidth',3)       %画位移电流曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('圆板电容器充电时的位移电流','FontSize',fs)%标题
xlabel('\itr\rm/\ita','FontSize',fs)   %标记横坐标
ylabel('\itI_D/I\rm_0','FontSize',fs)  %标记纵坐标
txt='{\itI}_0={\pi\ita}^2{\it\epsilon}_0d{\itE}/d{\itt}';%位移电流单位
text(0,0.9,txt,'FontSize',fs)          %标记磁感应强度单位
subplot(2,1,2)                         %选子图
plot([0,r],[0,b],'LineWidth',3)        %画磁感应强度曲线
grid on                                %加网格
xlabel('\itr\rm/\ita','FontSize',fs)   %标记横坐标
ylabel('\itB/B\rm_0','FontSize',fs)    %标记纵坐标
title('圆板电容器充电时的磁感应强度','FontSize',fs)%标题
txt='{\itB}_0={\ita\mu}_0{\it\epsilon}_0d{\itE}/2d{\itt}';%磁感应强度单位
text(0,0.9,txt,'FontSize',fs)          %标记磁感应强度单位

