%平抛小球在地面上跳跃的轨迹
clear                                  %清除变量
vx=input('请输入水平速率与平抛落地速率之比:');%键盘输入速率比
%vx=0.1;                                %参考值
k=input('请输入反弹系数(<1):');        %键盘输入反弹系数
%k=0.9;                                 %参考值
%k=0.8;                                 %参考值
if k>=1 return,end                     %如果速率比大于1则返回
tm=(1+k)/(1-k);                        %运动时间
xm=2*vx*tm;                            %最远距离
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0,xm],[0,0],'LineWidth',3)       %画地平线
grid on                                %加网格
axis equal                             %使坐标间隔相等
axis([0,xm,0,1])                       %坐标范围
fs=16;                                 %字体大小
title('平抛小球在地面上跳跃的轨迹','FontSize',fs)%标题
xlabel('水平距离\itx/h','FontSize',fs) %横坐标标签
ylabel('竖直高度\ity/h','FontSize',fs) %纵坐标标签
txt=['速率比\itv_x/v\rm_0:',num2str(vx)];%水平速率与平抛落地速率比文本
txt=[txt ',反弹系数:',num2str(k)];     %反弹系数文本
text(0,0.5,txt,'FontSize',fs)          %显示速率比文本
txt=['\itT\rm=',num2str((1+k)/(1-k)),'(2\ith/g\rm)^{1/2}'];%运动时间字符串
txt=[txt ',\itX\rm=',num2str(xm),'\ith'];%连接运动距离
text(xm/4,0.8,txt,'FontSize',fs)       %显示运动时间
dt=0.001;                              %时间间隔
tm=1;                                  %平抛时间
t=0:dt:tm;                             %平抛的时间向量
x=2*vx*t;                              %平抛的横坐标
y=1-t.^2;                              %平抛的纵坐标
i=0;                                   %斜抛次数清零
hold on                                %保持图像
while tm>0.01                          %斜抛时间较大则循环
    comet(x,y)                         %画彗星式轨迹
    plot(x,y,'LineWidth',2)            %补画轨迹
    i=i+1;                             %斜抛次数
    tm=2*k.^i;                         %斜抛运动时间
    t=0:0.001:tm;                      %时间向量
    x=x(end)+2*vx*t;                   %横坐标
    y=2*k^i*t-t.^2;                    %纵坐标
end                                    %结束循环

