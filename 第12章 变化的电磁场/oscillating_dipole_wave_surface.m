%振荡偶极子发射的电磁波曲面
clear                                  %清除变量
rm=3;                                  %最大距离(与波长的比)
r=0.1:0.1:rm;                          %距离向量
th=linspace(0,2*pi);                   %角度向量
[R,TH]=meshgrid(r,th);                 %距离和角度矩阵
[X,Y]=pol2cart(TH,R);                  %极坐标化为直角坐标
Eth=cos(TH).*cos(2*pi*R)./R;           %电场强度
eth=-3:0.3:3;                          %电场强度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=surf(X,Y,Eth);                       %画曲面并取句柄
shading interp                         %染色
grid on                                %加网格
box on                                 %加框
axis([-rm,rm,-rm,rm,-6,6])             %坐标范围
fs=16;                                 %字体大小
xlabel('\itx/\lambda','FontSize',fs)   %x标签
ylabel('\ity/\lambda','FontSize',fs)   %y标签
zlabel('\itE_\theta/E\rm_0','FontSize',fs)%z标签
title('振荡偶极子发射的电磁波的电场强度曲面','FontSize',fs)%标题
txt='\itE\rm_0=\itk\omega\rm^3\itp\rm_0/(2\pi\itc\rm^3)';%场强单位文本
text(-rm,-rm,5,txt,'FontSize',fs)      %显示单位
pause                                  %暂停
t=0;                                   %初始时刻
hold on                                %保持图像
while 1                                %无限循环
    t=t+0.01;                          %下一时刻(与周期的比)
    Eth=cos(TH).*cos(2*pi*(R-t))./R;   %电场强度
    set(h,'ZData',Eth)                 %设置z坐标
    drawnow                            %更新屏幕
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出
end                                    %结束循环

