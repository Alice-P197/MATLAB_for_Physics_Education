%伽尔顿板的动画
clear                                  %清除变量
%rand('state',0)                        %随机状态清零(可重复相同的演示)
m=9;                                   %层数
f=zeros(1,m);                          %各层元素清零
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
axis off                               %隐去坐标
mw=6;                                  %挡板高度
axis([-m,m,-m-mw,1])                   %图形范围
title('伽尔顿板','FontSize',16)        %标题
for i=1:m                              %按层循环
%     for j=1:i                          %按列循环
%         plot(2*j-i-1,-i+1,'.','MarkerSize',16)%画点
%     end                                %结束循环
    plot(2*(1:i)-i-1,ones(1,i)*(-i+1),'.','MarkerSize',16)%画点(可代替内循环)
end                                    %结束循环
x=-m:2:m;                              %隔板横坐标
w=8;                                   %一层粒子个数
s=0;                                   %粒子数清零
plot([x;x],[-m;-(m+mw)]*ones(size(x)),'k','LineWidth',5)%画隔板
plot([-m,m],[-m-mw,-m-mw],'k','LineWidth',5)%画底板
h=plot(0,0,'r-','LineWidth',2);        %画点取句柄
ht=text(-m,0,'粒子数:0','FontSize',16);%粒子数句柄
pause                                  %暂停
yy=1:-1:-m+1;                          %各层编号(纵坐标)
%while 1                                %无限循环
%    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出
while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    xx=[0,0];                          %粒子初始横坐标
    x=rand;                            %取一个随机数
    s=s+1;                             %粒子数加1
    j=1;                               %第一个槽号(列标)
    for i=2:m                          %按层循环
        x=2*x;                         %随机数乘以2
        xi=floor(x);                   %取整数
        j=j+xi;                        %取通道
        xx=[xx,2*j-i-1];               %连接横坐标
        x=x-xi;                        %取小数部分
    end                                %结束循环
    f(j)=f(j)+1;                       %最后一层槽中粒子数加1
    t=f(j);                            %取粒子数
    iy=floor((t-1)/w);                 %计算粒子叠放的层数
    ix=t-w*iy;                         %计算粒子叠放的列数
    x=2*j-m-1.9+ix*0.2;                %粒子叠放的横坐标
    y=-m-mw+iy*0.2+0.3;                %粒子叠放的纵坐标
    plot(x,y,'r.','MarkerSize',16)     %画粒子
    set(h,'XData',[xx,x],'YData',[yy,y]);%设置坐标显示轨迹
    set(ht,'String',['粒子数:',num2str(s)])%显示粒子数
    drawnow                            %刷新屏幕
    pause(0.1)                         %延时
end                                    %结束循环
x=2*(1:m)-m-2;                         %数据横坐标向量
y=ones(size(x));                       %纵坐标向量
text(x,-10*y,num2str(f'),'FontSize',16)%显示粒子数
text(x,-12*y,num2str(f'/s*100,3),'FontSize',12)%显示百分比
n=1:m-1;                               %整数向量
p=[1,cumprod(fliplr(n))./cumprod(n)]/2^(m-1)*100;%二项式分布的概率
%n=0:m-1;                               %整数向量
%c=factorial(m-1)./factorial(n)./factorial(m-1-n)/2^(m-1)*100;%同上
text(x,-14*y,num2str(p',3),'FontSize',12)%显示概率

