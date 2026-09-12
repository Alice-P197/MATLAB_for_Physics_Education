%点电荷在平面电荷圆孔轴线上的运动规律
clear                                  %清除变量
A=input('请输入振幅A/a:');             %键入振幅
%A=1;10;                                %参考值
s=sym(sqrt(A^2+1));                    %符号数值表达式
syms x                                 %字义符号变量
f=sqrt(1/(s-sqrt(x^2+1)));             %被积符号函数
i=int(f,0,A);                          %符号积分
T=sqrt(2)/pi*double(i);                %求周期
% s=num2str(sqrt(A^2+1));                %数字字符串
% f=inline(['sqrt(1./(',s,'-sqrt(x.^2+1)))']);%被积的内线函数
% T=sqrt(2)/pi*quadl(f,0,A)             %周期(误差较大,甚至出现复数和无穷大)
t=linspace(0,2*T);                     %时间向量(2个约化周期)
options.RelTol=1e-6;                   %相对容差的选项
[t,ZV]=ode45('charged_particle_ring_axis_motion_fun',t,[A,0],options);%求微分方程的数值解
x=A*cos(2*pi/T*t);                     %简谐振动的位移
v=-A/T*sin(2*pi/T*t);                  %简谐振动的速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %取子图
plot(t,ZV(:,1),t,x,'.')                %画坐标曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('点电荷沿平面电荷圆孔轴线运动的位移','FontSize',fs)%显示标题
xlabel('\itt/T\rm_0','FontSize',fs)    %显示x坐标
ylabel('\itz/a','FontSize',fs)         %显示y坐标
legend('点电荷的位移','简谐振动的位移',4)%图例
text(0,A,['\itA/a\rm=',num2str(A)],'FontSize',fs)%显示振幅
text(0,0,['\itT\rm=',num2str(T),'\itT\rm_0'],'FontSize',fs)%显示周期

subplot(2,1,2)                         %取子图
plot(t,ZV(:,2)/2/pi,t,v,'.')           %画速度曲线
grid on                                %加网格
title('点电荷沿平面电荷圆孔轴线运动的速度','FontSize',fs)%显示标题
xlabel('\itt/T\rm_0','FontSize',fs)    %显示x坐标
ylabel('\itv/a\omega\rm_0','FontSize',fs)%显示y坐标
legend('点电荷的速度','简谐振动的速度',4)%图例
text(0,0,'\it\omega\rm_0=(\itq\sigma\rm/2\it\epsilon\rm_0\itam\rm)^{1/2}',...
    'FontSize',fs)                     %显示圆频率的单位
vm=sqrt(2*(sqrt(A^2+1)-1));            %最大速度
text(0,vm,['\itv\rm_m=',num2str(vm),'\ita\omega\rm_0'],...
    'FontSize',fs)%显示最大速度

