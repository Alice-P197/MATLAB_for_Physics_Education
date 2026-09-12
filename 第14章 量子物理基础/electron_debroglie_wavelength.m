%电子的德布罗意波长
clear                                  %清除变量
u=(0.01:0.001:1)/1000;                 %电势差向量(单位U0)
uu=150;                                %电势差(单位V)
%u=0.01:0.001:1;                        %电势差向量(单位U0)
%uu=1e4;                                %电势差(单位V)
c=2.99792458e8;                        %光速
h=6.62606876e-34;                      %普朗克常数
e=1.602176462e-19;                     %电子的电量
me=9.10938188e-31;                     %电子的质量
l1=1./sqrt(2*u);                       %电子低速运动的德布罗意波长
l2=1./sqrt(2*u.*(u/2+1));              %电子高速运动的德布罗意波长
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(u,l2,u,l1,'--','LineWidth',2)     %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('电子的德布罗意波长与电势差的关系','FontSize',fs)%标题
xlabel('电势差\itU/U\rm_0','FontSize',fs)%横坐标
ylabel('波长\it\lambda/\lambda\rm_C','FontSize',fs)%纵坐标
lc=h/me/c;                             %电子的康普顿波长
txt=['\it\lambda\rm_C=',num2str(lc),'m'];%电子的康普顿波长文本
text(0,max(l1),txt,'FontSize',fs)      %显示康普顿波长
u0=me*c^2/e;                           %电势差单位
txt=['\itU\rm_0=',num2str(u0),'V'];    %电势差单位文本
text(0,max(l1)/2,txt,'FontSize',fs)    %显示电势差单位
legend('高速运动','低速运动')          %图例
l=h/sqrt(2*me*e*uu);                   %德布罗意波长
hold on                                %保持图像
plot(uu/u0,l/lc,'o')                   %画点
txt=['\itU\rm=',num2str(uu),'V'];      %电势差文本
txt=[txt ',\it\lambda\rm=',num2str(l*1e9),'nm'];%连接波长文本
text(uu/u0,l/lc,txt,'FontSize',fs)     %显示波长
d=0.1;                                 %相对误差
[dm,i]=min(abs(abs((l2-l1)./l2)-d));   %求相对误差的下标
plot(u(i),l2(i),'*','MarkerSize',fs)   %画相对误差点

