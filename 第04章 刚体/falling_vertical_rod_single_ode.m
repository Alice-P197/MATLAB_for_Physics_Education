%竖直杆滑倒的角速度和速度等与角度和时间的关系(用一个一阶微分方程的数值解)
clear                                  %清除变量
theta=0:2:90;                          %角度向量的度数
%theta=linspace(0,90,181);              %角度向量的度数
th=theta*pi/180;                       %角度向量的弧度数
%omega=2*sqrt(3*(1-cos(th))./(1+3*sin(th).^2));%角速度
omega=2*sin(th/2).*sqrt(6./(1+3*sin(th).^2));%角速度
vc=omega.*sin(th)/2;                   %质心速度
alpha=6*sin(th).*(1+12*sin(th/2).^4)./(1+3*sin(th).^2).^2;%角加速度
ac=(alpha.*sin(th)+omega.^2.*cos(th))/2;%质心加速度
th(1)=pi/180/10;                        %初始角
%th(1)=eps;                             %更小的初始角
f=inline('sqrt((1+3*sin(th)^2)/6)/2/sin(th/2)','th','t');%角速度的倒数
[th,t]=ode45(f,th,0);                  %解微分方程
theta=th*180/pi;                       %化为度数
%----------------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,[omega;alpha;vc;ac])        %画曲线
plot(theta,omega,'o-',theta,alpha,'d-',theta,vc,'s-',theta,ac,'v-')%画曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\it\theta\rm/\circ','FontSize',fs)%加横坐标标签
title('直杆下滑的角速度和角加速度等与角度的关系','FontSize',fs)%加标题
leg1='\it\omegat\rm_0';                %第一个图例字符串
leg2='\it\alphat\rm_0^2';              %第二个图例字符串
leg3='\itv/v\rm_0';                    %第三个图例字符串
leg4='\ita/g';                         %第四个图例字符串
h=legend(leg1,leg2,leg3,leg4,0);       %加图例
set(h,'FontSize',fs)                   %放大图例
txt='\itt\rm_0=(2\itl/g\rm)^{1/2}';    %时间单位文本
text(0,0,[txt ',\itv\rm_0=(2\itgl\rm)^{1/2}'],'FontSize',fs)%显示文本

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,[omega;alpha;vc;ac;th'])        %画曲线
plot(t,omega,'o-',t,alpha,'d-',t,vc,'s-',t,ac,'^-',t,th,'.-')%画曲线
grid on                                %加网格
xlabel('\itt/t\rm_0','FontSize',fs)    %加横坐标标签
title('直杆下滑的角速度和角加速度等与时间的关系','FontSize',fs)%加标题
leg5='\it\theta\rm/rad';               %最后一个图例
h=legend(leg1,leg2,leg3,leg4,leg5,0);  %加图例
set(h,'FontSize',fs)                   %放大图例
hold on                                %保持图像
plot([0,t(end),t(end)],[th(end),th(end),0],'--')%画虚线
text(t(end),th(end),'90\circ','FontSize',fs)%标记90度

