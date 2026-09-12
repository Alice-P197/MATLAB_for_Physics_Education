%薄板所受的阻力与速率的n次方成正比的运动(求二阶微分方程数值解)
clear                                  %清除变量
tm=5;                                  %最大时间
dt=0.05;                               %时间间隔
t=0:dt:tm;                             %时间向量
n=0:0.5:3;                             %指数向量
n(n==1)=1+eps^(1/2);                   %为1的指数加小量
n(n==2)=2+eps^(1/2);                   %为2的指数也加小量
m=length(n);                           %指数个数
W=[];                                  %角速度矩阵置空
TH=[];                                 %角度矩阵置空
for i=1:m                              %按指数循环
    [tt,WTH]=ode45('thin_plate_nth_power_fun',t,[0,1],[],n(i));%求微分方程数值解
    th=WTH(:,1);                       %取角度向量
    w=WTH(:,2);                        %取角速度向量
    th(w<0|imag(w)~=0)=nan;            %角速度小于零或者是复数时角度改为非数
    w(w<0|imag(w)~=0)=nan;             %角速度小于零或者是复数时角速度改为非数
    W=[W,w];                           %连接角速度矩阵
    TH=[TH,th];                        %连接角度矩阵
end                                    %结束循环
%----------------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,W)                              %画角速度曲线族
plot(t,W(:,1),'o-',t,W(:,2),'d-',t,W(:,3),'s-',t,W(:,4),'p-',...
    t,W(:,5),'h-',t,W(:,6),'<-',t,W(:,7),'>-')%画曲线族
fs=16;                                 %字体大小
title('薄板所受阻力与速率的\itn\rm次方成正比的角速度与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('角速度\it\omega/\omega\rm_0','FontSize',fs)%显示纵坐标
grid on                                %加网格
hold on                                %保持图像
plot(t,exp(-t),'.')                    %验证n=1时的角速度
leg=[repmat('\itn\rm=',m,1),num2str(n')];%图例字符串
legend(char(leg,'\itn\rm=1的解析式'))  %图例
txt='\itt_n\rm=\itm/k_na^nb\omega\rm_0\it^n\rm^-^1';%时间文本
text(0,0.1,txt,'FontSize',fs)          %标记时间文本
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,TH)                             %画角度曲线族
plot(t,TH(:,1),'^-',t,TH(:,2),'v-',t,TH(:,3),'<-',t,TH(:,4),'>-',...
    t,TH(:,5),'s-',t,TH(:,6),'d-',t,TH(:,7),'p-')%画曲线族
title('薄板所受阻力与速率的\itn\rm次方成正比的角度与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('角度\it\theta/\omega\rm_0\itt_n','FontSize',fs)%显示纵坐标
grid on                                %加网格
hold on                                %保持图像
plot(t,4/3*log(1+3/4*t),'.')           %验证n=2时的角度
legend(char(leg,'\itn\rm=2的解析式'))  %图例

