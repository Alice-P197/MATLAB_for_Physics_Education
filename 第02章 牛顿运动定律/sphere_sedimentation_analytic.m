%小球在水中沉降的运动规律(用解析公式)
clear                                  %清除变量
tm=5;                                  %最大无量纲时间
t=0:0.01:tm;                           %时间向量
v=1-exp(-t);                           %求速度
v1=1-exp(-1);                          %特征速度
x=t+exp(-t)-1;                         %深度
%-------------------------------------------------
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
hold on                                %保持图像
plot([0,tm],[1,1],'r--','LineWidth',2) %画极限速度线
plot([0,1,1],[v1,v1,0],'r--','LineWidth',2)%画特征速度的坐标线
fs=12;                                 %字体大小
title('小球沉降的速度曲线','FontSize',fs)%标题
xlabel('时间\itt/\tau','FontSize',fs)  %横坐标标签
ylabel('速度\itv/v\rm_T','FontSize',fs)%纵坐标标签
txt='特征时间\it\tau\rm=\itm/k';       %特征时间文本
txt=[txt,'\rm,极限速度\itv\rm_T\it=(\itmg-B\rm)/\itk'];%极限速度文本
text(0,0.9,txt,'FontSize',fs)          %显示文本
text(1,v1,num2str(v1),'FontSize',fs)   %显示特征速度
xx=t-1;                                %渐近线
subplot(2,1,2)                         %选子图
plot(t,x,t,xx,'--','LineWidth',2)      %画深度曲线和渐近线
title('小球沉降的深度曲线','FontSize',fs)%标题
xlabel('时间\itt/\tau','FontSize',fs)  %横坐标标签
ylabel('深度\itx/v\rm_T\it\tau','FontSize',fs)%纵坐标标签
legend('深度线','渐近线',2)            %加图例
grid on                                %加网格

