%洛伦兹速度变换后的质速关系曲面
clear                                  %清除变量
um=0.9;                                %最大速度
u=-um:0.1:um;                          %参考系S'相对S的速度向量u/c
v=-um:0.1:um;                          %质点在S系中的速度v/c
[V,U]=meshgrid(v,u);                   %速度向量化为矩阵
VV=(V-U)./(1-U.*V);                    %S'系中的速度v'/c
M=1./sqrt(1-VV.^2);                    %S'系中的质量
%M=(1-U.*V)./sqrt((1-V.^2).*(1-U.^2));  %同上
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(v,u,M)                            %画质速关系曲面
box on                                 %加框架
fs=16;                                 %字体大小
title('洛伦兹速度变换后的质速关系','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itu/c','FontSize',fs)         %纵坐标
zlabel('\itm/m\rm_0','FontSize',fs)    %高坐标

