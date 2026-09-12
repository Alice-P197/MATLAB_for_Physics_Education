%环电流在轴线上的磁场
clear                                  %清除变量
zm=5;                                  %最大距离
dz=0.01;                               %步长
z=-zm:dz:zm;                           %环电流的自变量向量
bz=1./(1+z.^2).^(3/2);                 %环电流的磁感应强度向量
zz=1:dz:zm;                            %磁矩的自变量向量
bm=1./zz.^3;                            %磁矩的磁感应强度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,bz,[-fliplr(zz),zz],[fliplr(bm),bm],'--','LineWidth',2)%画磁感应强度线
fs=16;                                 %字体大小
title('环电流在轴线上的磁感应强度','FontSize',fs)%标题
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itB_z/B\rm_0','FontSize',fs)  %显示y坐标
legend('环电流','磁矩')                %加图例
grid on                                %加网格
text(-zm,0.5,'\itB\rm_0=\it\mu\rm_0\itI\rm/2\ita',...
    'FontSize',fs)                     %显示磁感应强度单位文本

