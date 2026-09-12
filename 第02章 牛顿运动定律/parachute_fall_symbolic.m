%降落伞下落的高度,速度和加速度(用微分方程的符号解)
clear                                  %清除变量
vt=5;                                  %极限速度
g=9.8;                                 %重力加速度
t=0:0.01:2;                            %时间向量
sx=dsolve('D2x+g/vt^2*(Dx)^2-g','x(0)=0','Dx(0)=v0')%微分方程的符号解
sv=diff(sx,'t');                       %求速度的符号解
sa=diff(sv,'t');                       %求加速度的符号解
x1=subs(sx,{'g','v0','vt'},{g,0,vt});  %将符号用常数代替
x1=subs(x1,'t',t);                     %高度
v1=subs(sv,{'g','v0','vt'},{g,0,vt});  %将符号用常数代替
v1=subs(v1,'t',t);                     %速度
a1=subs(sa,{'g','v0','vt'},{g,0,vt});  %将符号用常数代替
a1=subs(a1,'t',t);                     %加速度

x2=subs(sx,{'g','v0','vt'},{g,10,vt}); %将符号用常数代替
x2=subs(x2,'t',t);                     %高度
v2=subs(sv,{'g','v0','vt'},{g,10,vt}); %将符号用常数代替
v2=subs(v2,'t',t);                     %速度
a2=subs(sa,{'g','v0','vt'},{g,10,vt}); %将符号用常数代替
a2=subs(a2,'t',t);                     %加速度
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

