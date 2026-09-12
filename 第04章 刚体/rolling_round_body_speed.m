%均质圆形物体滚下斜面的质心速度
clear                                  %清除变量
j=0:0.1:1;                             %转动惯量系数
vc=sqrt(1./(1+j));                     %质心速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(j,vc,'LineWidth',2)               %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('均质圆形物体滚下斜面的质心速度','FontSize',fs)%加标题
xlabel('\itJ\rm_C/\itmR\rm^2','FontSize',fs)%横坐标标签
ylabel('\itv\rm_C/(2\itgh\rm)^{1/2}','FontSize',fs)%纵坐标标签
jj=[1 2/3 1/2 2/5];                    %圆环,球壳,圆柱和球体的转动惯量系数
vv=1./sqrt(1+jj);                      %质心速度
hold on                                %保持图像
stem(jj,vv,'--')                       %画杆图
text(jj,zeros(size(jj)),num2str(jj',2),'FontSize',fs)%标记转动惯量系数
text(jj,vv,num2str(vv'),'FontSize',fs) %标记速度文本
txt=['圆环';'球壳';'圆柱';'球体'];     %物体名称
text(jj,0.5*ones(size(jj)),txt,'FontSize',fs)%标记物体

