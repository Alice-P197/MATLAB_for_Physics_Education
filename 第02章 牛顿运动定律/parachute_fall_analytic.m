%降落伞下落的高度,速度和加速度(用解析公式)
clear                                  %清除变量
vt=5;                                  %极限速度
g=9.8;                                 %重力加速度
t=0:0.01:2;                            %时间向量
v=inline('vt*tanh(g*t/vt+a)','t','g','vt','a');%速度内线函数
x=inline('vt^2/g*log(cosh(g*t/vt+a)/cosh(a))','t','g','vt','a');%高度内线函数
alpha1=atanh(0);                       %第一个常数
alpha2=atanh(10/vt);                   %第二个常数
% v=inline('vt*coth(g*t/vt+a)','t','g','vt','a');%速度内线函数
% x=inline('vt^2/g*log(sinh(g*t/vt+a)/sinh(a))','t','g','vt','a');%高度内线函数
% alpha1=acoth(0);                       %第一个常数
% alpha2=acoth(v20/vt);                  %第二个常数
a=inline('g*(1-(v/vt).^2)','v','g','vt');%加速度内线函数
v1=v(t,g,vt,alpha1);                   %第一个速度
x1=x(t,g,vt,alpha1);                   %第一个高度
a1=a(v1,g,vt);                         %第一个加速度
v2=v(t,g,vt,alpha2);                   %第二个速度
x2=x(t,g,vt,alpha2);                   %第二个高度
a2=a(v2,g,vt);                         %第二个加速度
%-------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选择第一个子窗口
plot(t,v1,t,v2,'r--','LineWidth',2)    %画速度曲线
fs=14;                                 %字体大小
title('降落伞下落的高度,速度和加速度','FontSize',fs)%显示标题
ylabel('速度\itv\rm/m\cdots^-^1','FontSize',fs)%标记速度
grid on                                %加网格
legend('0','10m/s')                    %加图例
subplot(3,1,2)                         %选择第二个子窗口
plot(t,x1,t,x2,'r--','LineWidth',2)    %画高度曲线
ylabel('高度\itx\rm/m','FontSize',fs)  %标记高度
grid on                                %加网格
legend('0','10m/s')                    %加图例
subplot(3,1,3)                         %选择第三个子窗口
plot(t,a1,t,a2,'r--','LineWidth',2)    %画加速度曲线
xlabel('时间\itt\rm/s','FontSize',fs)  %标记时间
ylabel('加速度\ita\rm/m\cdots^-^2','FontSize',fs)%标记加速度
grid on                                %加网格
legend('0','10m/s')                    %加图例

