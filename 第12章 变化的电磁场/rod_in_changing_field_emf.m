%导线棒跨接在圆柱形变化磁场的感生电动势
clear                                  %清除变量
dl=0.001;                              %间隔
l=0:dl:1;                              %导线的长度向量
e=l.*sqrt(1-l.^2);                     %感生电动势
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(l,e,'LineWidth',2)                %画电动势曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itL\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\it\epsilon_A_C/\epsilon\rm_0','FontSize',fs)%标记纵坐标
title('导线棒跨接在螺线管变化磁场的感生电动势','FontSize',fs)%标题
txt='{\it\epsilon}_0={\itR}^2d{\itB}/d{\itt}';%电动势单位
text(0,0.3,txt,'FontSize',fs)          %标记电动势单位
[em,im]=max(e);                        %最大电动势和下标
hold on                                %保持图像
stem(l(im),em,'--')                    %画最大值杆图
text(l(im),em,['(',num2str(l(im)),',',num2str(em),')'],'FontSize',fs)%标记极值

