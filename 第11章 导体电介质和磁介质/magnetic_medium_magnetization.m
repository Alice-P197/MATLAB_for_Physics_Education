%磁介质的磁化
clear                                  %清除变量
rand('state',0)                        %随机数状态初始化
xm=5;                                  %横坐标范围
ym=4;                                  %纵坐标范围
x=-xm:xm;                              %横坐标向量
y=-ym:ym;                              %纵坐标向量
[X,Y]=meshgrid(x,y);                   %坐标矩阵
%X=xm*(2*rand(4*ym+1,4*xm+1)-1);        %随机横坐标矩阵
%Y=ym*(2*rand(4*ym+1,4*xm+1)-1);        %随机纵坐标矩阵
xx=X(:)';                              %分子的横坐标向量
yy=Y(:)';                              %分子的纵坐标向量
th=pi*(2*rand(1,length(xx))-1);        %角度向量
r0=0.25;                               %矢量长度
x0=r0*cos(th);                         %箭头的水平长度
y0=r0*sin(th);                         %箭头的竖直长度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h1=quiver(xx,yy,x0,y0,0,'LineWidth',2);%画磁矩方向箭杆
axis([-xm-1,xm+1,-ym-0.5,ym+0.5])      %坐标范围
axis equal off                         %使坐标间隔相等并隐轴
hold on                                %保持图像
plot([xm,-xm,-xm,xm,xm],[ym,ym,-ym,-ym,ym],'LineWidth',2)%画介质方框
a=(0:360)*pi/180;                      %椭圆角度向量
XX=ones(size(a'))*xx;                  %椭圆的中心横坐标矩阵
YY=ones(size(a'))*yy;                  %椭圆的中心纵坐标矩阵
X=r0/2*cos(a')*cos(th)-r0*sin(a')*sin(th);%椭圆的横坐标矩阵
Y=r0/2*cos(a')*sin(th)+r0*sin(a')*cos(th);%椭圆的纵坐标矩阵
h2=plot(X+XX,Y+YY,'LineWidth',2);      %画椭圆族
fs=16;                                 %字体大小
title('无外磁场时分子磁矩的分布是杂乱无章的','FontSize',fs)%显示标题
pause                                  %暂停
set(h1,'XData',nan,'YData',nan,'UData',nan,'VData',nan)%设置坐标和长度为非数(删除箭杆)
set(h2,'XData',nan,'YData',nan)        %设置坐标为非数(删除椭圆)
th=th/2;                               %有外磁场时角度减小一半
x0=r0*cos(th);                         %箭头的水平长度
y0=r0*sin(th);                         %箭头的竖直长度
h1=quiver(xx,yy,x0,y0,0,'LineWidth',2);%画磁矩方向箭杆
X=r0/2*cos(a')*cos(th)-r0*sin(a')*sin(th);%椭圆的横坐标矩阵
Y=r0/2*cos(a')*sin(th)+r0*sin(a')*cos(th);%椭圆的纵坐标矩阵
h2=plot(X+XX,Y+YY,'LineWidth',2);      %画椭圆族
title('有外磁场时分子磁矩向外磁场的方向偏转','FontSize',fs)%修改标题
plot([-xm-1,xm+1],[-ym-0.5,-ym-0.5],'LineWidth',2)%画磁感应线
plot(xm+1,-ym-0.5,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头
plot([-xm-1,xm+1],[ym+0.5,ym+0.5],'LineWidth',2)%画磁感应线
plot(xm+1,ym+0.5,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头
text(xm+1,0,'\itB\rm_0','FontSize',fs) %显示外场强
pause                                  %暂停
set(h1,'XData',nan,'YData',nan,'UData',nan,'VData',nan)%设置坐标和长度为非数(删除箭杆)
set(h2,'XData',nan,'YData',nan)        %设置坐标为非数(删除椭圆)
th=th/2;                               %有外磁场时角度减小一半
x0=r0*cos(th);                         %箭头的水平长度
y0=r0*sin(th);                         %箭头的竖直长度
quiver(xx,yy,x0,y0,0,'LineWidth',2)    %画磁矩方向箭杆
X=r0/2*cos(a')*cos(th)-r0*sin(a')*sin(th);%椭圆的横坐标矩阵
Y=r0/2*cos(a')*sin(th)+r0*sin(a')*cos(th);%椭圆的纵坐标矩阵
plot(X+XX,Y+YY,'LineWidth',2)          %画椭圆族
title('外磁场越强分子磁矩越向外磁场的方向偏转','FontSize',fs)%修改标题
plot([-xm-1,xm+1],[0,0],'LineWidth',2) %画磁感应线
plot(xm+1,0,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头
pause                                  %暂停
r0=0.22;                               %分子电流半径
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot((ym+r0)*cos(a),(ym+r0)*sin(a),'LineWidth',2)%画大圆
axis equal off                         %使坐标间隔相等并隐轴
y=-ym:0.5:ym;                          %坐标向量
[X,Y]=meshgrid(y);                     %坐标矩阵
R=sqrt(X.^2+Y.^2);                     %到圆心的距离
X(R>ym+r0)=nan;                        %距离大于大圆半径者改为非数
hold on                                %保持图像
plot(X,Y,'.')                          %画圆心表示磁矩方向
plot(X,Y,'o','MarkerSize',15,'LineWidth',2)%画圆表示分子电流
title('磁介质的截面(磁矩方向向外,周围是磁化电流)','FontSize',fs)%显示标题
plot(ym+r0,0,'^',0,ym+r0,'<',-ym-r0,0,'v',0,-ym-r0,'>',...
    'MarkerSize',10,'MarkerFaceColor','k')%画箭头

