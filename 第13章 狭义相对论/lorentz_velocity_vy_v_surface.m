%洛伦兹速度vy和v变换曲面
clear                                  %清除变量
theta=input('请输入质点速度与参考系速度之间的角度数:');%键盘输入角度数
%theta=0;60;                            %参考值
th=theta*pi/180;                       %化为弧度
u=-1:0.1:1;                            %参考系S'相对S的速度向量u/c
v=-1:0.1:1;                            %质点在S系中的速度v/c
v(1)=-1+eps;                           %第一个速度接近反方向光速
v(end)=1-eps;                          %最后一个速度接近正方向光速
[V,U]=meshgrid(v,u);                   %速度向量化为矩阵
VVy=V*sin(th).*sqrt(1-U.^2)./(1-V.*U*cos(th));%S'系中的速度v'y/c
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(v,u,VVy)                          %画速度y分量曲面
box on                                 %加框架
fs=16;                                 %字体大小
title('洛伦兹速度变换的\ity\rm分量曲面','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itu/c','FontSize',fs)         %纵坐标
zlabel('\itv\prime_y/c','FontSize',fs) %高坐标
txt=['\it\theta\rm=',num2str(theta),'\circ'];%角度文本
text(-1,1,1,txt,'FontSize',fs)         %显示角度

VV=sqrt(1-(1-V.^2).*(1-U.^2)./(1-V.*U*cos(th)).^2);%S'系中的速度v'/c
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(v,u,VV)                           %画曲面
box on                                 %加框架
title('洛伦兹速度变换的速度曲面','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itu/c','FontSize',fs)         %纵坐标
zlabel('\itv\prime/c','FontSize',fs)   %高坐标
text(-1,0,0,txt,'FontSize',fs)         %显示角度

TTH=atan2(V*sin(th).*sqrt(1-U.^2),V*cos(th)-U);
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(v,u,TTH*180/pi)                   %画速度y分量方向曲面
box on                                 %加框架
title('洛伦兹速度变换速度方向曲面','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itu/c','FontSize',fs)         %纵坐标
zlabel('\it\theta\rm\prime/\circ','FontSize',fs)%高坐标
text(-1,1,0,txt,'FontSize',fs)         %显示角度

