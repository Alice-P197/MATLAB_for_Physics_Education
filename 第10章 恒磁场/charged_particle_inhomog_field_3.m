%带电粒子在非匀强磁场中运动(场强沿z方向)
clear                                  %清除变量
theta=input('请输入入射角度数:');      %键盘入射角度数
th=theta*pi/180;                       %化为弧度
tm=40;                                 %运动时间
dt=0.1;                               %时间间隔
t=0:dt:tm;                             %时间向量
%----------------------------------------------------------
s1='D2x-Dy*cos(th)*t';                 %第一个微分方程字符串
s2='D2y+Dx*cos(th)*t';                 %第二个微分方程字符串
d=dsolve(s1,s2,'x(0)=0','y(0)=0','Dx(0)=sin(th)','Dy(0)=0');%求微分方程符号解
x=subs(d.x,'th',th);                   %x变量替换角度
y=subs(d.y,'th',th);                   %y变量替换角度
x=subs(x,'t',t);                       %x变量替换时间(如果时间间隔太短则运行时间太长)
y=subs(y,'t',t);                       %y变量替换时间
z=cos(th)*t;                           %计算z坐标
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
text(0,zm,['\it\theta\rm=' num2str(theta) '\circ'],'FontSize',fs)%标注入射角
text(tm/2,zm/2,'\it\omega\rm=(\itKqv\rm_0/\itm\rm)^{1/2}','FontSize',fs)%标注角速度
text(0,zm/2,'\itR\rm=\itv\rm_0/\it\omega','FontSize',fs)%标注长度单位
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

