%物体在平衡点从静止开始的受迫振动曲线(用解析式)
clear                                  %清除变量
b=input('请输入约化阻尼因子(0~1):');   %键盘输入约化阻尼因子
%b=0.1;                                 %参考值
if b<=0|b>=1 return,end                %不符合条件则不向下执行程序
w=sqrt(1-b^2);                         %约化阻尼圆频率
s=['请输入约化驱动力圆频率(约化阻尼圆频率为',num2str(w),'):'];%提示字符串
W=input(s);                            %键盘输入约化驱动力圆频率
%W=2;6;1;0.6;                           %参考值
if W==1 W=1-eps;end                    %如果为1则改小一点
tm=30;                                 %最大时间
t=0:0.001:tm;                          %时间向量
a1=sqrt(w^2*(W^2-1)^2+b^2*(W^2+1)^2)/w/((W^2-1)^2+4*b^2*W^2);%阻尼振幅
phi=atan2(b*(W^2+1),w*(W^2-1));        %阻尼振动初相
a2=1/sqrt((W^2-1)^2+4*b^2*W^2);        %等幅振动振幅
PHI=atan2(-2*b*W,1-W^2);               %等幅振动初相
x1=a1*exp(-b*t).*cos(w*t+phi);         %阻尼振动函数
x2=a2*cos(W*t+PHI);                    %等幅振动函数
x=x1+x2;                               %合成振动
xm=max(abs(x));                        %最大值
%-----------------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选子图
plot(t,x1,'LineWidth',2)               %画曲线
grid on                                %加网格
axis([0,tm,-xm,xm])                    %设置曲线范围
fs=12;                                 %字体大小
title('减幅振动的位移时间曲线','FontSize',fs)%标题
ylabel('\itx\rm_1/\itA\rm_0','FontSize',fs)%标记纵坐标
txt=['\it\beta/\omega\rm_0=',num2str(b)];%阻尼因子字符串
txt=[txt,',\it\omega/\omega\rm_0=',num2str(w)];%连接阻尼圆频率
text(0,xm,txt,'FontSize',fs)           %标记阻尼因子和阻尼圆频率
subplot(3,1,2)                         %选子图
plot(t,x2,'LineWidth',2)               %画曲线
grid on                                %加网格
axis([0,tm,-xm,xm])                    %设置曲线范围
title('等幅振动的位移时间曲线','FontSize',fs)%标题
ylabel('\itx\rm_2/\itA\rm_0','FontSize',fs)%标记纵坐标
txt=['\it\Omega/\omega\rm_0=',num2str(W)];%驱动力圆频率字符串
text(0,xm,txt,'FontSize',fs)           %标记驱动力圆频率
subplot(3,1,3)                         %选子图
plot(t,x,'LineWidth',2)                %画曲线
grid on                                %加网格
axis([0,tm,-xm,xm])                    %设置曲线范围
txt='\itA\rm_0=\itF\rm_0/\itm\omega\rm_0^2';%振幅文本
text(0,xm,txt,'FontSize',fs)           %标记振幅文本
title('受迫振动的位移时间曲线','FontSize',fs)%标题
xlabel('\it\omega\rm_0\itt','FontSize',fs)%标记横坐标
ylabel('\itx/A\rm_0','FontSize',fs)    %标记纵坐标

