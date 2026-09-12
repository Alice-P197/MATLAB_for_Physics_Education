%复合粒子的速度和静止质量(一个粒子静止)
clear                                  %清除变量
v=0:0.01:1;                            %碰撞前的速度向量
v(end)=1-eps;                          %1改小一点
V=v./(1+sqrt(1-v.^2));                 %碰撞后的速度
M0=sqrt(2*(1+1./sqrt(1-v.^2)));        %碰撞后的静止质量
%M0=v.*sqrt(1-u.^2)./u./sqrt(1-v.^2);    %用方程求碰撞后的质量(同上)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(v,V,'LineWidth',2)                %画速度曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('静止质量相同的粒子完全非弹性碰撞的速度','FontSize',fs)%显示标题
xlabel('\itv/c','FontSize',fs)         %显示横坐标
ylabel('\itV/c','FontSize',fs)         %显示纵坐标
text(0,0.5,'一个粒子碰撞前静止','FontSize',fs)%显示说明文本
subplot(2,1,2)                         %选子图
plot(v,M0,'LineWidth',2)               %画质量曲线
axis([0,1,2,4])                        %坐标范围
title('静止质量相同的粒子完全非弹性碰撞的静止质量','FontSize',fs)%显示标题
xlabel('\itv/c','FontSize',fs)         %显示横坐标
ylabel('\itM\rm_0/\itm\rm_0','FontSize',fs)%显示纵坐标
grid on                                %加网格
text(0,3,'一个粒子碰撞前静止','FontSize',fs)%显示说明文本

Tm=1./sqrt(1-v.^2)-1;                  %碰撞前的动能
TM=(1./sqrt(1-V.^2)-1).*M0;            %碰撞后的动能
dT=Tm-TM;                              %损失的动能
dM0=M0-2;                              %增加的静止能量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v,Tm,'-*',v,TM,'-o')              %画动能曲线
hold on                                %保持图像
plot(v,dT,'--',v,dM0,'.')              %画损失的动能和增加的静止能量曲线
grid on                                %加网格
axis([0,1,0,4])                        %曲线范围
title('静止质量相同的粒子完全非弹性碰撞的能量变化','FontSize',fs)%显示标题
xlabel('\itv/c','FontSize',fs)         %显示横坐标
leg{1}='碰撞前的动能\itT_m/E\rm_0';    %图例元胞
leg{2}='碰撞后的动能\itT_M/E\rm_0';
leg{3}='损失的动能\Delta\itT/E\rm_0';
leg{4}='增加的静止能量\Delta\itE\rm_0\it/E\rm_0';
legend(leg,2)                          %图例
%legend('碰撞前的动能','碰撞后的动能','损失的动能','增加的静止能量',2)%图例
text(0,2,'\itE\rm_0=\itm\rm_0\itc\rm^2','FontSize',fs)%显示说明文本

