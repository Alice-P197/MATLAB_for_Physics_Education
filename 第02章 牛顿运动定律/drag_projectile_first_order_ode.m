%阻力与速度成正比的平抛运动的轨迹(用两个一阶常微分方程的数值解)
clear                                  %清除变量
v0=input('请输入水平初速度kv0/mg:');   %键盘输入水平初速度
%v0=1;                                  参考值
t=0:0.01:4;                            %时间向量
%------------------------------------------------------------
[t0,V]=ode45('drag_projectile_acceleration_fun',t,[v0,0]);   %求微分方程的数值解
x=cumtrapz(V(:,1))*t(2);               %横坐标
y=cumtrapz(V(:,2))*t(2);               %纵坐标
%------------------------------------------------------------
xx=v0*t;                               %无阻力的横坐标
yy=t.^2/2;                             %无阻力的横坐标
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(t,x,t,xx,'--','LineWidth',2)      %画坐标曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itt/\tau','FontSize',fs)      %标记横坐标标签
ylabel('\itx/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的横坐标','FontSize',fs)%标题
legend('有阻力','无阻力',2)            %图例
txt='\it\tau\rm=\itm/k\rm,\its\rm_0=\itm\rm^2\itg/k\rm^2';%单位文本
text(0,max(x),txt,'FontSize',fs)       %说明单位
subplot(2,1,2)                         %选子图
plot(t,y,t,yy,'--','LineWidth',2)      %画坐标曲线
grid on                                %加网格
xlabel('\itt/\tau','FontSize',fs)      %标记横坐标标签
ylabel('\ity/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的纵坐标','FontSize',fs)%标题
legend('有阻力','无阻力',2)            %图例
text(0,max(y),['\itkv\rm_0/\itmg\rm=',num2str(v0)],'FontSize',fs)%约化初速度

figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(x,y,xx,yy,'--','LineWidth',2)     %画轨迹
grid on                                %加网格
xlabel('\itx/s\rm_0','FontSize',fs)    %标记横坐标
ylabel('\ity/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的轨迹','FontSize',fs)%标题
legend('有阻力','无阻力')              %图例
text(0,max(y),['\itkv\rm_0/\itmg\rm=',num2str(v0)],'FontSize',fs)%约化初速度
hold on                                %保持图像
plot([v0,v0],[0,max(yy)],'--r')        %画极限线
axis ij equal                          %原点设在左上角并使坐标间隔相等
return

xx=t;                                  %无阻力的横坐标
yy=t.^2/2;                             %无阻力的横坐标
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(t,x,t,xx,'--')                    %画坐标曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itt/t\rm_0','FontSize',fs)    %标记横坐标
ylabel('\itx/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的横坐标','FontSize',fs)%标题
legend('有阻力','无阻力')              %图例
txt='\itt\rm_0=\itv\rm_0\it/g\rm,\its\rm_0=\itv\rm_0^2/\itg';%单位文本
text(0,max(x),txt,'FontSize',fs)       %说明单位
subplot(2,1,2)                         %选子图
plot(t,y,t,yy,'--')                    %画坐标曲线
grid on                                %加网格
xlabel('\itt/t\rm_0','FontSize',fs)    %标记横坐标
ylabel('\ity/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的纵坐标','FontSize',fs)%标题
legend('有阻力','无阻力')              %图例
text(0,max(y),['\itkv\rm_0/\itmg\rm=',num2str(k)],'FontSize',fs)%约化阻力系数

figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(x,y,xx,yy,'--')                   %画轨迹
grid on                                %加网格
xlabel('\itx/s\rm_0','FontSize',fs)    %标记横坐标
ylabel('\ity/s\rm_0','FontSize',fs)    %标记纵坐标
title('阻力与速度成正比的平抛运动的轨迹','FontSize',fs)%标题
legend('有阻力','无阻力')              %图例
text(0,max(y),['\itkv\rm_0/\itmg\rm=',num2str(k)],'FontSize',fs)%约化阻力系数
axis ij equal                          %原点设在左上角并使坐标间隔相等

