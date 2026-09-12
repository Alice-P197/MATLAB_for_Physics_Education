%振荡偶极子发射的电磁波的电场分量的传播(等值线)
clear                                  %清除变量,
rm=2;                                  %最大距离
r=0.01:0.02:rm;                        %电场的距离向量
th=linspace(0,2*pi,300);               %电场的角度向量
[R,TH]=meshgrid(r,th);                 %距离和角度矩阵
[X,Y]=pol2cart(TH,R);                  %极坐标化为直角坐标
eth=-3:0.3:3;                          %电场强度向量
rh=0.5:0.1:rm;                         %磁场的距离向量
phi=(0:10:350)*pi/180;                 %磁场的角度向量
[RH,PHI]=meshgrid(rh,phi);             %距离和角度矩阵
[XH,YH]=pol2cart(PHI,RH);              %极坐标化为直角坐标
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
fs=16;                                 %字体大小
t=0;                                   %初始时刻
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出循环
    Eth=cos(TH).*cos(2*pi*(t-R))./R;   %计算电场强度
    contour(X,Y,Eth,eth,'r','LineWidth',2)%画等值线
    HPHI=cos(PHI).*cos(2*pi*(t-RH))./RH;%计算磁场强度
    L=HPHI>0;                          %取磁场强度大于零的逻辑值,
    hold on                            %保持属性
    plot(XH(L),YH(L),'x','MarkerSize',9)%正方向的磁场强度画叉
    plot(XH(~L),YH(~L),'.','MarkerSize',12)%负方向的磁场强度画点
    grid on                            %加网格
    axis equal                         %使坐标间隔相等
    xlabel('\itx/\lambda','FontSize',fs)%x标签
    ylabel('\ity/\lambda','FontSize',fs)%y标签
    title('振荡偶极子发射的电磁波的电场分量的传播','FontSize',fs)%标题
    drawnow                            %更新屏幕
    if t==0 pause,end                  %初始时暂停
    t=t+0.02;                           %下一时刻(与周期的比)
    hold off                           %关闭属性保持
end                                    %结束循环

