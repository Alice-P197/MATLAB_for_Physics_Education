%弹簧振子的动能,势能和机械能曲线
clear                                  %清除变量
n=4;                                   %周期的个数
t=linspace(0,2*pi)*n;                  %时间向量
x=cos(t);                              %振子位置
v=-sin(t);                             %速度
ek=v.^2;                               %动能
ep=x.^2;                               %势能
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子图
plot(t,x,t,v,'--','LineWidth',2)       %画位移和速度曲线
grid on                                %加网格
axis tight                             %紧贴坐标轴
fs=16;                                 %字体大小
title('简谐振动的位移和速度','FontSize',fs)%显示标题
xlabel('\it\omegat','FontSize',fs)     %标记横轴
legend('位移\itx/A','速度\itv/\omegaA')%图例
set(gca,'XTick',(0:2*n)*pi)            %设置横坐标刻度线
text(0,0,'\it\omega\rm=(\itk/m\rm)^{1/2}','FontSize',fs)%显示角频率
subplot(2,1,2)                         %子图
plot(t,ek,'--',t,ep,'-.',t,ek+ep,'LineWidth',2)%画能量曲线
grid on                                %加网格
axis tight                             %紧贴坐标轴
title('简谐振动的能量','FontSize',fs)  %显示标题
xlabel('\it\omegat','FontSize',fs)     %标记横轴
legend('动能\itT/E\rm_0','势能\itV/E\rm_0','机械能\itE/E\rm_0')%图例
text(0,0.5,'\itE\rm_0=\itkA\rm^2/2','FontSize',fs)%显示能量单位
set(gca,'XTick',(0:2*n)*pi)            %设置横坐标刻度线

