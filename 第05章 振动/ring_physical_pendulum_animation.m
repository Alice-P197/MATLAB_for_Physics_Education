%圆环复摆振动的动画
clear                                  %清除变量
thetam=input('请输入圆环复摆角振幅的度数:');%键盘输入角振幅
%thetam=60;120;                         %参考值
thm=thetam*pi/180;                     %化为弧度
T=ellipke(sin(thm/2)^2)*2/pi*sqrt(2);  %用椭圆积分计算精确周期(以小角单摆的周期为单位)
t=linspace(0,T*2*pi);                  %无量纲时间向量
options.RelTol=1e-6;                   %相对容差
[t,TH]=ode45('ring_physical_pendulum_fun',t,[thm,0],options);%计算角度和角速度
th=TH(:,1);                            %取角度向量
w=TH(:,2);                             %取角速度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
set(gcf,'Units','Normalized','Position',[0.1,0.1,0.4,0.4])%设置图形窗口在左下角
subplot(2,1,1)                         %选子图
plot(t/2/pi,th*180/pi,t/2/pi,thetam*cos(t/T),'.')%画角度曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('圆环复摆的角位移与简谐振动的比较','FontSize',fs)%标题
xlabel('时间\itt/T\rm_0','FontSize',fs)%x标签   
ylabel('角度\it\theta\rm/\circ','FontSize',fs)%y标签
legend('复摆的角位移','简谐振动位移',4) %角度图例
text(0,thetam,['\it\theta\rm_m=',num2str(thetam),'\circ'],'FontSize',fs)%显示角度文本
text(0,0,['\itT/T\rm_0=',num2str(T)],'FontSize',fs)%显示周期文本
text(0,-thetam,'\itT\rm_0=2\pi(\itR/g\rm)^{1/2}','FontSize',fs)%显示周期单位
subplot(2,1,2)                         %选子图
plot(t/2/pi,w,t/2/pi,-thm/T*sin(t/T),'.')%画角速度曲线
grid on                                %加网格
title('圆环复摆的角速度与简谐振动的比较','FontSize',fs)%标题
xlabel('时间\itt/T\rm_0','FontSize',fs)%x标签   
ylabel('角速度\it\omega/\omega\rm_0','FontSize',fs)%y标签
legend('复摆的角速度','简谐振动速度',4) %角速度图例
text(0,0,'\it\omega\rm_0=(\itg/R\rm)^{1/2}','FontSize',fs)%显示角速度单位
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
set(gcf,'Units','Normalized','Position',[0.5,0.5,0.4,0.4])%设置图形窗口在右上角
plot([0;0],[0;-2.05],'-.','LineWidth',2)%画竖虚线
title('圆环复摆的振动','FontSize',fs)  %显示标题
hold on                                %保持图像
plot(exp(i*(linspace(-thm,thm)-pi/2)),'m--','LineWidth',2)%画质心轨迹
x=sin(thm);                            %质心的起始横坐标
y=cos(thm);                            %质心的起始纵坐标
plot([0,-x],[0,-y],'r:','LineWidth',2) %画连线
a=linspace(0,2*pi);                    %圆环角度向量
ring=plot(x+cos(a),-y+sin(a),'r','LineWidth',3);%取圆环的句柄
pole=plot([0,x],[0,-y],'-k.','LineWidth',2);%取连心线的句柄
text(0,0,['\it\theta\rm_m=',num2str(thetam),'\circ'],'FontSize',fs)%显示角度文本
axis equal off                         %不显示坐标
axis([-2,2,-2.1,1-y])                  %坐标范围
pause                                  %暂停
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则中断循环
    for i=1:length(t)                  %按时间循环
        x=sin(th(i));                  %质心的横坐标
        y=cos(th(i));                  %质心的纵坐标
        set(ring,'XData',x+cos(a),'YData',-y+sin(a))%设置圆环的坐标
        set(pole,'XData',[0,x],'YData',[0,-y])%设置连心线的坐标
        drawnow                        %刷新屏幕
        pause(0.01)                    %延时
    end                                %结束循环
end                                    %结束循环

