%质量不同的分子的麦克斯韦速度分布律
clear                                  %清除变量
k=1.38E-23;                            %玻尔兹曼常数
m0=1.66E-27;                           %原子质量单位
m=[2,4,20,28,32,38];                   %质量向量
l=length(m);                           %向量长度
n='氢氦氖氮氧氟';                      %气体分子名
t=300;                                 %热力学温度
v=-1400:50:1400;                       %速度向量
[M,V]=meshgrid(m*m0,v);                %速度和质量矩阵
FV=(M/(2*pi*k*t)).^0.5.*exp(-V.^2.*M/(2*k*t));%速度分布函数矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(v,FV,'LineWidth',2)               %画曲线族
plot(v,FV(:,1),'o-',v,FV(:,2),'d-',v,FV(:,3),'s-',v,FV(:,4),'p-',...
    v,FV(:,5),'h-',v,FV(:,6),'<-')     %画曲线族
grid on                                %加网格
legend([n',repmat('气:',l,1),num2str(m')])%图例
fs=16;                                 %字体大小
title('分子质量不同的麦克斯韦速度分布曲线的比较','FontSize',fs)%标题
xlabel('速度\itv\rm/m\cdots^-^1','FontSize',fs)%横坐标
ylabel('速度分布函数\itF\rm(\itv\rm)/s\cdotm^-^1','FontSize',fs)%纵坐标
text(0,0,['\itT\rm=',num2str(t),'K'],'FontSize',fs)%温度文本

