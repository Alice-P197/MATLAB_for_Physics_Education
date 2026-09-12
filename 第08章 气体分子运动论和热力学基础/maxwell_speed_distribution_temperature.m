%分子在不同温度下的麦克斯韦速度分布律
clear                                  %清除变量
k=1.38E-23;                            %玻尔兹曼常数
m=32*1.66E-27;                         %氧原子质量
t=(3:6)*100;                           %热力学温度向量
l=length(t);                           %向量长度
v=-1400:1400;                          %速度向量
[V,T]=meshgrid(v,t);                   %速度和温度矩阵
FV=(m./(2*pi*k*T)).^0.5.*exp(-V.^2*m./(2*k*T));%速度分布函数矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(v,FV)                             %画曲线族
plot(v,FV(1,:),v,FV(2,:),'--',v,FV(3,:),'-.',v,FV(4,:),':',...
    'LineWidth',2)                     %画曲线族
grid on                                %加网格
legend([repmat('\itT\rm=',l,1),num2str(t'),repmat('K',l,1)])%图例
fs=16;                                 %字体大小
title('温度不同的麦克斯韦速度分布曲线的比较','FontSize',fs)%标题
xlabel('速度\itv\rm/m\cdots^-^1','FontSize',fs)%横坐标
ylabel('速度分布函数\itF\rm(\itv\rm)/s\cdotm^-^1','FontSize',fs)%纵坐标
text(0,0,'氧气O_2:32u','FontSize',fs)  %显示文本

