%点电荷的电场强度和电势
clear                                  %清除变量
r0=2.5;                                %最大相对距离
r=0.2:0.05:r0;                         %距离向量
e=1./r.^2;                             %电场强度
u=1./r;                                %电势
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r,e,r,u,'--','LineWidth',3)       %画电场强度和电势曲线
grid on                                %加网格
axis([0,r0,0,5])                       %曲线范围
fs=16;                                 %字体大小
title('点电荷的电场强度和电势','FontSize',fs)%显示标题
xlabel('\itr/r\rm_0','FontSize',fs)    %显示x坐标
legend('电场强度\itE/E\rm_0','电势\itU/U\rm_0')%图例
etxt='电场强度单位\itE\rm_0=\itkQ/r\rm_0^2';%电场强度单位文本
utxt='电势单位\itU\rm_0=\itkQ/r\rm_0'; %电势单位文本
text(0.5,3,etxt,'FontSize',fs)         %标记电场强度单位
text(0,1,utxt,'FontSize',fs)           %标记电势单位

u=0.5:0.5:3.5;                         %等势线的电势
n=length(u);                           %等势面的个数
r=1./u;                                %距离向量
th=linspace(0,2*pi);                   %角度向量
X=cos(th)'*r;                          %等势线的x坐标
Y=sin(th)'*r;                          %等势线的y坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(X,Y,'LineWidth',2)                %画圆
axis equal                             %使坐标间隔相同
grid on                                %加网格
legend([num2str(u'),repmat('\itU\rm_0',n,1)],-1)%图例
th=(0:30:330)*pi/180;                  %角度向量
x=r0*cos(th);                          %电场线终点的x坐标
y=r0*sin(th);                          %电场线终点的y坐标
o=zeros(size(th));                     %电场线起点坐标
hold on                                %保持图像
quiver(o,o,x,y,0,'LineWidth',2)        %画射线
plot(0,0,'o')                          %画点电荷
title('点电荷的电场线和等势线','FontSize',fs)%显示标题
xlabel('\itx/r\rm_0','FontSize',fs)    %显示x坐标
ylabel('\ity/r\rm_0','FontSize',fs)    %显示y坐标
utxt='电势单位\itU\rm_0=\itkQ/r\rm_0'; %电势单位文本
text(-r0,-r0+0.5,utxt,'FontSize',fs)   %标记电势文本

