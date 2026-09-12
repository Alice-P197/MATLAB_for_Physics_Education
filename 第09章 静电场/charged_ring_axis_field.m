%均匀带电圆环在轴线上的电势和电场强度
clear                                  %清除变量
zm=4;                                  %最大横坐标
z=linspace(-zm,zm,1000);               %横坐标向量
u=1./sqrt(1+z.^2);                     %电势向量
e=z./(1+z.^2).^(3/2);                  %电场向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,u,z,1./abs(z),'--','LineWidth',3)%画电势线
legend('圆环的电势','点电荷的电势',2)   %图例
grid on                                %加网格
axis([-zm,zm,0,1])                     %曲线范围
fs=16;                                 %字体大小
title('均匀带电圆环在轴线上的电势','FontSize',fs)%标题
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itU/U\rm_0','FontSize',fs)    %标记纵坐标
text(-zm,0.1,'\itU\rm_0=\itkQ/a','FontSize',fs)%标记电势的单位文本
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,e,z,sign(z)./z.^2,'--','LineWidth',3)%画电场强度曲线
legend('圆环的电场强度','点电荷的电场强度',2)%图例
grid on                                %加网格
axis([-zm,zm,-0.5,0.5])                %曲线范围
title('均匀带电圆环在轴线上的电场强度','FontSize',fs)%标题
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
text(-zm,-0.3,'\itE\rm_0=\itkQ/a\rm^2','FontSize',fs)%标记电场强度的单位文本
[em,im]=max(e);                        %求最大值和下标
zi=z(im);                              %求最大值的横坐标
hold on                                %保持图像
stem(zi,em,'--')                       %画杆图
text(zi,em,num2str(em),'FontSize',fs)  %显示最大值
text(zi,0,num2str(zi),'FontSize',fs)   %显示最大值的横坐标

