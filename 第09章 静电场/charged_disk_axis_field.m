%均匀带电圆盘在轴线上的电势和电场强度 
clear                                  %清除变量
zm=4;                                  %最大横坐标
z=linspace(-zm,zm,1000);               %横坐标向量
u=2*(sqrt(1+z.^2)-abs(z));             %电势向量
e=2*sign(z).*(1-abs(z)./sqrt(1+z.^2)); %电场向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,u,z,1./abs(z),'--','LineWidth',3)%画电势线
legend('圆盘的电势','点电荷的电势',2)  %图例
grid on                                %加网格
axis([-zm,zm,0,2])                     %曲线范围
fs=16;                                 %字体大小
title('均匀带电圆盘在轴线上的电势','FontSize',fs)%标题
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itU/U\rm_0','FontSize',fs)    %标记纵坐标
text(-zm,0.5,'\itU\rm_0=\itkQ/a','FontSize',fs)%标记电势单位
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,e,z,sign(z)./z.^2,'--','LineWidth',3)%画电场强度曲线
grid on                                %加网格
axis([-zm,zm,-2,2])                    %曲线范围
legend('圆盘的电场强度','点电荷的电场强度',2)%图例
title('均匀带电圆盘在轴线上的电场强度','FontSize',fs)%标题
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
text(-zm,-1,'\itE\rm_0=\itkQ/a\rm^2','FontSize',fs)%标记场强单位

