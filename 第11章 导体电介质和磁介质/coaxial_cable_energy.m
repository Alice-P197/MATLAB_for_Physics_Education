%无限长通电同轴电缆的能量
clear                                  %清除变量
r2=input('请输入圆筒外半径与圆柱内半径的比(大于1):');%键盘输入圆筒外半径
r1=1:0.01:r2;                          %圆筒外半径向量
r1(end)=r2-eps^(1/4);                  %最后一个半径改小一点
w1=ones(size(r1));                     %圆柱能量
w2=4*log(r1);                          %柱筒之间的能量
w3=(4*r2^4*log(r2./r1)-3*r2^4+4*r2^2*r1.^2-r1.^4)./(r2^2-r1.^2).^2;%圆筒能量
w=w1+w2+w3;                            %总能量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r1,w1,r1,w2,'--',r1,w3,'-.',r1,w,':','LineWidth',2)%画能量曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('无限长通电同轴电缆的能量','FontSize',fs)%显示标题
xlabel('\itR\rm_1/\itR\rm_0','FontSize',fs)%显示横坐标
ylabel('\itW/W\rm_0','FontSize',fs)    %显示纵坐标
text(1,0.5,'\itW\rm_0=\itk\rm_m\itI\rm^2\itl\rm/4','FontSize',fs)%标记能量单位
legend('圆柱','真空','圆筒','全部',2)   %图例

