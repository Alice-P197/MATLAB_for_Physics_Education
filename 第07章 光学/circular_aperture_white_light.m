%白光的圆孔衍射条纹
clear                                  %清除变量
lambda=[400,440,480,540,610,760]*1e-9; %波长
ColorTable=[                           %颜色表
    1  ,0  ,1  ;                       %紫色
    0  ,0  ,1  ;                       %蓝色
    0  ,1  ,1  ;                       %青色
    0  ,1  ,0  ;                       %绿色
    1  ,1  ,0  ;                       %黄色
    1  ,0  ,0  ];                      %红色
z=-0.01:0.0001:0.01;                   %光斑半径与光斑到圆孔距离比向量
[X,Y]=meshgrid(z);                     %坐标矩阵
Z=sqrt(X.^2+Y.^2);                     %半径矩阵
TH=atan(Z);                            %衍射角
TH(TH==0)=eps;                         %零改为小量
a=1e-4;                                %孔的半径
M=0;                                   %各色的强度值取零
l=length(lambda);                      %求波长个数
for j=1:l                              %按波长循环
    Z=a*sin(TH)/lambda(j);             %求中间变量Z表示的矩阵
    I=(2*bessel(1,2*pi*Z)./(2*pi*Z)).^2;%求强度
    M0(:,:,1)=I*ColorTable(j,1);       %红色的强度值
    M0(:,:,2)=I*ColorTable(j,2);       %绿色的强度值
    M0(:,:,3)=I*ColorTable(j,3);       %蓝色的强度值
    M=M+M0;                            %累加各色强度值
end                                    %结束循环
M=M*10;                                %色值放大
M(M>1)=1;                              %大于1者作1处理
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
image(M)                               %画图像
axis equal off                         %等轴和隐轴
title('白光的夫琅禾费圆孔衍射图样','FontSize',16)%标题

