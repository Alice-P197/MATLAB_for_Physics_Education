%理想气体的多方过程
clear                                  %清除变量
i=[3,5,6];                             %气体分子的自由度
gamma=1+2./i;                          %比热容比
n=[0,1,gamma];                         %多方指数
v=0.5:0.05:1.5;                        %体积向量V/V0
[N,V]=meshgrid(n,v);                   %指数和体积矩阵
P=1./V.^N;                             %压强
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([1,1],[min(P(:)),max(P(:))],'ko-')%画等容线
hold on                                %保持图像
%plot(v,P,'LineWidth',2)                %画曲线族
plot(v,P(:,1),'d-',v,P(:,2),'s-',v,P(:,3),'p-',v,P(:,4),'h-',...
    v,P(:,5),'<-')                     %画曲线族
grid on                                %加网格
legend('等容过程','等压过程','等温过程','单原子气体的绝热过程',...
    '双原子气体的绝热过程','多原子气体的绝热过程')%图例
fs=16;                                 %字体大小
title('理想气体在多方过程中压强与体积的关系','FontSize',fs)%标题
xlabel('体积\itV\rm/\itV\rm_0','FontSize',fs)%横坐标
ylabel('压强\itp\rm/\itp\rm_0','FontSize',fs)%纵坐标

