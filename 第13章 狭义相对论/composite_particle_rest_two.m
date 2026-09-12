%复合粒子的速度和静止质量曲线(两个粒子都在一条直线上运动)
clear                                  %清除变量
v1=-1:0.05:1;                          %第一个粒子碰撞前的速度向量
v1(1)=-1+eps;                          %-1改大一点
v1(end)=1-eps;                         %1改小一点
v2=-0.9:0.3:0.9;                       %第二个粒子碰撞前的速度向量
[V1,V2]=meshgrid(v1,v2);               %速度矩阵
P=V1./sqrt(1-V1.^2)+V2./sqrt(1-V2.^2); %总动量
M=1./sqrt(1-V1.^2)+1./sqrt(1-V2.^2);   %总质量
V=P./M;                                %碰撞后的速度
M0=M.*sqrt(1-V.^2);                    %碰撞后的静止质量
%M0=sqrt((sqrt((1+V1)./(1-V1))+sqrt((1+V2)./(1-V2))).*...
%    (sqrt((1-V1)./(1+V1))+sqrt((1-V2)./(1+V2))));%同上
%M0=sqrt(2+sqrt((1+V1)./(1-V1).*(1-V2)./(1+V2))+...
%    sqrt((1-V1)./(1+V1).*(1+V2)./(1-V2)));%同上
f1=figure;                             %创建图形窗口
%plot(v1,V)                             %画曲线族
plot(v1,V(1,:),'o-',v1,V(2,:),'d-',v1,V(3,:),'s-',v1,V(4,:),'h-',...
    v1,V(5,:),'p-',v1,V(6,:),'<-',v1,V(7,:),'>-')%画曲线族
fs=16;                                 %字体大小
title('静止质量相同的粒子完全非弹性碰撞的速度','FontSize',fs)%显示标题
xlabel('碰撞前的速度\itv\rm_1/\itc','FontSize',fs)%显示横坐标
ylabel('碰撞后的速度\itV/c','FontSize',fs)%显示纵坐标
legend([repmat('\itv\rm_2/\itc\rm=',length(v2),1),num2str(v2')],2)%图例
hold on                                %保持图像
plot(v1,v1,'--','LineWidth',2)         %画等速线(粘合速度)
stem(v2,v2,'--x','MarkerSize',12)      %画粘合速度杆图
grid on                                %加网格
f2=figure;                             %创建图形窗口
%plot(v1,M0)                            %画曲线族
plot(v1,M0(1,:),'o-',v1,M0(2,:),'d-',v1,M0(3,:),'s-',v1,M0(4,:),'h-',...
    v1,M0(5,:),'p-',v1,M0(6,:),'<-',v1,M0(7,:),'>-')%画曲线族
grid on                                %加网格
axis([-1,1,2,5])                       %曲线范围
title('静止质量相同的粒子完全非弹性碰撞的静止质量','FontSize',fs)%显示标题
xlabel('碰撞前的速度\itv\rm_1/\itc','FontSize',fs)%显示横坐标
ylabel('碰撞后的静止质量\itM\rm_0/\itm\rm_0','FontSize',fs)%显示纵坐标
legend([repmat('\itv\rm_2/\itc\rm=',length(v2),1),num2str(v2')],0)%图例
hold on                                %保持图像
stem(v2,2./sqrt(1-v2.^2),'--x','MarkerSize',12)%画对碰质量杆图

s1='m0*v1/sqrt(1-v1^2)+m0*v2/sqrt(1-v2^2)-M0*V/sqrt(1-V^2)';%动量守恒方程
s2='m0/sqrt(1-v1^2)+m0/sqrt(1-v2^2)-M0/sqrt(1-V^2)';%质量守恒方程
s=solve(s1,s2,'M0','V');               %求方程组的符号解
V=subs(s.V,'m0',1);                    %质量替换数值1
V=subs(V,{'v1','v2'},{V1,V2});         %速度符号替换数值
figure(f1)                             %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v1,V,'.')                         %重画曲线族
M0=subs(s.M0,'m0',1);                  %质量替换数值1
M0=subs(M0,{'v1','v2'},{V1,V2});       %速度符号替换数值
figure(f2)                             %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(v1,M0,'.')                        %重画曲线族

