%电介质中有极分子的取向极化
clear                                  %清除变量
rand('state',0)                        %随机数状态初始化
xm=5;                                  %横坐标范围
ym=4;                                  %纵坐标范围
X=xm*(2*rand(4*ym+1,4*xm+1)-1);        %随机横坐标矩阵
Y=ym*(2*rand(4*ym+1,4*xm+1)-1);        %随机纵坐标矩阵
xx=X(:)';                              %分子的横坐标向量
yy=Y(:)';                              %分子的纵坐标向量
th=pi*(2*rand(1,length(xx))-1);        %角度向量
r0=0.25;                               %电荷偏移量
x0=r0*cos(th);                         %电荷的横坐标
y0=r0*sin(th);                         %电荷的纵坐标
fs=16;                                 %字体大小
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=plot([xx-x0;xx+x0],[yy-y0;yy+y0],'ko-',xx+x0,yy+y0,'r+','LineWidth',2);%画电偶极矩不为零的分子
axis([-xm-1,xm+1,-ym-0.5,ym+0.5])      %坐标范围
axis equal off                         %使坐标间隔相等并隐轴
hold on                                %保持图像
plot([xm,-xm,-xm,xm,xm],[ym,ym,-ym,-ym,ym],'LineWidth',2)%画介质方框
title('无外电场时有极分子的电偶极矩的分布是杂乱无章的','FontSize',fs)%显示标题
pause                                  %暂停
set(h,'XData',nan,'YData',nan)         %设置坐标为非数(删除分子)
th=th/2;                               %有外电场时角度减为一半
x0=r0*cos(th);                         %电荷的横坐标
y0=r0*sin(th);                         %电荷的纵坐标
h=plot([xx-x0;xx+x0],[yy-y0;yy+y0],'ko-',xx+x0,yy+y0,'r+','LineWidth',2);%画取向极化分子
title('有外电场时有极分子向外电场的方向偏转(取向极化)','FontSize',fs)%更换标题
plot([-xm-1,xm+1],[-ym-0.5,-ym-0.5],'LineWidth',2)%画电场线
plot(xm+1,-ym-0.5,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头
plot([-xm-1,xm+1],[ym+0.5,ym+0.5],'LineWidth',2)%画电场线
plot(xm+1,ym+0.5,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头
text(xm+1,0,'\itE\rm_0','FontSize',fs) %显示外场强
pause                                  %暂停
set(h,'XData',nan,'YData',nan)         %设置坐标为非数(删除分子)
th=th/2;                               %外电场加强时角度再减为一半
x0=r0*cos(th);                         %电荷的横坐标
y0=r0*sin(th);                         %电荷的纵坐标
plot([xx-x0;xx+x0],[yy-y0;yy+y0],'ko-',xx+x0,yy+y0,'r+','LineWidth',2)%画取向极化分子
title('外电场越强有极分子越向外电场的方向偏转','FontSize',fs)%修改标题
plot([-xm-1,xm+1],[0,0],'LineWidth',2) %画电场线
plot(xm+1,0,'>','MarkerSize',10,'MarkerFaceColor','k')%画箭头

