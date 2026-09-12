%均匀带电圆柱面和圆柱体的电势和电场强度 
clear                                  %清除变量
rm=4;                                  %窗口的最大宽度
dr=0.01;                               %步长
r=1:dr:rm;                             %柱体外的自变量向量
u=-log(r);                             %柱外电势向量
e=1./r;                                %电场向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子窗口
plot([0,1],[0,0],r,e,'b','LineWidth',3)%画电场强度线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itE\rm/2\itk\lambdaR\rm^-^1','FontSize',fs)%标记纵坐标
title('均匀带电圆柱面的电场强度','FontSize',fs)%标题
subplot(2,1,2)                         %子窗口
plot([0,r],[0,u],'LineWidth',3)        %画电势线
grid on                                %加网格
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itU\rm/2\itk\lambda','FontSize',fs)%标记纵坐标
title('均匀带电圆柱面的电势','FontSize',fs)%标题
text(0,-1,'取圆柱的表面为电势零面','FontSize',fs)%文本

rr=0:dr:1;                             %柱体内的自变量向量
uu=(1-rr.^2)/2;                        %柱内电势向量
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
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itE\rm/2\itk\lambdaR\rm^-^1','FontSize',fs)%标记纵坐标
title('均匀带电圆柱体的电场强度','FontSize',fs)%标题
subplot(2,1,2)                         %子窗口
plot([rr,r],[uu,u],'LineWidth',2)      %画电势线
grid on                                %加网格
xlabel('\itr\rm/\itR','FontSize',fs)   %标记横坐标
ylabel('\itU\rm/2\itk\lambda','FontSize',fs)%标记纵坐标
title('均匀带电圆柱体的电势','FontSize',fs)%标题
text(0,-1,'取圆柱体表面为电势零面','FontSize',fs)%文本

