%同向平行直线电流在连线上和中垂线上的磁感应强度
clear                                  %清除变量
rm=4;                                  %最大坐标
r=-rm:0.01:rm;                         %坐标向量(需要奇点)
%r=linspace(-rm,rm,200);                %坐标向量(绕过奇点)
%b1=2./(r+1)+1./(r-1);                  %电流连线上的磁感应强度(y方向)
b1=4*r./(r.^2-1);                      %电流连线上的磁感应强度(y方向)
b2=-4*r./(r.^2+1);                     %电流中垂线上的磁感应强度(x方向)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(r,b1,'LineWidth',2)               %画曲线
grid on                                %加网格
axis([-rm,rm,-20,20])                  %坐标范围
tit='等强同向平行直线电流在连线上的磁感应强度';%标题
fs=16;                                 %字体大小
title(tit,'FontSize',fs)               %显示标题
xlabel('\itx/a','FontSize',fs)         %显示x坐标
ylabel('\itB\rm_1/\itB\rm_0','FontSize',fs)%显示y坐标
txt='\itB\rm_0=\itk\rm_m\itI/a';       %磁感应强度单位文本
text(-rm,-10,txt,'FontSize',fs)        %显示单位文本
subplot(2,1,2)                         %选子图
plot(r,b2,'LineWidth',2)               %画曲线
grid on                                %加网格
title('等强同向平行直线电流在中垂线上的磁感应强度','FontSize',fs)%显示标题
xlabel('\ity/a','FontSize',fs)         %显示x坐标
ylabel('\itB\rm_2/\itB\rm_0','FontSize',fs)%显示y坐标

