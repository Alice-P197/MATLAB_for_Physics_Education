%两束相干光的干涉强度和干涉条纹以及可见度
clear                                  %清除变量
coherent_light_interference_fun(1)                             %用可见度1调用函数
coherent_light_interference_fun(0.6)                           %用可见度0.6调用函数
i=0:0.01:5;                            %I2/I1向量
v=2*sqrt(i)./(1+i);                    %可见度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(i,v,'LineWidth',2)                %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('干涉条纹的可见度','FontSize',fs)%标题
xlabel('光强比\itI\rm_2/\itI\rm_1','FontSize',fs)%x标签
ylabel('可见度\itV','FontSize',fs)     %y标签
txt='\itV\rm=2(\itI\rm_1\itI\rm_2)^{1/2}/(\itI\rm_1+\itI\rm_2)';%可见度文本
text(0,0.1,txt,'FontSize',fs)          %显示文本

