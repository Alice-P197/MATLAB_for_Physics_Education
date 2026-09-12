%小球与蹄状物碰撞的摆角和损失的机械能
clear                                  %清除变量
m=0:0.5:2;                             %M/m的质量比向量
n=length(m);                           %质量比的个数
theta=0:5:90;                          %张角的度数向量
th=theta*pi/180;                       %化为弧度
[M,TH]=meshgrid(m,th);                 %质量比和张角矩阵
PHI=2*asin(sin(TH/2)./(1+M))*180/pi;   %计算摆角
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,PHI)                        %画曲线族
plot(theta,PHI(:,1),'o-',theta,PHI(:,2),'s-',theta,PHI(:,3),'d-',...
    theta,PHI(:,4),'p-',theta,PHI(:,5),'h-')%画曲线族
fs=16;                                 %字体大小
xlabel('\it\theta\rm/\circ','FontSize',fs)%加张角标签
ylabel('\it\phi\rm/\circ','FontSize',fs)%加摆角标签
title('小球与蹄状物完全非弹性碰撞的张角','FontSize',fs)%加标题
grid on                                %加网格
legend([repmat('质量比\itM/m\rm=',n,1),num2str(m')],2)%加图例

DE=M./(1+M).*(1-cos(TH));              %物体系统碰撞后损失的机械能
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,DE)                         %画曲线族
plot(theta,DE(:,1),'o-',theta,DE(:,2),'d-',theta,DE(:,3),'s-',...
    theta,DE(:,4),'p-',theta,DE(:,5),'h-')%画曲线族
xlabel('\it\theta\rm/\circ','FontSize',fs)%加张角标签
ylabel('\Delta\itE/mgl','FontSize',fs) %加能量标签
title('小球与蹄状物完全非弹性碰撞损失的机械能','FontSize',fs)%加标题
grid on                                %加网格
legend([repmat('质量比\itM/m\rm=',n,1),num2str(m')],2)%加图例

