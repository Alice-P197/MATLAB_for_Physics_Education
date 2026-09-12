%单摆振动的动画
clear                                  %清除变量
thetam=input('请输入单摆角振幅的度数:');%键盘输入角振幅
%thetam=60;179;                         %参考值
thm=thetam*pi/180;                     %化为弧度
T=ellipke(sin(thm/2)^2)*2/pi;          %用椭圆积分计算精确周期(以小角单摆的周期为单位)
t=linspace(0,T*2*pi);                  %一个周期的无量纲时间向量
options.RelTol=1e-6;                   %相对容差
[t,TH]=ode45('simple_pendulum_fun',t,[thm,0],options);%计算角度和角速度
th=TH(:,1);                            %取角度向量
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0;0],[0;1.05],'-.','LineWidth',2)%画竖虚线
axis equal off ij                      %坐标间隔相等,不显示坐标,纵坐标方向向下
fs=16;                                 %字体大小
title('单摆的振动','FontSize',fs)      %显示标题
hold on                                %保持图像
plot(0,0,'o')                          %画悬点
plot(exp(i*(linspace(-thm,thm)+pi/2)),'m--','LineWidth',2)%画轨迹
x=sin(thm);                            %摆球的起始横坐标
y=cos(thm);                            %摆球的起始纵坐标
plot([0,-x],[0,y],'r:','LineWidth',2)  %画连线
pole=plot([0,x],[0,y],'r','LineWidth',3);%取摆线的句柄
ball=plot(x,y,'c.','MarkerSize',50);   %取摆球的句柄
txt{1}=['\it\theta\rm_m=',num2str(thetam),'\circ'];%角振幅文本
txt{2}=['\itT/T\rm_0=',num2str(T)];    %周期文本
txt{3}='\itT\rm_0=2\pi(\itl/g\rm)^{1/2}';%周期单位文本
text(-x/2,y/2,txt,'FontSize',fs)       %显示文本
pause                                  %暂停
while  get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    for i=1:length(t)                  %按时间循环
        x=sin(th(i));                  %摆球的横坐标
        y=cos(th(i));                  %摆球的纵坐标
        set(ball,'XData',x,'YData',y)  %设置球的坐标
        set(pole,'XData',[0 x],'YData',[0 y])%设置摆杆的坐标
        drawnow                        %刷新屏幕
        pause(0.01)                    %延时
    end                                %结束循环
end                                    %结束循环

