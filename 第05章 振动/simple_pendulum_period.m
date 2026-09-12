%单摆的周期(用内线函数数值积分和符号积分以及级数与椭圆积分比较)
clear                                  %清除变量
theta=0:179;                           %角振幅向量的度数
thm=theta*pi/180;                      %角度化为弧度数
T0=ellipke(sin(thm/2).^2)*2/pi;        %用椭圆积分计算单摆精确周期
T1=1;                                  %小角振动周期
T2=1;                                  %小角振动周期
j=1:5:length(thm);                     %下标向量(每隔5度取一个角度)
for i=j(2:end)                         %按下标循环
    s=['1./sqrt(cos(x)-cos(',num2str(thm(i)),'))'];%被积函数字符串
    T1=[T1,quadl(inline(s),0,thm(i))*sqrt(2)/pi;];%连接数值积分的周期
    T2=[T2,double(int(s,0,thm(i)))*sqrt(2)/pi];%连接用符号积分的周期
end                                    %结束循环
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(theta,T0,theta(j),T1,'.',theta(j),T2,'o')%画周期曲线
fs=16;                                 %字体大小
title('单摆的周期与角振幅的关系','FontSize',fs)%标题
xlabel('\it\theta\rm_m/\circ','FontSize',fs)%x标签
ylabel('\itT/T\rm_0','FontSize',fs)    %y标签
grid on                                %加网格
legend('第一类完全椭圆积分','数值积分','符号积分',2)%图例
text(0,2,'\itT\rm_0=2\pi(\itl/g\rm)^{1/2}','FontSize',fs)%标记小角单摆周期

e=1e-6;                                %容差
nm=0;                                  %最小周期的正弦项数为零
T3=1;                                  %最小周期
for i=j(2:end)                         %按下标循环
    t=1;                               %n=0项之值
    for n=1:150                        %按项数循环
        tn=(prod(1:2:2*n-1)*sin(thm(i)/2)^n/2^n/factorial(n))^2;%求各项之值
        t=t+tn;                        %累加各项之值
        if abs(t-T0(i))<e,break,end %与精确值相差很小时退出循环
    end                                %结束循环
    T3=[T3,t];                         %连接周期
    nm=[nm,n];                         %连接项数
end                                    %结束循环
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(theta,T0,theta(j),T3,'r.')        %画周期曲线
title('用级数计算单摆的周期与角振幅的关系','FontSize',fs)%标题
xlabel('\it\theta\rm_m/\circ','FontSize',fs)%x标签
ylabel('\itT/T\rm_0','FontSize',fs)    %y标签
grid on                                %加网格
legend('第一类完全椭圆积分','级数求和',2)%图例
text(theta(j),T3,num2str(nm'),'HorizontalAlignment','center')%显示项数
text(0,2,['容差:',num2str(e)],'FontSize',fs)%显示误差

