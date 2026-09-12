%用光电效应计算普朗克常数
clear                                  %清除变量
nu=(9:12)*1e14;                        %入射光频率
us=[1.46,1.88,2.25,2.7];               %截止电压实验值
n=length(us);                          %数据个数
x=sum(nu)/n;                           %x平均值
xx=sum(nu.^2)/n;                       %x*x的平均值
y=sum(us)/n;                           %y平均值
xy=sum(nu.*us)/n;                      %x*y平均值
k=(xy-x*y)/(xx-x^2);                   %直线斜率
b=(xx*y-xy*x)/(xx-x^2);                %直线截距
p=polyfit(nu,us,1)                     %计算拟合多项式系数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(nu,us,'*','MarkerSize',12)        %画原数据
grid on                                %加网格
hold on                                %保持图像
plot([0,nu],[b,k*nu+b],'--','LineWidth',2)%画二项式拟合直线
plot([0,nu],[p(2),polyval(p,nu)],'LineWidth',2)%画多项式拟合直线(两线重叠)
fs=18;                                 %字体大小
title('光电效应的拟合直线和普朗克常数','FontSize',fs)%显示标题
xlabel('\it\nu','FontSize',fs)         %标记横坐标
ylabel('\itU\rm_s','FontSize',fs)      %标记纵坐标
e=1.6e-19;                             %电子的电量
nu0=-p(2)/p(1);                        %红限频率
a=-e*p(2);                             %逸出功
h=e*p(1);                              %测量的普朗克常数
plot(nu0,0,'o',0,p(2),'o')             %画点
%text(nu0,0,['\it\nu\rm_0=' num2str(nu0) 'Hz'],'FontSize',fs)%标记红限频率
text(nu0,0,['\it\nu\rm_0=',sprintf('%0.5g',nu0),'Hz'],'FontSize',fs)%标记红限频率
text(0,p(2),['\itA\rm=',num2str(a),'J'],'FontSize',fs)%标记逸出功
text(0,0,['\ith\rm=',num2str(h),'J\cdots'],'FontSize',fs)%标记普朗克常数

