%球面波的传播(曲面)
clear                                  %清除变量
k=0.8;                                 %半径与波长之比的2pi倍(半径与波数的乘积)
rm=20;                                 %最大距离(与半径的比)
r=1:rm;                                %距离向量
th=linspace(0,2*pi,30);                %角度向量
[R,TH]=meshgrid(r,th);                 %距离和角度矩阵
[X,Y]=pol2cart(TH,R);                  %极坐标化为直角坐标
U=cos(-k*R+k)./R;                      %初始位移
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=surf(X,Y,U);                         %画曲面并取句柄
axis([-rm,rm,-rm,rm,-1,1])             %坐标范围
%grid on                                %加网格
box on                                 %加框
fs=16;                                 %字体大小
title('球面波传播的曲面','FontSize',fs)%标题
xlabel('\itx/r\rm_0','FontSize',fs)    %x标签
ylabel('\ity/r\rm_0','FontSize',fs)    %y标签
zlabel('\itu\rm/(\itA/r\rm_0)','FontSize',fs)%z标签
pause                                  %暂停
hold on                                %保持图像
wt=0;                                  %初始时刻的相位
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27),break,end%按ESC键退出循环
    wt=wt+0.1;                        %下一时刻的时间相位
    U=cos(wt-k*R+k)./R;                %曲面的位移
    set(h,'ZData',U)                   %设置位移
    drawnow                            %更新屏幕
end                                    %结束循环

