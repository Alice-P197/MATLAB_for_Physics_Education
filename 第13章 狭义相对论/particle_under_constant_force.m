%质点在恒作用下的运动
clear                                  %清除变量
t=0:0.1:8;                             %时间向量
v=t./sqrt(1+t.^2);                     %求速度
x=sqrt(1+t.^2)-1;                      %求坐标(路程)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(t,v,'LineWidth',2)                %画速度曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('质点在恒作用下的速度与时间的关系曲线','FontSize',fs)%标题
xlabel('\itt/t\rm_0','FontSize',fs)    %横坐标
ylabel('\itv/c','FontSize',fs)         %纵坐标
text(0,0.5,'\itt\rm_0=\itm\rm_0\itc/F','FontSize',fs)%显示时间单位
subplot(2,1,2)                         %选子图
plot(t,x,t,x+1,'--','LineWidth',2)     %画距离和质量曲线
grid on                                %加网格
legend('\itx/ct\rm_0','\itm/m\rm_0',2) %图例
title('质点在恒作用下的路程和质量与时间的关系曲线','FontSize',fs)%标题
xlabel('\itt/t\rm_0','FontSize',fs)    %横坐标

