%无限长通电螺线管磁场变化时的感生电场
clear                                  %清除变量
rm=4;                                  %窗口的最大宽度
dr=0.01;                               %间隔
r=1:dr:rm;                             %管外的自变量向量
e=1/2./r;                              %管外电场强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot([0,r],[0,e],'LineWidth',2)        %画电场强度曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
title('无限长通电螺线管磁场变化时的感生电场','FontSize',fs)%标题
text(0,0.4,'{\itE}_0={\itR}d{\itB}/d{\itt}','FontSize',fs)%标记电场强度单位
r=0:dr:1;                              %管内的自变量向量
e=r.^2;                                %管内电动势
subplot(2,1,2)                         %选子图
plot([r,rm],[e,1],'LineWidth',3)       %画电动势曲线
grid on                                %加网格
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\it\epsilon/\epsilon\rm_0','FontSize',fs)%标记纵坐标
title('无限长通电螺线管磁场变化时回路中的感生电动势','FontSize',fs)%标题
text(0,0.95,'{\it\epsilon}_0=\pi{\itR}^2d{\itB}/d{\itt}','FontSize',fs)%标记电场强度单位
