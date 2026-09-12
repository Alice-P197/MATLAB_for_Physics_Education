%重力场中气体分子按高度分布曲线(玻尔兹曼分布律)
clear                                  %清除变量
k=1.38e-23;                            %玻尔兹曼常数
m0=1.66e-27;                           %原子质量单位
m=[2,20,28,32,38];                     %分子量向量
n='氢氖氮氧氟';                        %气体分子名
l=length(m);                           %质量向量长度
z=0:5:100;                             %高度向量(以千米为单位)
z0=1000;                               %千米
[M,Z]=meshgrid(m*m0,z*z0);             %质量(以千克为单位)和高度(以米为单位)矩阵
g=9.8;                                 %重力加速度
t=300;                                 %热力学温度
N=exp(-M*g.*Z/k/t);                    %气体分子数密度矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,N,'LineWidth',2)                %画曲线族
plot(z,N(:,1),'o-',z,N(:,2),'d-',z,N(:,3),'s-',z,N(:,4),'p-',...
    z,N(:,5),'h-')                     %画曲线族
h=legend([n',repmat('气:',l,1),num2str(m')]);%显示图例并取句柄
fs=16;                                 %字体大小
set(h,'FontSize',fs)                   %放大图例
grid on                                %加网格
title('重力场中不同质量的气体分子按高度分布','FontSize',fs)%标题
xlabel('高度\itz\rm/km','FontSize',fs) %横坐标
ylabel('气体分子数密度\itn/n\rm_0','FontSize',fs)%纵坐标
text(0,0.05,['\itT\rm = ',num2str(t),'K'],'FontSize',fs)%显示温度文本

z=0:20;                                %高度向量(以千米为单位)
t=100:50:400;                          %热力学温度向量
[T,Z]=meshgrid(t,z*z0);                %温度和高度矩阵
m=32*m0;                               %氧气分子质量
N=exp(-m*g*Z/k./T);                    %气体分子数密度矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,N,'LineWidth',2)                %画曲线族
plot(z,N(:,1),'o-',z,N(:,2),'d-',z,N(:,3),'s-',z,N(:,4),'p-',...
    z,N(:,5),'h-',z,N(:,6),'<-',z,N(:,7),'>-')%画曲线族
grid on                                %加网格
l=length(t);                           %向量长度
legend([num2str(t'),repmat('K',l,1)])  %显示图例
title('重力场中氧气分子在不同温度下按高度分布','FontSize',fs)%标题
xlabel('高度\itz\rm/km','FontSize',fs) %横坐标
ylabel('气体分子数密度\itn/n\rm_0','FontSize',fs)%纵坐标
text(0,0.15,'氧气O_2','FontSize',fs)   %显示气体文本

