%运动电荷产生的磁感应强度的分布面
clear                                  %清除变量
rm=2;                                  %最大极径
r=0.2:0.1:rm;                          %极径向量
th=linspace(0,2*pi,50);                %极角向量
[TH,R]=meshgrid(th,r);                 %极坐标矩阵
[X,Y]=pol2cart(TH,R);                  %极坐标矩阵化为直角坐标矩阵
B=Y./R.^3;                             %磁感应强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(X,Y,B)                            %画场强曲面
alpha(0.8)                             %稍为透明
box on                                 %加框
fs=16;                                 %字体大小
title('运动电荷产生的磁感应强度的分布面','FontSize',fs)%显示标题
xlabel('\itx/r\rm_0','FontSize',fs)    %显示x坐标
ylabel('\ity/r\rm_0','FontSize',fs)    %显示y坐标
zlabel('\itB/B\rm_0','FontSize',fs)    %显示z坐标
txt='\itB\rm_0=\itk\rm_m\itqv/r\rm_0^2';%磁感应强度文本
text(-rm,rm,max(B(:)/2),txt,'FontSize',fs)%显示文本
hold on                                %保持图像
plot3(0,0,0,'.','MarkerSize',20)       %画点电荷
plot3([-rm;rm],[0;0],[0;0],'r','LineWidth',2)%画速度方向直线(场强为零)
plot3([0;0],[-rm;rm],[0;0],'r','LineWidth',2)%画垂直速度方向直线
plot3([0;0.2],[0;0],[0;0],'LineWidth',3)%画速度线
plot3(0.2,0,0,'>','MarkerFace','k')    %画箭头

