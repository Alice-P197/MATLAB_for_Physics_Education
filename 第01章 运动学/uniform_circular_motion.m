%质点的匀速圆周运动
clear                                  %清除变量
r=0.3;                                 %半径
x=-r:0.01:r;                           %x坐标
y=sqrt(r^2-x.^2);                      %y坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体

text(0,0,'按回车键显示质点运动方向!','FontSize',16)%显示提示
pause                                  %暂停
tm=6;                                  %质点的运动时间
t=0:0.001:tm;                          %时间向量
w=2;                                   %系数
x=r*sin(w*t);                          %x坐标
y=r*cos(w*t);                          %y坐标
hold on                                %保持图像


for i = 1:length(t)
plot(x,[y;-y],'LineWidth',2)           %画圆
grid on                                %加网格
axis equal                             %使坐标间隔相等
title('轨迹','FontSize',16)            %标题
xlabel('\itx\rm/m','FontSize',16)      %横坐标标签
ylabel('\ity\rm/m','FontSize',16)      %纵坐标标签
plot(x(i), y(i), 'bo', 'MarkerSize', 20, ...
         'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
pause(0.1)
if i<length(t)
cla
end
end

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(t,x,'--',t,y,'-.',t,sqrt(x.^2+y.^2),'LineWidth',2)%画曲线
grid on                                %加网格
title('位矢','FontSize',16)            %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
legend('水平坐标','竖直坐标','位矢大小',4)%图例
alpha=atan2(y,x)*180/pi;               %与x正方向的夹角
%alpha=atan(y./x)*180/pi;               %与x正方向的夹角(不对)
subplot(2,1,2)                         %选子图
plot(t,alpha,'LineWidth',2)            %画角度曲线
grid on                                %加网格
title('位矢方向','FontSize',16)        %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\it\alpha\rm/\circ','FontSize',16)%纵坐标标签
vx=w*r*cos(w*t);                       %x速度
vy=-w*r*sin(w*t);                      %y速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,2,1)                         %选子图
plot(t,vx,'LineWidth',2)               %画x速度曲线
grid on                                %加网格
title('速度的\itx\rm分量','FontSize',16)%标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\itv_x\rm/m\cdots^-^1','FontSize',16)%纵坐标标签
subplot(2,2,2)                         %选子图
plot(t,vy,'LineWidth',2)               %画y速度曲线
grid on                                %加网格
title('速度的\ity\rm分量','FontSize',16)%标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\itv_y\rm/m\cdots^-^1','FontSize',16)%纵坐标标签
subplot(2,2,3)                         %选子图
plot([0;tm],[1;1]*w*r,'LineWidth',2)   %画合速度曲线
%v=sqrt(vx.^2+vy.^2);                   %合速度
%plot(t,v,'LineWidth',3)                %画合速度曲线(同上,但是轴指令和标题指令会有警告)
grid on                                %加网格
title('总速度','FontSize',16)          %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\itv\rm/m\cdots^-^1','FontSize',16)%纵坐标标签
theta=atan2(vy,vx)*180/pi;             %与x正方向的夹角
%theta=atan(vy./vx)*180/pi;             %与x正方向的夹角(不对)
subplot(2,2,4)                         %选子图
plot(t,theta,'LineWidth',2)            %画角度曲线
grid on                                %加网格
title('总速度方向','FontSize',16)      %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标标签
ylabel('\it\theta\rm/\circ','FontSize',16)%纵坐标标签
ax=-w^2*r*sin(w*t);                    %x加速度
ay=-w^2*r*cos(w*t);                    %y加速度
a=sqrt(vx.^2+vy.^2);                   %合加速度
phi=atan2(ay,ax)*180/pi;               %与x正方向的夹角
%phi=atan(ay./ax)*180/pi;               %与x正方向的夹角(不对)
A={ax,ay,a,phi};                       %加速度元胞
tit={'加速度的\itx\rm分量','加速度的\ity\rm分量',...
    '总加速度','总加速度方向'};        %标题元胞
ylab={'\ita_x\rm/m\cdots^-^2','\ita_y\rm/m\cdots^-^2',...
    '\ita\rm/m\cdots^-^2','\it\phi\rm/\circ'};%y标签元胞
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:4                              %按子图循环
    subplot(2,2,i)                     %选子图
    plot(t,A{i},'LineWidth',2)         %画曲线
    grid on                            %加网格
    title(tit{i},'FontSize',16)        %标题
    xlabel('\itt\rm/s','FontSize',16)  %横坐标标签
    ylabel(ylab{i},'FontSize',16)      %纵坐标标签
end                                    %结束循环
return
%用顺序结构
subplot(2,2,1)                         %选子图
plot(t,ax)                             %画x加速度曲线
grid on                                %加网格
title('加速度的\itx\rm分量','FontSize',16)%标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标
ylabel('\ita_x\rm/m\cdots^-^2','FontSize',16)%纵坐标
subplot(2,2,2)                         %选子图
plot(t,vy)                             %画y加速度曲线
grid on                                %加网格
title('加速度的\ity\rm分量','FontSize',16)%标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标
ylabel('\ita_y\rm/m\cdots^-^2','FontSize',16)%纵坐标
subplot(2,2,3)                         %选子图
%plot(t,v,'LineWidth',3)                %画合加速度曲线
plot([0;tm],[1;1]*w^2*r,'LineWidth',3) %画合加速度曲线
grid on                                %加网格
title('总加速度','FontSize',16)        %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标
ylabel('\ita\rm/m\cdots^-^2','FontSize',16)%纵坐标
subplot(2,2,4)                         %选子图
plot(t,theta)                          %画角度曲线
grid on                                %加网格
title('总加速度方向','FontSize',16)    %标题
xlabel('\itt\rm/s','FontSize',16)      %横坐标
ylabel('\it\theta\rm\circ','FontSize',16)%纵坐标

