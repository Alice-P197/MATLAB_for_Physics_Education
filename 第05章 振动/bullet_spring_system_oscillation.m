%子弹击入弹簧悬挂物体中的振动
clear                                  %清除变量
v0=0.2:0.4:1.8;                        %初速度向量(以g/omega为单位)
m=2;                                   %周期的个数
t=linspace(0,m*2*pi,40);               %无量纲时间向量
[V0,T]=meshgrid(v0,t);                 %化为矩阵
X=sqrt(1+V0.^2).*cos(T-atan(V0));      %位移
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,X,'LineWidth',2)                %画位移曲线族
plot(t,X(:,1),'o-',t,X(:,2),'d-',t,X(:,3),'s-',t,X(:,4),'p-',...
    t,X(:,5),'h-')                     %画位移曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('子弹击入弹簧悬挂物体中的振动','FontSize',fs)%标题
xlabel('\it\omegat','FontSize',fs)     %标记横坐标
ylabel('\itx/x\rm_0','FontSize',fs)    %标记纵坐标
text(0,0,'\itx\rm_0=\itmg/k','FontSize',fs)%标记振幅单位
leg=[repmat('\itv\rm_0\it\omega/g\rm=',length(v0),1),num2str(v0')];%图例字符串
legend(leg,4)                          %图例
set(gca,'XTick',(0:4*m)*pi/2)          %设置横坐标刻度线
text(0,min(X(:)),'{\it\omega}=[{\itk}/({\itm}+{\itM})]^{1/2}',...
    'FontSize',fs)                     %标记圆频率

