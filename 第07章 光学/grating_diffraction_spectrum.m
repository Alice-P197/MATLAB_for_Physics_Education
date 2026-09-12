%光珊衍射强度曲线一般程序和光谱线
clear                                  %清除变量
thm=5;                                 %最大角度
theta=-thm:0.001:thm;                  %角度向量
theta(theta==0)=eps;                   %为零者改为小量
a=input('请输入缝宽与波长的比值:');    %键盘输入缝宽与波长的比值
d=input('请输入缝间宽度与缝宽的比值:');%键盘输入缝间宽度与缝宽的比值
n=input('请输入光珊条数:');            %键盘输入光珊条数
%a=20;d=4;n=3;                          %第1组参考值
%a=15;d=4;n=3;                          %第2组参考值
%a=20;d=6;n=3;                          %第3组参考值
%a=20;d=4;n=5;                          %第4组参考值
u=pi*a*sin(theta*pi/180);              %衍射角度向量
v=d*u;                                 %干涉角度向量
i1=(sin(n*v)./(n*sin(v))).^2;          %缝间干涉的光强向量
i2=(sin(u)./u).^2;                     %单缝衍射的光强向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(theta,i1.*i2,theta,i2,':','LineWidth',2)%画光珊衍射曲线
grid on                                %加网格
axis([-thm,thm,0,1.2])                 %曲线范围
fs=16;                                 %字体大小
title('光珊衍射的光强曲线和谱线','FontSize',fs)%标题
xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
text(-thm,0.75,['\ita\rm/\it\lambda\rm=',num2str(a)],'FontSize',fs)%显示文本
text(-thm,0.5,['\itd\rm/\ita\rm=',num2str(d)],'FontSize',fs)%显示文本
text(-thm,0.25,['\itN\rm=',num2str(n)],'FontSize',fs)%显示文本
c=linspace(0,1,64)';                   %颜色范围
subplot(2,1,2)                         %选子图
image(i1.*i2*1000)                     %画图像
ColorMap([c,c*0,c*0])                  %形成红色色图
axis off                               %隐轴

