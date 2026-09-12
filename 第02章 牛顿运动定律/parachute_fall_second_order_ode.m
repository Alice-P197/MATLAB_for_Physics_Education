%降落伞下落的高度,速度和加速度(求二阶微分方程的数值解)
clear                                  %清除变量
vt=5;                                  %极限速度
g=9.8;                                 %重力加速度
t=0:0.01:2;                            %时间向量
[t1,X1]=ode45('parachute_vel_acc_fun',t,[0 0],[],g,vt);%求二阶微分方程的数值解
[t2,X2]=ode45('parachute_vel_acc_fun',t,[0 10],[],g,vt);%求二阶微分方程的数值解
x1=X1(:,1);                            %第一个高度
v1=X1(:,2);                            %第一个速度
x2=X2(:,1);                            %第二个高度
v2=X2(:,2);                            %第二个速度
a1=g*(1-(v1/vt).^2);                   %第一个加速度
a2=g*(1-(v2/vt).^2);                   %第二个加速度
%-------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选择第一个子窗口
plot(t,v1,t,v2,'r--','LineWidth',2)    %画速度曲线
fs=14;                                 %字体大小
title('降落伞下落的高度,速度和加速度','FontSize',fs)%显示标题
ylabel('速度\itv\rm/m\cdots^-^1','FontSize',fs)%标记速度
grid on                                %加网格
legend('0','10m/s')                    %加图例
subplot(3,1,2)                         %选择第二个子窗口
plot(t,x1,t,x2,'r--','LineWidth',2)    %画高度曲线
ylabel('高度\itx\rm/m','FontSize',fs)  %标记高度
grid on                                %加网格
legend('0','10m/s')                    %加图例
subplot(3,1,3)                         %选择第三个子窗口
plot(t,a1,t,a2,'r--','LineWidth',2)    %画加速度曲线
xlabel('时间\itt\rm/s','FontSize',fs)  %标记时间
ylabel('加速度\ita\rm/m\cdots^-^2','FontSize',fs)%标记加速度
grid on                                %加网格
legend('0','10m/s')                    %加图例

