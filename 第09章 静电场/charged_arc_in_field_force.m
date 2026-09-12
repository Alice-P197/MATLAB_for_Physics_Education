%均匀带电圆弧在直线电荷的电场中所受的力
clear                                  %清除变量
dm=4;                                  %最大距离
d=linspace(-dm,dm,200);                %距离向量
alpha=0:60:180;                        %圆弧半张角向量
a=alpha*pi/180+eps;                    %化为弧度
n=length(a);                           %角度个数
[A,D]=meshgrid(a,d);                   %化为矩阵
F=sign(D+1)*2./A./sqrt(D.^2-1).*atan(sqrt((D-1)./(D+1)).*tan(A/2));%计算电场力
%F=sign(D-1)*2./A./sqrt(D.^2-1).*atan(sqrt((D-1)./(D+1)).*tan(A/2));%计算电场力
%F=sign(D+1)*2./A./sqrt(1-D.^2).*atanh(sqrt((1-D)./(1+D)).*tan(A/2));%计算电场力(同上)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(d,F)                              %画电场力
plot(d,F(:,1),d,F(:,2),'--',d,F(:,3),'-.',d,F(:,4),':','LineWidth',2)%画电场力
%plot(d,F(:,1),'o-',d,F(:,2),'d-',d,F(:,3),'s-',d,F(:,4),'^-')%画电场力
grid on                                %加网格
leg=[repmat('2\it\alpha\rm=',n,1),num2str(2*alpha'),repmat('\circ',n,1)];%图例字符串
legend(leg,4)                          %图例
axis([-dm,dm,-3,3])                    %曲线范围
fs=16;                                 %字体大小
xlabel('\itd/a','FontSize',fs)         %标记横坐标
ylabel('\itF/F\rm_0','FontSize',fs)    %标记纵坐标
title('均匀带电圆弧在直线电荷的电场中所受的电场力','FontSize',fs)%标题
text(-dm,0,'\itF\rm_0=2\itk\lambdaq/a','FontSize',fs)%标记力的单位
f=1./a./tan(a/2);                      %圆弧跨直线电荷的最小作用力
hold on                                %保持图像
plot(-1,f,'o')                         %画圈
pause                                  %暂停
syms x k                               %定义符号变量
y=1/(1+k*cos(x));                      %形成符号函数
% y=sym('1/(1+k*cos(x))');               %形成符号函数
f=int(y)                               %符号积分
F=subs(f,{x,k},{A,1./D})./D./A;        %替换数值
% F=subs(f,{'x','k'},{A,1./D})./D./A;    %替换数值(同上)
plot(d,F,'.')                          %重画力的曲线

