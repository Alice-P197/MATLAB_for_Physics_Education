%圆环滚动的动画
clear                                  %清除变量
w0=input('请输入初始转动线速度与质心初速度的比值w0R/v0:');%键盘输入比值
%w0=1;                                  %参考值
%w0=1.5;                                %参考值
%w0=0.5;                                %参考值
tit0='圆环做有滑转动之后';             %标题一部分
tit1='(\itR\omega\rm_0';               %标题一部分
tit2='\itv\rm_0)';                     %标题一部分
if w0==1                                %如果质心初速度与滑动初速度相等
    tit=[tit0,'停止运动',tit1,'=',tit2];%用此标题
elseif w0<1                            %如果质心初速度大于滑动初速度
    tit=[tit0,'向前做无滑滚动',tit1,'<',tit2];%用此标题
else                                   %否则
    tit=[tit0,'向后做无滑滚动',tit1,'>',tit2];%用此标题
end                                    %结束条件
k=50;                                  %无量纲的滚动因子
tm=(1+w0)/2;                           %有滑动的最后时刻
t=linspace(0,tm,150);                  %有滑动的时间向量
vc=1-t;                                %质心速度
w=w0-t;                                %圆环角速度
xc=k*(t-t.^2/2);                       %质心有滑动时平动的距离
xc=[xc,xc(end)+k*vc(end)*t];           %连接无滑滚动的位移
th=k*(w0*t-t.^2/2);                    %圆环有滑动时转动的角度
th=[th,th(end)+k*w(end)*t];            %连接无滑滚动的角度
x=xc+sin(th);                          %动点横坐标
y=1-cos(th);                           %动点纵坐标 
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %取子图
plot([-1+min(xc),1+max(xc)],[0,0],'k','LineWidth',2)%画地面
axis equal                             %纵横坐标间隔相等
fs=16;                                 %字体大小
title(tit,'FontSize',fs)               %显示标题
xlabel('\itx/R','FontSize',fs)         %显示横坐标
ylabel('\ity/R','FontSize',fs)         %显示纵坐标
phi=linspace(0,2*pi);                  %圆的角度向量
xr=cos(phi);                           %圆的横坐标
yr=sin(phi);                           %圆的纵坐标
hold on                                %保持图像
ring=plot(xr,1+yr,'m','LineWidth',2);  %环的句柄
pole=plot([0,0],[1,0],'r-','LineWidth',2);%半径(杆)的句柄
plot(xr,1+yr,'m--','LineWidth',2)      %画环
plot([0,0],[1,0],'r--','LineWidth',2)  %画半径(杆)
txt=['\itR\omega\rm_0/\itv\rm_0=',num2str(w0)];%速度比文本
txt=[txt,',\itv\rm_0^2/\it\mugR\rm=',num2str(k)];%无量纲滚动因子文本
text(0,-1,txt,'FontSize',fs)           %标记文本
pause                                  %暂停
for i=1:2*length(t)-1                  %按下标循环
    set(ring,'XData',xc(i)+xr,'YData',1+yr)%设置环的坐标
    set(pole,'XData',[xc(i),x(i)],'YData',[1,y(i)])%设置半径(杆)的坐标
    plot([x(i),x(i+1)],[y(i),y(i+1)],'LineWidth',2)%画动点的轨迹
    drawnow                            %刷新屏幕
end                                    %结束循环
o=ones(size(t));                       %全1向量
tt=[t,t(end)+t];                       %全部时间向量
subplot(2,1,2)                         %取子图
plot(tt,[vc,o*vc(end)],tt,[w,o*w(end)],'--','LineWidth',2)%画质心速度和角速度
grid on                                %加网格
xlabel('\itt/t\rm_0','FontSize',fs)    %横坐标
title('圆环的质心速度和角速度','FontSize',fs)%加标题
legend('\itv\rm_C/\itv\rm_0','\it\omega/\Omega\rm_0')%加图例
txt='\itt\rm_0=\itv\rm_0/\it\mug';     %时间单位文本
text(1,0,[txt,',\it\Omega\rm_0=\itv\rm_0/\itR'],'FontSize',fs)%显示文本

