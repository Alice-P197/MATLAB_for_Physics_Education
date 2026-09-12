%匀强电场放置导体球的电场
clear                                  %清除变量
xm=4;                                  %x坐标范围
x=linspace(-xm,xm,300);                %横坐标向量
ym=3;                                  %y坐标范围
y=linspace(-ym,ym,300);                %纵坐标向量
[X,Y]=meshgrid(x,y);           	       %设置坐标网点
R=sqrt(X.^2+Y.^2);                     %极径矩阵
R(R<1)=nan;                            %球内极径化为非数
U=X./R.^3;                             %计算导体球产生的电势
Ex=(2*X.^2-Y.^2)./R.^5;                %计算导体球产生的场强的x分量
Ey=3*X.*Y./R.^5;                       %计算导体球产生的场强的y分量
u=0.2:0.2:0.8;                         %导体球的电势向量
a=linspace(0,2*pi);                    %角度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(cos(a),sin(a),'LineWidth',3)      %画单位圆
hold on                                %保持图像
contour(X,Y,U,u,'LineWidth',2)         %画第一,四象限等位线图
contour(-X,Y,U,u,'LineWidth',2)        %画第二,三象限等位线图
dth=10;                                %角度间隔
th=(dth:dth:90-dth)*pi/180;            %角度向量
y0=1.03*sin(th);                       %球外电场线起点纵坐标向量
x0=1.03*cos(th);                       %球外电场线起点横坐标向量
h=streamline(X,Y,Ex,Ey,x0,y0);         %画第一象限流线
set(h,'LineWidth',2)                   %加粗曲线
h=streamline(-X,Y,-Ex,Ey,-x0,y0);      %画第二象限流线
set(h,'LineWidth',2)                   %加粗曲线
h=streamline(X,-Y,Ex,-Ey,x0,-y0);      %画第四象限流线
set(h,'LineWidth',2)                   %加粗曲线
h=streamline(-X,-Y,-Ex,-Ey,-x0,-y0);   %画第三象限流线
set(h,'LineWidth',2)                   %加粗曲线
plot([-xm,xm],[0,0],'LineWidth',2)     %画中间电场线
plot([0,0],[-ym,ym],'LineWidth',2)     %画竖直线
grid on                                %加网格
axis equal tight                       %使坐标间隔相等并紧贴图
fs=16;                                 %字体大小
title('感应电荷在导体球内外的电场线和等势线','FontSize',fs)%显示标题
xlabel('\itx/R','FontSize',fs)         %显示x坐标
ylabel('\ity/R','FontSize',fs)         %显示y坐标
y2=-.75:0.25:0.75;                     %球内电场线起点纵坐标向量
x2=sqrt(1-y2.^2);                      %球内电场线起点横坐标向量
plot([-x2;x2],[y2;y2])                 %画球内电场线
n=length(y2);                          %电场线条数
text(x2-0.2,y2,repmat('+',n,1),'FontSize',fs)%显示正电荷
text(-x2,y2,repmat('-',n,1),'FontSize',fs)%显示负电荷

Ex=Ex+1;                               %总场强的x分量
U=U-X;                                 %总电势
u=-3:0.5:3;                            %等势线的电势向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
C=contour(X,Y,U,u,'LineWidth',2);	   %画等位线图并取坐标
clabel(C,'FontSize',fs)                %标记电势值
grid on                                %加网格
axis equal tight                       %使坐标间隔相等并紧贴图
%legend(num2str(u',3))                  %加图例
hold on                                %保持图像
plot(cos(a),sin(a),'LineWidth',3)      %画单位圆
y0=-ym:0.25:ym;                        %起点纵坐标向量
x0=ones(size(y0))*(-xm);               %起点横坐标向量
h=streamline(X,Y,Ex,Ey,x0,y0);         %画从左向右的流线
set(h,'LineWidth',2)                   %加粗曲线
h=streamline(X,Y,-Ex,-Ey,-x0,y0);      %画从右向左的流线
set(h,'LineWidth',2)                   %加粗曲线
r0=sqrt(x0.^2+y0.^2);                  %极径
ex=(2*x0.^2-y0.^2)./r0.^5+1;           %计算起点场强的x分量
ey=3*x0.*y0./r0.^5;                    %计算起点场强的y分量
quiver(x0,y0,ex,ey,0.3)                %画起点箭头
plot([-xm,-1],[0,0],[xm,1],[0,0],'LineWidth',2)%画中间电场线
plot([0,0],[-ym,ym],'LineWidth',2)     %画竖直线
title('导体球在均匀电场\itE\rm_0中的电场线和等势线','FontSize',fs)%显示标题
xlabel('\itx/R','FontSize',fs)         %显示x坐标
ylabel('\ity/R','FontSize',fs)         %显示y坐标
text(-xm,-ym+1,'电势单位为\itE\rm_0\itR','FontSize',fs)%显示电势单位文本
text(x2-0.2,y2,repmat('+',n,1),'FontSize',fs)%显示正电荷
text(-x2,y2,repmat('-',n,1),'FontSize',fs)%显示负电荷

