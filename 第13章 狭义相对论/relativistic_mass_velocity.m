%相对论质量与速度的关系
clear                                  %清除变量
v=0:0.01:1;                            %质点的速度向量
v(end)=1-eps;                          %最后一个速度接近光速
m=1./sqrt(1-v.^2);                     %质量与静止质量的关系
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v,m,'LineWidth',2)                %画质量曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('相对论质量与速度的关系曲线','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itm/m\rm_0','FontSize',fs)    %纵坐标
axis([0,1,0,8])                        %坐标范围
text(0,0.5,'\itc\rm为光速,\itm\rm_0为静止质量','FontSize',fs)%光速和质量文本

