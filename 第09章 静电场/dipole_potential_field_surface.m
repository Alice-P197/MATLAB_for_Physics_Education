%电偶极子的电势和电场强度的分布曲面
clear                                  %清除变量
rm=5;                                  %最大极坐标
r=2:0.1:rm;                            %极坐标向量(绕过原点)
theta=(0:360)*pi/180;                  %极角向量
[TH,R]=meshgrid(theta,r);              %极坐标矩阵
[X,Y]=pol2cart(TH,R);                  %化为直角坐标矩阵
U=2*X./R.^3;                           %电势
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
mesh(X,Y,U)                            %画电势曲面
hold on                                %保持图像
plot3([-1;1],[0;0],[0;0],'-o','LineWidth',2)%画连线
box on                                 %加框
fs=16;                                 %字体大小
title('电偶极子的电势分布面','FontSize',fs)%显示标题
xlabel('\itx/L','FontSize',fs)         %显示x坐标
ylabel('\ity/L','FontSize',fs)         %显示y坐标
zlabel('\itU/U\rm_0','FontSize',fs)    %显示z坐标
txt='\itU\rm_0=\itkp\rm_e/2\itL\rm^2'; %电势单位文本
text(-rm,rm,max(U(:))/2,txt,'FontSize',fs)%显示电势单位

Ex=(2*X.^2-Y.^2)./R.^5;                %场强的X分量
Ey=3*X.*Y./R.^5;                       %场强的Y分量
E=sqrt(Ex.^2+Ey.^2);                   %合场强
A=atan2(Ey,Ex)*180/pi;                 %角度
EC={Ex,Ey,E,A};                        %数据元胞
zc={'\itE_x/E\rm_0','\itE_y/E\rm_0',...
    '\itE/E\rm_0','\it\alpha\rm/\circ'};%高坐标元胞
tc={'\itx\rm分量','\ity\rm分量','总量\itE\rm','方向'};;%标题的一部分
txt='\itE\rm_0=\itkp\rm_e/\itL\rm^3';  %电场强度文本
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:4                              %循环
    subplot(2,2,i)                     %选子图
    surf(X,Y,EC{i})                    %画场强曲面
    box on                             %加框
    shading interp                     %染色
    hold on                            %保持图像
    plot3([-1;1],[0;0],[0;0],'-o','LineWidth',2)%画连线
    title(['电偶极子场强' tc{i}],'FontSize',fs)%显示标题
    xlabel('\itx/L','FontSize',fs)     %显示x坐标
    ylabel('\ity/L','FontSize',fs)     %显示y坐标
    zlabel(zc{i},'FontSize',fs)        %显示z坐标
    text(-rm,rm,max(EC{i}(:)),txt,'FontSize',fs)%标记电场强度文本
end                                    %结束循环
view(-30,60)                           %设置最后图像的视角

