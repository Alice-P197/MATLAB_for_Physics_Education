%麦克斯韦速率分布的约化曲线和三个典型速率以及分子数占总分子数的比例
clear                                  %清除变量
xx=[1,2/sqrt(pi),sqrt(3/2)];           %三个典型速率(vp的倍数)
f=inline('4/sqrt(pi)*x.^2.*exp(-x.^2)');%定义内线函数为约化分布函数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot([xx;xx],[f(xx);zeros(1,3)],'o--') %画速率竖线
plot([1,1]*xx(1),[f(xx(1)),0],'o--',[1,1]*xx(2),[f(xx(2)),0],'s--',...
    [1,1]*xx(3),[f(xx(3)),0],'d--')    %画速率竖线
legend('最概然速率','平均速率','方均根速率')%加图例
grid on                                %加网格
fs=16;                                 %字体大小
title('麦克斯韦速率分布率中的三个典型速率','FontSize',fs)%标题
xlabel('\itv/v\rm_p','FontSize',fs)    %横坐标
ylabel('\itf\rm(\itv\rm)\itv\rm_p','FontSize',fs)%纵坐标
text(xx,f(xx),[num2str(xx',4),[',';',';','],num2str(f(xx)',4)])%标记坐标
dx=0.05;                               %约化速率间隔
x=0:dx:1;                              %约化速率向量
hold on                                %保持图像
fill([x,1],[f(x),0],'y')               %画填色图
n=trapz(f(x))*dx;                      %计算小于最概然速率的分子数比例
text(0,f(1)/2,['\itN/N\rm_0=',num2str(n*100),'%'],'FontSize',fs)%标记比例文本
x=0:dx:3;                              %约化速率向量
plot(x,f(x),'LineWidth',2)             %最后画函数曲线

f1=sym('x^3*exp(-x^2)');               %平均速率被积函数符号表达式
f2=sym('x^4*exp(-x^2)');               %方均根速率被积函数符号表达式
x1=double(int(f1,0,inf)*4/sqrt(pi));   %平均速率
x2=double(sqrt(int(f2,0,inf)*4/sqrt(pi)));%方均根速率
xx=[1,x1,x2];                          %三个速率(vp的倍数)
plot(xx,f(xx),'.')                     %画用符号积分的速率点

n=inline('erf(x)-x.*exp(-x.^2)*2/sqrt(pi)');%分子数占总分子数的比例内线函数
nn=cumtrapz(f(x))*dx;                  %累计分子数比例
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(x,n(x),x,nn,'.','LineWidth',2,'MarkerSize',fs)%画分子数比例
title('0~\itv\rm之间分子数占总分子的比例','FontSize',fs)%标题
xlabel('\itv/v\rm_p','FontSize',fs)    %横坐标
ylabel('\itN/N\rm_0','FontSize',fs)    %纵坐标
legend('解析解','梯形法积分',2)        %图例
grid on                                %加网格
hold on                                %保持图像
stem(xx,n(xx),'--')                    %画杆图
text(xx,n(xx),[num2str(n(xx')*100,4),['%';'%';'%']],'FontSize',fs)%标记文本

