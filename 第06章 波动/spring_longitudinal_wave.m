%弹簧纵波的形成
clear                                  %清除变量
x1=-0.1;                               %左边界
x2=2.1;                                %右边界
y1=-1.5;                               %下边界
y2=2;                                  %上边界
n=2*360/15;                            %环的个数和竖线条数
x0=(0:n-1)*2/n;                        %环和线的横坐标
th=linspace(0,2*pi);                   %角度向量
a=0.02;                                %椭圆横轴(短轴)
b=0.2;                                 %椭圆纵轴(长轴)
y0=1.25;                               %椭圆中心的纵坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([x1;x2],[y0;y0],'-.','LineWidth',2)%画椭圆的中心轴
grid on                                %加网格
axis([x1,x2,y1,y2])                    %坐标范围
fs=16;                                 %字体大小
title('弹簧纵波的形成','FontSize',fs)  %标题
xlabel('\itx\rm/\it\lambda','FontSize',fs)%x标签
ylabel('\itu\rm/\it\lambda','FontSize',fs)%y标签   
[X0,TH]=meshgrid(x0,th);               %中心和角度矩阵
hold on                                %保持图像
%hc=plot(X0+a*cos(TH),y0+b*sin(TH));    %画椭圆并取句柄
hc=plot(X0+a*cos(TH),y0+b*sin(TH),'LineWidth',2);%画椭圆并取句柄
y=ones(1,length(x0));                  %全1向量
%hl=plot([x0;x0],[y;-y]);               %画竖线并取句柄(表示位移)
hl=plot([x0;x0],[1.5*y;1.7*y],'LineWidth',2);%画竖线并取句柄(其位置表示位移)
plot([x0;x0],[1.7*y;2*y],'LineWidth',2)%画参考竖线
%plot([x0;x0],[-y;-1.5*y])              %画参考竖线
u=zeros(1,n);                          %位移为零
h=plot(x0,u,'LineWidth',2.5,'EraseMode','xor');%波的句柄
%h=plot(x0,u,'LineWidth',2.5);          %波的句柄
A=0.2;                                 %振幅
text(0,2*A,['\itA\rm=',num2str(A),'\it\lambda'],'FontSize',fs)%显示振幅
i=1;                                   %起点
pause                                  %暂停 
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27),break,end%按ESC键退出循环
    if i>n                             %如果波传播到最右边
        u=[u(end),u(1:end-1)];         %最后一个元素移到第一个
    else                               %否则
        u=[A*sin(2*pi*x0(i)),u(1:end-1)];%插入第一个元素,其他后移
    end                                %结束条件
    set(h,'YData',u)                   %设置位移
    for j=1:n                          %按椭圆循环
		x=x0(j)+A*u(j);                %椭圆中心横坐标
		set(hl(j),'XData',[x;x])       %设置竖线
        set(hc(j),'XData',x+a*cos(th),'YData',y0+b*sin(th))%设置椭圆
    end                                %结束循环
    drawnow                            %更新窗口
    pause(0.1)                         %延时(可省)
    i=i+1;                             %下一个点
end                                    %结束循环

