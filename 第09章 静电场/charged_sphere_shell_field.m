%均匀带电球面和球体的电场强度和电势 
clear                                  %清除变量
rm=4;                                  %窗口的最大宽度
dr=0.01;                               %步长
r=1:dr:rm;                             %自变量向量
u=1./r;                                %电势向量
e=1./r.^2;                             %电场向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子窗口
plot([0,1],[0,0],r,e,'b','LineWidth',2)%画电场强度线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
title('均匀带电球面的电场强度','FontSize',fs)%标题
text(0,0.8,'\itE\rm_0=\itkQ/R\rm^2','FontSize',fs)%标记电场强度单位
subplot(2,1,2)                         %子窗口
plot([0,r],[1,u],'LineWidth',2)        %画电势线
grid on                                %加网格
title('均匀带电球面的电势','FontSize',fs)%标题
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itU/U\rm_0','FontSize',fs)    %标记纵坐标
text(0,0.5,'\itU\rm_0=\itkQ/R','FontSize',fs)%标记电势单位

rr=0:dr:1;                             %球体内的自变量向量
uu=(3-rr.^2)/2;                        %球内电势向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子窗口
plot([0,r],[0,e],'LineWidth',2)        %画电场强度线
grid on                                %加网格
title('均匀带电球体的电场强度','FontSize',fs)%标题
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
text(0,0.8,'\itE\rm_0=\itkQ/R\rm^2','FontSize',fs)%标记电场强度单位
subplot(2,1,2)                         %子窗口
plot([rr,r],[uu,u],'LineWidth',2)      %画电势线
grid on                                %加网格
title('均匀带电球体的电势','FontSize',fs)%标题
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itU/U\rm_0','FontSize',fs)    %标记纵坐标
text(0,0.5,'\itU\rm_0=\itkQ/R','FontSize',fs)%标记电势单位

