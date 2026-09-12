%互相垂直的同频率的简谐振动的合成
clear                                  %清除变量
a2=1.5;                                %y振幅(A1的倍数)
th=(0:0.001:1)*2*pi;                   %角度向量
dphi=(0:45:360+45)*pi/180;             %相差向量
tit={'\Delta\it\phi\rm=\it\phi\rm_2-\it\phi\rm_1=0','\pi/4','\pi/2',...
     '3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi','9\pi/4'};%标题元胞
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:length(dphi)                   %按相差循环
    x=cos(th);                      %计算横坐标
    y=a2*cos(th+dphi(i));              %计算纵坐标
    subplot(2,5,i)                     %选择子图
    pause                              %暂停
    comet(x,y)                         %画质点运动的动画轨迹
    plot(x(1),y(1),'o',x,y,'r')        %画起点和位移曲线
    axis equal off                     %使坐标间隔相等并隐轴
    hold on                            %保持图像
    plot([1;-1;-1;1;1],[a2;a2;-a2;-a2;a2],'--','LineWidth',2)%画虚线方框
    title(tit{i},'FontSize',16)        %加标题
end                                    %结束循环

