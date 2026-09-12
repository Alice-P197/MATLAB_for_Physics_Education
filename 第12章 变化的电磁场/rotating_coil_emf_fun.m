%在通电直线磁场中绕平行轴匀速旋转线圈的电动势的函数
function fun(d)                        %输入参数是距离(与半径之比)向量
wt=linspace(0,2*pi,50);                %角度向量
[D,WT]=meshgrid(d,wt);                 %化为矩阵
RR1=1+D.^2+2*D.*cos(WT);               %一边距离的平方
RR2=1+D.^2-2*D.*cos(WT);               %对边距离的平方
E=D.*(1./RR1+1./RR2).*sin(WT);         %求电动势
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(wt,E,'LineWidth',2)               %画曲线簇
plot(wt,E(:,1),'-.',wt,E(:,2),'o-',wt,E(:,3),'--',wt,E(:,4),'d-',...
    wt,E(:,5),'.-',wt,E(:,6),'s-',wt,E(:,7),'LineWidth',2)%画曲线族
grid on                                %加网格
set(gca,'XTick',pi/2*(0:4))            %加刻度
fs=16;                                 %字体大小
xlabel('\it\omegat','FontSize',fs)     %标记横坐标
ylabel('\it\epsilon/\epsilon\rm_0','FontSize',fs)%标记纵坐标
title('在直线电流磁场中匀速旋转线圈的电动势','FontSize',fs)%标题
legend([repmat('\itd/a\rm=',length(d),1),num2str(d')])%图例

    