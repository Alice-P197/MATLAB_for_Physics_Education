%导弹拦截
clear                                  %清除变量
rand('state',0)                        %随机状态初始化
v2=1.1;                                 %拦截导弹速率与来袭导弹初速度之比
%v2=1;                                   %拦截导弹速率与来袭导弹初速度之比
%v2=0.9;                                 %拦截导弹速率与来袭导弹初速度之比
T=linspace(0,1);                       %飞行时间
while 1                                %做无限循环
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
	axis([0,1,-0.2,0.6])               %坐标范围
    axis equal off                     %隐藏坐标
    title('导弹拦截','FontSize',20)    %标题
    text(0,0.5,'导弹来袭时,按空格键发射拦截导弹.','FontSize',16)%显示操作方法
    hold on                            %保持图像
    plot([0,1],[0,0])                  %画地平线
    th=90*rand;                        %0到90度之间的随机角度
    th=th*pi/180;                      %化为弧度
    xx1=0;yy1=0;                       %来袭导弹的初坐标
    xx2=1;yy2=0;                       %拦截导弹的初坐标
    x2=1;y2=0;                         %拦截导弹的终坐标的初值
    c='';                              %字符变量置空
    dt=0;                              %时间间隔取0
    for t=T                            %按来袭导弹的时间循环
        x1=t*sin(2*th);                %计算来袭导弹的横坐标
        y1=2*sin(th)^2*(t-t^2);        %计算来袭导弹纵坐标
        plot([xx1,x1],[yy1,y1],'k','LineWidth',2)%画来袭导弹轨迹
        s=sqrt((x2-x1)^2+(y2-y1)^2);   %计算两弹之间的距离
        if s<=0.02|y1<=0&t~=0          %如果两导弹距离很小或对方导弹落地
            plot(x1,y1,'*','MarkerSize',20)%画爆炸射线
            break                      %退出循环
        end                            %结束循环
        xx1=x1;yy1=y1;                 %保存来袭导弹的坐标
        c=get(gcf,'CurrentCharacter'); %从键盘取图形窗口的当前字符
        if length(c)~=0&&c==' '        %如果c中有字符且为空格
            dt=T(2);                   %取时间间隔
        end                            %结束条件
        x2=x2-(x2-x1)/s*2*v2*sin(th)*dt;%拦截导弹的横坐标
        y2=y2-(y2-y1)/s*2*v2*sin(th)*dt;%拦截导弹的纵坐标
        plot([xx2,x2],[yy2,y2],'r','LineWidth',2)%画拦截导弹的轨迹
        xx2=x2;yy2=y2;                 %保存拦截导弹的坐标
        pause(0.05)                    %延时
    end                                %结束循环
    c=input('还玩吗?(y/n)','s');       %提示键盘输入选择
    if c~='y' break,end                %不是y则退出游戏
end                                    %结束循环

