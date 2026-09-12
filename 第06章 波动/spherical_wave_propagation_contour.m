%球面波的传播(等值线)
clear                                  %清除变量
k=0.8;                                 %半径与波长之比的2pi倍(半径与波数的乘积)
rm=20;                                 %最大距离(与半径的比)
r=1:0.1:rm;                            %距离向量
th=linspace(0,2*pi,50);                %角度向量
[R,TH]=meshgrid(r,th);                 %距离和角度矩阵
[X,Y]=pol2cart(TH,R);                  %极坐标化为直角坐标
u=-1:0.05:1;                           %位移向量
fs=16;                                 %字体大小
wt=0;                                  %初始时刻相位
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
while 1                                %无限循环
    U=cos(wt-k*R+k)./R;                %位移
    contour(X,Y,U,u,'LineWidth',2)     %重画等值线
    grid on                            %加网格
    axis equal                         %使坐标间隔相等
    xlabel('\itx/r\rm_0','FontSize',fs)%x标签
    ylabel('\ity/r\rm_0','FontSize',fs)%y标签
    title('球面波的传播','FontSize',fs) %标题
    drawnow                            %更新屏幕
    if wt==0 pause,end                 %初始时暂停
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
    wt=wt+0.1;                         %下一时刻的时间相位
end                                    %结束循环

