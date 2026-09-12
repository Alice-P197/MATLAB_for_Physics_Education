%两个同方向同频率的简谐振动的合成
clear                                  %清除变量
a1=input('请输入第一个振动的振幅:');   %第一个振动的振幅
%a1=0.03;                               %参考值
phi1=input('请输入第一个振动的初相的度数:');%第一个振动的初相
%phi1=0;                                %参考值
phi1=phi1*pi/180;                      %化为弧度
a2=input('请输入第二个振动的振幅:');   %第二个振动的振幅
%a2=0.04;                               %参考值
phi2=input('请输入第二个振动的初相的度数:');%第二个振动的初相
%phi1=0;90;                             %参考值
phi2=phi2*pi/180;                      %化为弧度
wt=linspace(0,4*pi);                   %角度向量
x1=a1*cos(wt+phi1);                    %第一个振动
x2=a2*cos(wt+phi2);                    %第二个振动
x=x1+x2;                               %合振动
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(wt,x1,'-.',wt,x2,'--',wt,x,'LineWidth',2)%画振动曲线
set(gca,'XTick',(0:8)*pi/2)            %设置横坐标刻度
grid on                                %加网格
fs=16;                                 %字体大小
title('同一直线上简谐振动的合成','FontSize',fs)%显示标题
xlabel('相位\it\omegat','FontSize',fs) %标记横轴
ylabel('位移\itx\rm/m','FontSize',fs)  %标记纵轴
leg=char('\itx\rm_1','\itx\rm_2','\itx\rm_1+\itx\rm_2');%图例
h=legend(leg,4);                       %加图例
set(h,'FontSize',fs)                   %放大图例
a=sqrt(a1^2+a2^2+2*a1*a2*cos(phi2-phi1));%合振幅
phi=atan((a1*sin(phi1)+a2*sin(phi2))...
    /(a1*cos(phi1)+a2*cos(phi2)));     %合振动的初相
if abs(phi)<1e-8 phi=0;end             %接近于0的数就当0处理
text(0,a,['\itA\rm=',num2str(a),'m'],'FontSize',fs)%显示合振幅
text(0,-a,['\it\phi\rm=',num2str(phi*180/pi),'\circ'],...
    'FontSize',fs)                     %显示合振动的角度

