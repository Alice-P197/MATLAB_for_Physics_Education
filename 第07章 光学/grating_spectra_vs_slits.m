%光栅衍射光谱线随缝数的变化
clear                                  %清除变量
a=20;                                  %缝宽与波长的比值
d=5;                                   %光栅常数与缝宽的比值
thm=5;                                 %最大角度
theta=-thm:0.001:thm;                  %角度向量
theta(theta==0)=eps;                   %零改为小量
n=[1,2,10,20];                         %缝的条数向量
k=length(n);                           %子图个数
u=pi*a*sin(theta*pi/180);              %第一参数向量
v=d*u;                                 %第二参数向量
i1=(sin(u)./u).^2;                     %单缝衍射的光强向量
c=linspace(0,1,64)';                   %颜色范围
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
ColorMap([c,c*0,c*0])                  %形成红色色图
tit='光栅衍射条纹随缝数的变化';        %标题一部分
for i=1:k                              %按子图循环
    i2=(sin(n(i)*v)./(n(i)*sin(v))).^2;%缝间干涉的光强向量
    subplot(k,1,i)                     %选子图
    image(i1.*i2*1000)                 %画图像
    axis off                           %隐轴
    title([tit,'(\itN\rm=',num2str(n(i)),')'],'FontSize',15)%标题
end                                    %结束循环

