%中子与原子核作完全弹性碰撞的速度和损失的动能
clear                                  %清除变量
m=0.1:0.2:0.9;                         %中子与原子核的质量比m/M向量
n=length(m);                           %质量比的个数
theta=0:5:180;                         %散射角度向量
th=theta*pi/180;                       %化为弧度
[M,TH]=meshgrid(m,th);                 %质量比和角度矩阵
V=(M.*cos(TH)+sqrt(1-M.^2.*sin(TH).^2))./(1+M);%散射后的速度
%V=M./(1+M).*(cos(TH)+sqrt(1./M.^2-sin(TH).^2));%散射后的速度(同上)
s1='m*v0^2-m*v^2-M*V^2';               %第1个方程
s2='m*v0-m*v*cos(th)-M*V*cos(phi)';    %第2个方程
s3='m*v*sin(th)-M*V*sin(phi)';         %第3个方程
s=solve(s1,s2,s3,'v','V','phi')        %求方程组的符号解
v=s.v                                  %取出中子速度
vv=simple(v)                           %化简
simple(vv)                             %再化简
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,V)                          %画速度曲线
plot(theta,V(:,1),'o-',theta,V(:,2),'s-',theta,V(:,3),'d-',...
    theta,V(:,4),'p-',theta,V(:,5),'h-')%画曲线族
fs=16;                                 %字体大小
xlabel('\it\theta\rm/\circ','FontSize',fs)%角度标签
ylabel('\itv/v\rm_0','FontSize',fs)    %速度标签
title('中子与原子核作完全弹性碰撞的速度','FontSize',fs)%标题
grid on                                %加网格
axis tight                             %使图形窗口紧帖曲线
legend([repmat('\itm/M\rm=',n,1),num2str(m')],3)%质量比图例
txt='\itv\rm_0=(2\itE\rm_0/\itm\rm)^{1/2}';%速度单位文本
text(0,0.6,txt,'FontSize',fs)          %标记文本
hold on                                %保持图像
plot(180,(1-m)./(1+m),'*')             %画速度的极小值
DE=1-V.^2;                             %损失的动能
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,1-V.^2)                     %画能量曲线
plot(theta,DE(:,1),'o-',theta,DE(:,2),'d-',theta,DE(:,3),'s-',...
    theta,DE(:,4),'p-',theta,DE(:,5),'h-')%画曲线族
xlabel('\it\theta\rm/\circ','FontSize',fs)%角度标签
ylabel('\Delta\itT/E\rm_0','FontSize',fs)%动能标签
title('中子与原子核作完全弹性碰撞损失的动能','FontSize',fs)%标题
grid on                                %加网格
axis tight                             %使图形窗口紧帖曲线
legend([repmat('\itm/M\rm=',n,1),num2str(m')],2)%质量比图例
hold on                                %保持图像
plot(180,4*m./(1+m).^2,'*')            %画损失动能的极大值

