%等强同向平行直线电流的磁场
clear                                  %清除变量
rm=4;                                  %最大坐标
r=linspace(-rm,rm,40);                 %坐标向量(绕过奇点)
[X,Y]=meshgrid(r);                     %直角坐标矩阵
rr1='((x+1).^2+y.^2)';                 %场点到左边端点的距离的平方字符串
rr2='((x-1).^2+y.^2)';                 %场点到右边端点的距离的平方字符串
Bx=inline(['-2*y.*(1./',rr1,'+1./',rr2,')']);%磁感应强度x分量的内线函数
By=inline(['2*(x+1)./',rr1,'+2*(x-1)./',rr2]);%磁感应强度y分量的内线函数
BX=Bx(X,Y);                            %磁感应强度的x分量矩阵
BY=By(X,Y);                            %磁感应强度的y分量矩阵
B=sqrt(BX.^2+BY.^2);                   %总磁感应强度
A=atan2(BY,BX)*180/pi;                 %角度
BC={BX,BY,B,A};                        %数据元胞
zc={'\itB_x/B\rm_0','\itB_y/B\rm_0',...
    '\itB/B\rm_0','\it\alpha\rm/\circ'};%高坐标元胞
tc={'\itx\rm分量','\ity\rm分量','总量\itB\rm','方向'};%标题的一部分
txt='\itB\rm_0=\itk\rm_m\itI/a';       %磁感应强度单位文本
fs=16;                                 %字体大小
for i=1:4                              %循环
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    surf(X,Y,BC{i})                    %画场强曲面
    alpha(0.8)                         %曲面稍透明
    box on                             %加框
    tit=['等强同向平行直线电流的磁感应强度的' tc{i} '的分布面'];%标题
    title(tit,'FontSize',fs)           %显示标题
    xlabel('\itx/a','FontSize',fs)     %显示x坐标
    ylabel('\ity/a','FontSize',fs)     %显示y坐标
    zlabel(zc{i},'FontSize',fs)        %显示z坐标
    text(-rm,rm,max(BC{i}(:))/2,txt,'FontSize',fs)%显示文本
end                                    %结束循环

