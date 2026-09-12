%粒子衰变后的能量,动量和速度
clear                                  %清除变量
m20=0:0.25:1;                          %B粒子的静止质量(参数)
m10=0:0.05:1;                          %A粒子的静止质量(自变量)
[M10,M20]=meshgrid(m10,m20);           %质量矩阵
E1=(1+M10.^2-M20.^2)/2;                %求A粒子的能量
E1(M10>1-M20)=nan;                     %不合理的能量改为非数
V1=sqrt(((1+M10).^2-M20.^2).*((1-M10).^2-M20.^2))./(1+M10.^2-M20.^2);%求A粒子速度
%V1=sqrt(1-2*M10.^2-2*M20.^2+(M10.^2-M20.^2).^2)./(1+M10.^2-M20.^2);%求A粒子速度
P1=sqrt(((1+M10).^2-M20.^2).*((1-M10).^2-M20.^2))/2;%求A粒子的动量
s1='1-e1-e2';                          %系统能量(质量)守恒方程字符串
s2='p1+p2';                            %系统动量守恒方程字符串
s3='e1^2-p1^2-m10^2';                  %A粒子的能量-动量关系字符串
s4='e2^2-p2^2-m20^2';                  %B粒子的能量-动量关系字符串
[e1,e2,p1,p2]=solve(s1,s2,s3,s4,'e1,e2,p1,p2')%求解两粒子的能量和动量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(m10,E1)                           %画能量曲线
plot(m10,E1(1,:),'o-',m10,E1(2,:),'d-',m10,E1(3,:),'s-',...
    m10,E1(4,:),'p-',m10,E1(5,:),'h-','LineWidth',2)%画能量曲线族
grid on                                %加网格
axis tight                             %贴轴
fs=16;                                 %字体大小
title('静止粒子衰变后的能量与粒子的静止质量的关系','FontSize',fs)%标题
xlabel('静止质量\itm\rm_1_0/\itm\rm_0','FontSize',fs)%横坐标
ylabel('能量\itE\rm_1/\itm\rm_0\itc\rm^2','FontSize',fs)%纵坐标
legend([repmat('\itm\rm_2_0/\itm\rm_0=',length(m20),1),num2str(m20')],2)%图例
hold on                                %保持图像
plot(m10,m10,'--','LineWidth',2)       %画最高能量线
E1=subs(e1(2),{'m10','m20'},{M10,M20});%求A粒子的能量值
E1(M10>1-M20)=nan;                     %不合理的能量改为非数
plot(m10,E1,'.')                       %再画能量曲线
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(m10,P1)                           %画动量曲线
plot(m10,P1(1,:),'o-',m10,P1(2,:),'d-',m10,P1(3,:),'s-',...
    m10,P1(4,:),'h-',m10,P1(5,:),'p-','LineWidth',2)%画动量曲线族
title('静止粒子衰变后的动量与粒子的静止质量的关系','FontSize',fs)%标题
xlabel('静止质量\itm\rm_1_0/\itm\rm_0','FontSize',fs)%横坐标
ylabel('动量\itp\rm_1/\itm\rm_0\itc','FontSize',fs)%纵坐标
legend([repmat('\itm\rm_2_0/\itm\rm_0=',length(m20),1),num2str(m20')])%图例
P1=subs(p1(2),{'m10','m20'},{M10,M20});%求A粒子的动量值
hold on                                %保持图像
plot(m10,P1,'.')                       %再画动量曲线
grid on                                %加网格
axis tight                             %贴轴
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(m10,V1)                           %画速度曲线
plot(m10,V1(1,:),'o-',m10,V1(2,:),'d-',m10,V1(3,:),'s-',...
    m10,V1(4,:),'p-',m10,V1(5,:),'h-','LineWidth',2)%画速度曲线族
title('静止粒子衰变后的速度与粒子的静止质量的关系','FontSize',fs)%标题
xlabel('静止质量\itm\rm_1_0/\itm\rm_0','FontSize',fs)%横坐标
ylabel('速度\itv\rm_1/\itc','FontSize',fs)%纵坐标
legend([repmat('\itm\rm_2_0/\itm\rm_0=',length(m20),1),num2str(m20')])%图例
V1=sqrt(1-(M10./E1).^2);               %求A粒子的速度值
hold on                                %保持图像
plot(m10,V1,'.')                       %再画速度曲线
grid on                                %加网格
axis tight                             %贴轴

