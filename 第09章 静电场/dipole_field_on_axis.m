%等量异号点电荷和电偶极子在轴线和中垂线上的电场强度
clear                                  %清除变量
xm=5;                                  %坐标限度
x=0.5:0.01:xm;                         %极子外的正的横坐标向量
e1=(1./(x-1).^2-1./(x+1).^2)/2;        %等量异号点电荷在x轴线上的场强
ex=2./x.^3;                            %电偶极子的场强
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(x,e1,x,ex,'--','LineWidth',2)     %画正轴上的电场强度精确曲线和近似曲线
grid on                                %加网格
axis([-xm,xm,0,1])                     %图形范围
legend('等量异号点电荷','电偶极子')    %图例
hold on                                %保持图像
plot(-x,e1,-x,ex,'--','LineWidth',2)   %画负轴上的电场强度
plot([-1,1],[0,0],'-or','LineWidth',2) %画电偶极子
fs=16;                                 %字体大小
title('等量异号点电荷和电偶极子在轴线上的电场强度','FontSize',fs)%显示标题
xlabel('\itx/L','FontSize',fs)         %显示x坐标
ylabel('\itE/E\rm_0','FontSize',fs)  %显示y坐标
text(-xm,0.5,'\itE\rm_0=2\itkQ/L\rm^2','FontSize',fs)%标记电场强度文本

ym=5;                                  %坐标限度
y=(-ym:0.1:ym)+eps;                    %坐标向量
e2=-1./(y.^2+1).^(3/2);                %等量异号点电荷在中垂线上的场强
ey=-1./abs(y).^3;                      %电偶极子的场强
subplot(2,1,2)                         %选子图
plot(y,e2,y,ey,'--','LineWidth',2)     %画中垂线上的电场强度
grid on                                %加网格
axis([-ym,ym,-1,0])                    %图形范围
legend('等量异号点电荷','电偶极子',4)  %图例
title('等量异号点电荷和电偶极子在中垂线上的电场强度','FontSize',fs)%显示标题
xlabel('\ity/L','FontSize',fs)         %显示x坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %显示y坐标

