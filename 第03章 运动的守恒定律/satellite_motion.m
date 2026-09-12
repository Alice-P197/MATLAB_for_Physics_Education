clear                                  %清除变量
clc
close all
v0=0.75:0.1:1.05;                     %飞船发射速度与第二宇宙速度比向量
n=length(v0);                          %速度个数
tm=104;                                %最大时间
R=[];                                  %极径矩阵置空
TH=[];                                 %极角矩阵置空
options.RelTol=1e-5;                   %相对容差选项

for i=1:n                              %按速度比循环
    [t,Y]=ode45('satellite_motion_fun',[0:tm/1000:tm],[1;0;0;v0(i)],options);%求微分方程的数值解
    R=[R,Y(:,1)];                      %连接极径
    TH=[TH,Y(:,2)];                    %连接极角
end                                    %结束循环
[X,Y]=pol2cart(TH,R);                  %将极坐标化为直角坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(X,Y,'LineWidth',2)                %画轨道
grid on                                %加网格
axis equal                             %使坐标间隔相等
axis([-10,2,-5,5])                     %设置轨道范围
fs=16;                                 %字体大小
title('不同发射速度的飞船运动轨道','FontSize',fs)%标题
xlabel('\itx/R\rm_E','FontSize',fs)    %标记坐标x符号
ylabel('\ity/R\rm_E','FontSize',fs)    %标记坐标y符号
legend([repmat('\itv\rm_0/\itv\rm_I_I=',n,1),num2str(v0')])%加图例
th=(0:1000)/1000*2*pi;                 %角度向量
x=cos(th);                             %地球横坐标
y=sin(th);                             %地球纵坐标
hold on                                %保持图像
fill(x,y,'g')                          %画地球
text(-1,0,'地球','FontSize',fs)        %显示文本
txt='\itv\rm_0为发射速度,\itv\rm_I_I为第二宇宙速度,';%速度文本
txt=[txt,'\itR\rm_E为地球半径'];       %连接地球半径文本
text(-10,-4.5,txt,'FontSize',fs)       %显示文本

