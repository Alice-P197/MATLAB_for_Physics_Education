%单摆的运动规律
clear                                  %清除变量
w0t=linspace(0,4*2*pi);                %无量纲时间向量
a=1:5;                                 %角振幅向量(小角情况)
%a=[60:30:150,179];                     %角振幅向量(大角情况)
n=length(a);                           %向量个数
options.RelTol=1e-6;%相对容差的选项,角振幅越接近180度,该值要取得越小
W=[];                                  %角速度矩阵清空
THETA=[];                              %角度矩阵清空
t0=[];                                 %周期向量清空
for i=1:n                              %按角度循环
    th0=a(i)*pi/180;                   %取角度并化为弧度数
%    T=ellipke(sin(th0/2)^2)*2/pi;      %用椭圆积分计算精确周期
    [w0t,TH]=ode45('simple_pendulum_fun',w0t,[th0;0],options);%计算角度
    THETA=[THETA,TH(:,1)*180/pi];      %连接角度矩阵
    W=[W,TH(:,2)];                     %连接角速度矩阵
    t0=[t0,ellipke(sin(th0/2)^2)*2/pi];  %连接用椭圆积分计算的周期
end                                    %结束循环
t=w0t/2/pi;                            %化为以周期T0为单位的时间
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,THETA)                          %画角速度曲线
plot(t,THETA(:,1),'o-',t,THETA(:,2),'d-',t,THETA(:,3),'s-',...
    t,THETA(:,4),'^-',t,THETA(:,5),'v-')%画角度曲线族
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('时间\itt/T\rm_0','FontSize',fs)%x标签   
ylabel('角度\it\theta\rm/\circ','FontSize',fs)%y标签
title('单摆的角位移(同色点为简谐振动的标准点)','FontSize',fs)%标题
leg=[repmat('\it\theta\rm_m=',n,1),num2str(real(a'))];%角振幅图例文本
leg=[leg,repmat('\circ,\itT/T\rm_0=',n,1),num2str(real(t0'))];%连接周期
legend(leg,4)                          %加图例
text(0,a(end),'\itT\rm_0=2\pi(\itl/g\rm)^{1/2}','FontSize',fs)%小角周期文本   
%检验单摆的角位移与简谐振动角位移(余弦曲线)的吻合情况
[T,WT]=meshgrid(t0,w0t);               %周期和时间矩阵
THm=ones(size(t))*a;                   %角振幅矩阵
THh=THm.*cos(WT./T);                   %角位移
hold on                                %保持图像
plot(t,THh,'.')                        %画简谐振动点
%角速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(t,W)                               %画角速度曲线
plot(t,W(:,1),'o-',t,W(:,2),'d-',t,W(:,3),'s-',t,W(:,4),'^-',...
    t,W(:,5),'v-')                     %画角度曲线族
grid on                                %加网格
title('单摆的角速度(同色点为简谐振动的标准点)','FontSize',fs)%标题
xlabel('时间\itt/T\rm_0','FontSize',fs)%x标签   
ylabel('角速度\it\omega/\omega\rm_0','FontSize',fs)%y标签
legend(leg,4)                          %加图例
text(0,max(W(:)),'\it\omega\rm_0=2\pi/\itT\rm_0','FontSize',fs)%角速度文本
%检验单摆的角速度与简谐振动角速度(正弦曲线)的吻合情况
Wm=ones(size(w0t))*a*pi/180;           %简谐振动角速度振幅矩阵
Wh=-Wm./T.*sin(WT./T);                 %角速度
hold on                                %保持图像
plot(t,Wh,'.')                         %画简谐振动角速度点

