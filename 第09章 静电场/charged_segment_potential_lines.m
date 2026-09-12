%带电线段的电势面以及等势线和电场线
clear                                  %清除变量
xm=4;                                  %x坐标范围
x=linspace(-xm,xm);                    %横坐标向量(绕过零点)
ym=3;                                  %y坐标范围
y=linspace(-ym,ym);                    %纵坐标向量(绕过零点)
[X,Y]=meshgrid(x,y);  	               %设置坐标网点
R1=sqrt((X+1).^2+Y.^2);                %场点到左边端点的距离
R2=sqrt((X-1).^2+Y.^2);                %场点到右边端点的距离
U=log((X+1+R1)./(X-1+R2));	           %计算电势
U(U>6)=6;                              %大于6的值改为6
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(X,Y,U)                            %画曲面
box on                                 %加框
axis tight                             %图形紧贴
alpha(0.8)                             %使曲面稍为透明
shading interp                         %染色
hold on                                %保持图像
plot3([-1;1],[0;0],[0;0],'r','LineWidth',2)%画带电线
fs=16;                                 %字体大小
title('带电线段的电势面','FontSize',fs)%显示标题
xlabel('\itx/L','FontSize',fs)         %显示x坐标
ylabel('\ity/L','FontSize',fs)         %显示y坐标
zlabel('\itU/k\lambda','FontSize',fs)  %显示z坐标
u=0.5:0.25:3;                          %电势向量
contour3(X,Y,U,u,'r')	               %画三维等势线

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
C=contour(X,Y,U,u,'LineWidth',2);      %画等势线并取等势线的坐标
%[C,h]=contour(X,Y,U,u);               %画等势线并取等势线的坐标(6.5版用)
%set(h,'LineWidth',2)                   %加粗曲线
clabel(C,'FontSize',fs)                %标记等势线的值
grid on                                %加网格
axis equal tight                       %使坐标间隔相等
hold on                                %保持图像
plot([-xm;xm],[0;0],'LineWidth',2)     %画水平线
plot([-1;1],[0;0],'r','LineWidth',5)   %画带电线
%[Ex,Ey]=gradient(-U);                  %求电场强度的两个分量
[Ex,Ey]=gradient(-U,x(2)-x(1),y(2)-y(1));%求电场强度的两个分量
x0=-1:0.2:1;                           %电场线的起点横坐标
y0=0.05*ones(size(x0));                %电场线起点高度
h=streamline(X,Y,Ex,Ey,x0,y0);         %画上面电场线
set(h,'LineWidth',2)                   %加粗曲线
h=streamline(X,-Y,Ex,-Ey,x0,-y0);      %画下面电场线
set(h,'LineWidth',2)                   %加粗曲线
r1=sqrt((x0+1).^2+y0.^2);              %起点到左边端点的距离
r2=sqrt((x0-1).^2+y0.^2);              %起点到右边端点的距离
ex=1./r2-1./r1;                        %起点场强的x分量
ey=((x0+1)./r1-(x0-1)./r2)./y0;        %起点场强的y分量
quiver(x0,y0,ex,ey,0.4)                %画上面电场线起点的箭头
quiver(x0,-y0,ex,-ey,0.4)              %画下面电场线起点的箭头
title('带电线段的电场线和等势线','FontSize',fs)%显示标题
xlabel('\itx/L','FontSize',fs)         %显示x坐标
ylabel('\ity/L','FontSize',fs)         %显示y坐标
text(-xm,ym,'电势单位:\itk\lambda','FontSize',fs)%显示电势单位文本


