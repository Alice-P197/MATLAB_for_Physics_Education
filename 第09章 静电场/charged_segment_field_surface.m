%带电线段的电场强度面和电场强度分量的曲线族
clear                                  %清除变量
xm=4;                                  %x坐标范围
x=linspace(-xm,xm);                    %横坐标向量(绕过零点)
ym=3;                                  %y坐标范围
y=linspace(-ym,ym);                    %纵坐标向量(绕过零点)
[X,Y]=meshgrid(x,y);  	               %设置坐标网点
r1='sqrt((x+1).^2+y.^2)';              %场点到左边端点的距离字符串
r2='sqrt((x-1).^2+y.^2)';              %场点到右边端点的距离字符串
Ex=inline(['1./',r2,'-1./',r1]);       %场强的x分量内线函数
Ey=inline(['((x+1)./',r1,'-(x-1)./',r2,')./y']);%场强的y分量内线函数
EX=Ex(X,Y);                            %场强的x分量值
EY=Ey(X,Y);                            %场强的y分量值
E=sqrt(EX.^2+EY.^2);                   %总场强
A=atan2(EY,EX)*180/pi;                 %角度
EC={EX,EY,E,A};                        %场强元胞
tc={'电场强度\itx\rm分量','电场强度\ity\rm分量',...
    '总场强','场强方向'};               %标题元胞
zc={'E_x/k\lambdaL\rm^-^1','E_y/k\lambdaL\rm^-^1',...
    'E/k\lambdaL\rm^-^1','\alpha\rm/\circ'};%高坐标元胞
fs=16;                                 %字体大小
for i=1:4                              %按子图循环
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%    subplot(2,2,i)                     %选子图
	surf(X,Y,EC{i})                    %画曲面
    axis tight                         %图形紧贴
	box on                             %加框
	shading interp                     %染色
	alpha(0.8)                         %使曲面稍为透明
	hold on                            %保持图像
	plot3([-1;1],[0;0],[0;0],'r','LineWidth',2)%画带电线
	title(['带电线段',tc{i}],'FontSize',fs)%显示标题
	xlabel('\itx/L','FontSize',fs)     %显示x坐标
	ylabel('\ity/L','FontSize',fs)     %显示y坐标
	zlabel(['\it',zc{i}],'FontSize',fs)%显示z坐标
end                                    %结束循环

