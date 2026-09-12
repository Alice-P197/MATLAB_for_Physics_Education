%斜抛物体的射程,射高和最高点的分布
clear                                  %清除变量
theta=0:90;                            %物体射角的度数向量
th=theta*pi/180;                       %物体射角的弧度数
x=sin(2*th);                           %水平射程(以最大射程为单位)
y=sin(th).^2/2;                        %竖直射高(以最大射程为单位)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(theta,x,theta,y,'--','linewidth',2)%画射程和射高曲线
grid on                                %加网格
legend('射程\itX/X\rm_M','射高\itY/X\rm_M')%图例
fs=16;                                 %字体大小
title('斜抛物体的水平射程和竖直射高','FontSize',fs)%标题
xlabel('射角\it\theta/\rm\circ','FontSize',fs)%横坐标标签
text(0,0.5,'\itX\rm_M=\itv\rm_0^2/\itg','FontSize',fs)%说明最大射程
theta=15:10:75;                        %物体射角的度数向量
th=theta*pi/180;                       %物体射角的弧度数
x=linspace(0,1,40);                    %水平坐标向量(以最大射程为单位)
[TH,X]=meshgrid(th,x);                 %水平坐标和角度和矩阵
Y=X.*tan(TH)-X.^2/2./cos(TH).^2;       %高度位置矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(x,Y,'LineWidth',2)                %画斜抛运动曲线族
plot(x,Y(:,1),'o-',x,Y(:,2),'d-',x,Y(:,3),'s-',x,Y(:,4),'p-',...
    x,Y(:,5),'h-',x,Y(:,6),'<-',x,Y(:,7),'>-','LineStyle','--')%画斜抛运动曲线族
grid on                                %加网格
axis equal                             %使坐标刻度相等
axis([0 1 0 0.5])                      %曲线范围
n=length(th);                          %射角的个数
h=legend([num2str(theta'),repmat('\circ',n,1)]);%插入角度图例
set(h,'FontSize',fs-2)                 %放大图例
y0=zeros(size(th));                    %落点纵坐标向量
x0=sin(2*th);                          %落点横坐标向量(射高的横坐标的两倍)
text(x0,y0,num2str(x0',3),'FontSize',fs)%标记射程(保留3位)
ym=sin(th).^2/2;                       %射高
text(x0/2,ym,num2str(ym',3),'FontSize',fs)%标记射高(保留3位)
hold on                                %保持图像
plot([y0;x0/2],[ym;ym],'--')           %画射高的水平虚线
stem(x0/2,ym,'--','filled')            %画直杆虚线作为射高的竖直线
ym=0:0.01:0.5;                         %最高点的纵坐标
xm=0.5*sqrt(1-((ym-0.25)/0.25).^2);    %最高点的横坐标
plot(xm,ym,'LineWidth',2)              %画最大高度曲线
title('斜抛物体的曲线和最高点的分布','FontSize',fs)%标题
xlabel('水平坐标\itx/X\rm_M','FontSize',fs)%横坐标标签
ylabel('竖直坐标\ity/X\rm_M','FontSize',fs)%纵坐标标签
text(0.6,0.4,'\itX\rm_M=\itv\rm_0^2/\itg','FontSize',fs)%说明最大射程

