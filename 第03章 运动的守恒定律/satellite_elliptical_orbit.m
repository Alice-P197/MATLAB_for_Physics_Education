%我国第一颗人造地球卫星的椭圆轨道和周期
clear                                  %清除变量
re=6.378e6;                            %地球半径
th=(0:10000)/10000*2*pi;               %角度向量
%th=(0:1000)/1000*2*pi;                 %角度向量(较慢的电脑)
x=re*cos(th);                          %地球横坐标
y=re*sin(th);                          %地球纵坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
fill(x,y,'g')                          %画地球
grid on                                %加网格
h1=4.39e5;                             %近地高度
h2=2.384e6;                            %远地高度
% hp=2.055e5;                            %近地高度
% ha=3.58357e7;                          %远地高度
r1=re+h1;                              %近地距离
r2=re+h2;                              %远地距离
%a=(hp+ha+2*re)/2;                      %轨道半长轴
a=(r1+r2)/2;                           %轨道半长轴
c=a-r1;                                %轨道半焦距
b=sqrt(a^2-c^2);                       %轨道半短轴
axis([-r2,r1,-b,b])                    %轨道范围
axis equal                             %使轴相等
fs=16;                                 %字体大小
title('我国第一颗人造地球卫星的轨道和周期','FontSize',fs)%标题
xlabel('\itx\rm/m','FontSize',fs)      %标记坐标x符号
ylabel('\ity\rm/m','FontSize',fs)      %标记坐标y符号
v1=8.1e3;                              %近地速率
v2=v1*r1/r2;                           %求远地速率
text(r1,0,['\itv\rm_1=',num2str(v1),'m/s'],'FontSize',fs)%显示近地点速率
text(-r2,0,['\itv\rm_2=',num2str(v2),'m/s'],'FontSize',fs)%显示远地点速率
x=a*cos(th)-c;                         %椭圆横坐标
y=b*sin(th);                           %椭圆纵坐标
hold on                                %保持图像
plot([-r2,r1],[0,0])                   %画长轴
comet(x,y)                             %画慧星轨道
plot(x,y,'LineWidth',2)                %画椭圆
%用开普勒第二定律计算周期
%vp=1.02e4;                             %近地速率
s=pi*a*b;                              %求椭圆面积
c=r1*v1/2;                             %求常数
t=s/c;                                 %求周期
%t1=pi*(r1+r2)*sqrt(r2/r1)/v1;          %用最终公式求卫星周期
txt=['用开普勒第二定律求周期\itT\rm=',num2str(t),'s'];%周期文本
text(-r2,b,txt,'FontSize',fs)          %显示周期
%用开普勒第三定律计算周期
g=6.67e-11;                            %万有引力恒量
me=5.98e24;                            %地球质量
c=4*pi^2/g/me;                         %常数
t3=sqrt(c*a^3);                        %卫星周期
txt=['用开普勒第三定律求周期\itT\rm=',num2str(t3),'s'];%周期文本
text(-r2,-b,txt,'FontSize',fs)         %显示周期
return
%用开普勒第三定律和地面卫星计算周期
g=9.8;                                 %重力加速度
vI=sqrt(re*g);                         %第一宇宙速度
t0=2*pi*re/vI;                         %地面卫星的周期
tt=t0*(a/re)^(3/2);                    %卫星周期
%tt=2*pi/re/sqrt(g)*a^(3/2);            %用最终公式求卫星周期
txt=['用开普勒第三定律求周期\itT\rm=',num2str(tt),'s'];%周期文本
text(-r2,-b,txt,'FontSize',fs)         %显示周期

