%相干波干涉的振幅和强度分布
clear                                  %清除变量
a2=0.1:0.3:1;                          %分振幅之比
k=2;                                   %相长干涉的级数
dphi=(-k:0.05:k)*2*pi;                  %相差向量
[A2,DPHI]=meshgrid(a2,dphi);           %化为矩阵
A=sqrt(1+A2.^2+2*A2.*cos(DPHI));       %合振幅的相对强度
I=1+A2.^2+2*A2.*cos(DPHI);             %干涉的相对强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(dphi,A,'LineWidth',2)             %画振幅曲线族
plot(dphi,A(:,1),'o-',dphi,A(:,2),'d-',...
    dphi,A(:,3),'s-',dphi,A(:,4),'^-') %画振幅曲线族
fs=16;                                 %字体大小
title('两个相干波干涉的振幅分布','FontSize',fs)%标题
xlabel('相差\Delta\it\phi','FontSize',fs)%x标签
ylabel('相对振幅\itA/A\rm_1','FontSize',fs)%y标签
grid on                                %加网格
set(gca,'XTick',(-k:k)*2*pi)           %改水平刻度
l=length(a2);                          %比值个数
legend([repmat('\itA\rm_2/\itA\rm_1=',l,1),num2str(a2')])%插入图例
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(dphi,I,'LineWidth',2)             %画干涉强度曲线族
plot(dphi,I(:,1),'o-',dphi,I(:,2),'d-',...
    dphi,I(:,3),'s-',dphi,I(:,4),'^-') %画干涉强度曲线族
grid on                                %加网格
title('两个相干波干涉的强度分布','FontSize',fs)%标题
xlabel('相差\Delta\it\phi','FontSize',fs)%x标签
ylabel('相对强度\itI/I\rm_1','FontSize',fs)%y标签
set(gca,'XTick',(-k:k)*2*pi)           %改水平刻度
legend([repmat('\itA\rm_2/\itA\rm_1=',l,1),num2str(a2')])%插入图例

