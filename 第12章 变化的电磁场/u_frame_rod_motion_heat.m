%磁场中U形框上导体的运动规律和电阻产生的热量
clear                                  %清除变量
t=0:0.01:5;                            %时间向量(与特征时间的比值)
v=exp(-t);                             %速度(以初速度为单位)
x=1-exp(-t);                           %位移(以初速度和特征时间的乘积为单位)
q=1-exp(-2*t);                         %热量(以初动能为单位)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选子图
plot(t,v,'LineWidth',2)                %画速度曲线
grid on                                %加网格
fs=12;                                 %字体大小
title('U形框上导体的运动速度','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标
ylabel('速度\itv/v\rm_0','FontSize',fs)%显示纵坐标
text(0,0.5,'{\it\tau}={\itmR}/({\itBL})^2','FontSize',fs)%标记时间单位
subplot(3,1,2)                         %选子图
plot(t,x,'LineWidth',2)                %画位移曲线
grid on                                %加网格
title('U形框上导体的运动距离','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标
ylabel('距离\itx/v\rm_0\it\tau','FontSize',fs)%显示纵坐标
subplot(3,1,3)                         %选子图
plot(t,q,'LineWidth',2)                %画热量曲线
grid on                                %加网格
title('U形框上电阻产生的的热量','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标
ylabel('热量\itQ/Q\rm_0','FontSize',fs)%显示纵坐标
text(0,0.5,'{\itQ}_0={\itmv}_0^2/2','FontSize',fs)%标记热量单位
