%静电除尘器同轴圆柱线的半径
clear                                  %清除变量
e=3e6;                                 %击穿场强
u=2e4;                                 %电势差
R=0.1;                                 %外筒半径
da=0.001;                              %半径增量
a=da:da:R-da;                          %内筒半径向量
E=u./a./log(R./a);                     %内筒表面的电场强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(a,E,'LineWidth',2)                %画曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('静电除尘器金属丝表面场强与半径的关系','FontSize',fs)%显示标题
xlabel('\ita\rm/m','FontSize',fs)      %显示x坐标
ylabel('\itE\rm/V\cdotm^-^1','FontSize',fs)%显示y坐标
hold on                                %保持图像
plot([0,R],[1,1]*e,'--','LineWidth',2) %画水平线
f=inline(['log(',num2str(R),'./x).*x-',num2str(u/e)]);%内线函数
a0=fzero(f,0.01);                      %求零点半径
plot(a0,e,'o')                         %画点
text(a0,e,num2str(a0),'FontSize',fs)   %标记半径

