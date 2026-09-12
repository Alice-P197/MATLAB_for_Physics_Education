%带电粒子在非匀强磁场中运动
clear                                  %清除变量
theta=input('请输入入射角度数:');      %键盘输入入射角度数
%theta=60;                              %参考值
th=theta*pi/180;                       %化为弧度
tm=40;                                 %运动时间
dt=0.01;                               %时间间隔
t=0:dt:tm;                             %时间向量wt
%----------------------------------------------------------
u=t*sqrt(cos(th)/2);                   %积分变量
fsin=inline('sin(x.^2)');              %菲涅耳正弦积分内线函数
fcos=inline('cos(x.^2)');              %菲涅耳余弦积分内线函数
x=sin(th)*cumsum(fcos(u))*dt;          %求x坐标
y=-sin(th)*cumsum(fsin(u))*dt;         %求y坐标
z=cos(th)*t;                           %求z坐标
%z=w*sqrt(2*cos(th));                   %求z坐标(同上)
%----------------------------------------------------------
r={x,y,z};                             %化为元胞
fs=16;                                 %字体大小
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:3                              %按子图循环
    subplot(3,1,i)                     %选子图
    plot(t,r{i},'LineWidth',2)         %画运动规律曲线
    grid on                            %加网格
    if i==1 title('带电粒子在非匀强磁场中运动规律','FontSize',fs),end%标题
    xlabel('\it\omegat','FontSize',fs) %标注x轴符号
    ylabel(['\it',char(double('x')+i-1),'/R'],'FontSize',fs)%标注y轴符号
end                                    %结束循环
zm=max(z);                             %求最大高坐标
text(0,zm,['\it\theta\rm=',num2str(theta),'\circ'],'FontSize',fs)%标注入射角
text(tm/2,zm/2,'\it\omega\rm=(\itKqv\rm_0/\itm\rm)^{1/2}','FontSize',fs)%标注角速度
text(0,zm/2,'\itR\rm=\itv\rm_0/\it\omega','FontSize',fs)%标注长度单位
axis tight                             %贴轴
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
comet3(x,y,z)                          %画彗星式轨迹
plot3(x,y,z)                           %重画轨迹
title('带电粒子在非匀强磁场中运动轨迹','FontSize',fs)%标题
xlabel('\itx/R','FontSize',fs)         %标注x轴符号
ylabel('\ity/R','FontSize',fs)         %标注y轴符号
zlabel('\itz/R','FontSize',fs)         %标注z轴符号
grid on                                %加网格
box on                                 %加框
xm=sin(th)/2*sqrt(pi/cos(th));         %极限坐标
hold on                                %保持图像
plot3([1,1]*xm,[-1,-1]*xm,[0,zm*1.1],'r--','LineWidth',3)%画轴
txt=[num2str(xm),',',num2str(-xm),',0'];%极限坐标
text(xm,-xm,0,txt,'FontSize',fs)        %标注极限坐标

