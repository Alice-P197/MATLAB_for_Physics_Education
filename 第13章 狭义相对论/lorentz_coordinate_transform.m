%洛伦兹坐标变换平面
clear                                  %清除变量
x=0:0.1:2;                             %参考系S的坐标向量x/ct0
t=0:0.1:2;                             %S系中经过的时间向量t/t0
[X,T]=meshgrid(x,t);                   %坐标和时间向量化为矩阵
xx=inline('(x-u*t)./sqrt(1-u^2)','x','t','u');%坐标变换的内线函数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
mesh(x,t,xx(X,T,0.1))                  %画坐标网格平面
box on                                 %加框架
hold on                                %保持图像
surf(x,t,xx(X,T,0.9))                  %画坐标平面
alpha(0.5)                             %平面半透明
legend('\itu\rm=0.1\itc','\itu\rm=0.9\itc',1)%图例
fs=16;                                 %字体大小
title('洛伦兹坐标变换的坐标平面','fontsize',fs)%标题
xlabel('\itx/ct\rm_0','fontsize',fs)   %横坐标
ylabel('\itt/t\rm_0','fontsize',fs)    %纵坐标
zlabel('\itx\rm\prime/\itct\rm_0','fontsize',fs)%高坐标
tt=inline('(t-u*x)./sqrt(1-u^2)','x','t','u');%时间变换的内线函数
text(0,0,0,'\itt\rm_0为时间单位','fontsize',fs)%标记时间单位
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
mesh(x,t,tt(X,T,0.1))                  %画时间网格平面
box on                                 %加框架
hold on                                %保持图像
surf(x,t,tt(X,T,0.9))                  %画时间平面
alpha(0.5)                             %平面半透明
legend('\itu\rm=0.1\itc','\itu\rm=0.9\itc',1)%图例
title('洛伦兹坐标变换的时间平面','fontsize',fs)%标题
xlabel('\itx/ct\rm_0','fontsize',fs)   %横坐标
ylabel('\itt/t\rm_0','fontsize',fs)    %纵坐标
zlabel('\itt\rm\prime/\itt\rm_0','fontsize',fs)%高坐标
text(0,0,0,'\itt\rm_0为时间单位','fontsize',fs)%标记时间单位

