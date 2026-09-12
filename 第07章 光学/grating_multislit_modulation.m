%光珊衍射的缝间干涉受单缝衍射的调制
clear                                  %清除变量
a=40;                                  %缝宽与波长的比值
d=3;                                   %逢间距与缝宽的比值
n=4;                                   %缝的条数
thm=5;                                 %最大角度
theta=-thm:0.001:thm;                  %角度向量
theta(theta==0)=eps;                   %为零者改为小量
u=pi*a*sin(theta*pi/180);              %单缝衍射角度向量
v=d*u;                                 %缝间干涉角度向量
i1=(sin(u)./u).^2;                     %单缝衍射的光强向量
i2=(sin(n*v)./(n*sin(v))).^2;          %缝间干涉的光强向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(theta,i2,theta,i1,'LineWidth',2)  %画两条曲线
axis([-thm,thm,0,1.2])                 %曲线范围
grid on                                %加网格
fs=16;                                 %字体大小
title('光珊衍射的缝间干涉受单缝衍射的调制','FontSize',fs)%标题
xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
legend('缝间干涉','单缝衍射')          %图例
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(theta,i1.*i2,theta,i1,'--','LineWidth',2)%画光珊衍射曲线
grid on                                %加网格
axis([-thm thm 0 1.2])                 %曲线范围
title('光珊衍射的缝间干涉受单缝衍射的调制','FontSize',fs)%标题
xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标

