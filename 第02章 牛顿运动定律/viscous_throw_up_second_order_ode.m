%小球受到与速率成正比的摩擦阻力的上抛运动(用两阶微分方程的数值解)
clear                                  %清除变量
t=0:0.02:2.5;                          %时间向量(t0的倍数或无量纲时间)
v0=1:7;                                %初速度向量
n=length(v0);                          %初速度个数
H=[];                                  %高度矩阵置空
V=[];                                  %速度矩阵置空
for i=1:n                              %按初速度循环
    [tt,HV]=ode45('sphere_reduced_vel_acc_fun',t,[0,v0(i)]);%求高度和速度的数值解
    V=[V,HV(:,2)];                     %连接速度
    H=[H,HV(:,1)];                     %连接高度
end                                    %结束循环
%----------------------------------------------------------
H(V<0)=nan;                            %速度小于零的高度改为非数
V(V<0)=nan;                            %速度小于零的速度改为非数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,V,'LineWidth',2)                %画速度曲线族
plot(t,V(:,1),'o-',t,V(:,2),'d-',t,V(:,3),'s-',t,V(:,4),'p-',...
    t,V(:,5),'h-',t,V(:,6),'^-',t,V(:,7),'v-')%画速度曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('小球上抛的速度与时间的关系(阻力与速率成正比)','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标标签
ylabel('速度\itv/V\rm_0','FontSize',fs)%显示纵坐标
legend([repmat('\itkv\rm_0/\itmg\rm=',n,1) num2str(v0')])%图例
text(0,1,'\it\tau\rm=\itm/k\rm,\itV\rm_0=\itmg/k','FontSize',fs)%时间和速度单位文本

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,H,'LineWidth',2)                %画高度曲线族
plot(t,H(:,1),'o-',t,H(:,2),'d-',t,H(:,3),'s-',t,H(:,4),'p-',...
    t,H(:,5),'h-',t,H(:,6),'^-',t,H(:,7),'v-')%画高度曲线族
title('小球上抛的高度与时间的关系(阻力与速率成正比)','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标标签
ylabel('高度\ith/h\rm_0','FontSize',fs)%显示纵坐标
grid on                                %加网格
legend([repmat('\itkv\rm_0/\itmg\rm=',n,1) num2str(v0')],4)%图例
text(0,3,'\ith\rm_0=\itm\rm^2\itg/k\rm^2','FontSize',fs)%标记高度单位
[hm,im]=max(H);                        %求最大高度及其下标
hold on                                %保持图像
stem(t(im),hm,'--')                    %画最高点的杆图
txt=[num2str(t(im)',3),repmat(',',n,1),num2str(hm',3)];%运动时间和高度字符串
text(t(im),hm,txt,'FontSize',fs)       %标记时间和最大高度
vm=1:0.1:7;                            %较密的初速度向量
tm=log(1+vm);                          %最大时间
hm=vm-log(1+vm);                       %最大高度
hold on                                %保持图像
plot(tm,hm,'--','LineWidth',2)         %画峰值线

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(H,V,'LineWidth',2)                %画速度和高度曲线族
plot(H(:,1),V(:,1),'o-',H(:,2),V(:,2),'d-',H(:,3),V(:,3),'s-',...
    H(:,4),V(:,4),'p-',H(:,5),V(:,5),'h-',H(:,6),V(:,6),'^-',...
    H(:,7),V(:,7),'v-')                %画速度和高度曲线族
title('小球上抛的速度与高度的关系(阻力与速率成正比)','FontSize',fs)%显示标题
xlabel('高度\ith/h\rm_0','FontSize',fs)%显示横坐标
ylabel('速度\itv/V\rm_0','FontSize',fs)%显示纵坐标
grid on                                %加网格
legend([repmat('\itkv\rm_0/\itmg\rm=',n,1) num2str(v0')])%图例

