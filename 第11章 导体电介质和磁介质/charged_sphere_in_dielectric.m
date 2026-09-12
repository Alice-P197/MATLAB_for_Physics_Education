%带电金属球在介质中的场强
clear                                  %清除变量
er=input('请输入相对介电常数(大于或等于1):');%键盘输入相对介电常数
r=1:0.01:3;                            %距离向量
e=1/er./r.^2;                          %总场强
e0=1./r.^2;                            %自由电荷的场强
ee=(1-er)/er./r.^2;                    %束缚电荷的场强
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(r,[e0;ee;e])                      %画场强曲线
plot(r,e0,r,ee,'--',r,e,'-.','LineWidth',3)%画场强曲线
grid on                                %加网格
legend('\itE\rm_0/\itE\rm_R','\itE\prime/E_R','\itE/E_R')%加图例
fs=16;                                 %字体大小
title('带电金属球在介质中的场强','FontSize',fs)%显示标题
xlabel('\itr/R','FontSize',fs)         %显示x坐标
txt='\itE_R\rm=\itkQ/R\rm^2';          %电势单位文本
text(1,0,'\itE_R\rm=\itkQ/R\rm^2','FontSize',fs)%显示电势单位文本
text(1,1/er,['\it\epsilon\rm_r=',num2str(er)],'FontSize',fs)%显示相对介电常数
