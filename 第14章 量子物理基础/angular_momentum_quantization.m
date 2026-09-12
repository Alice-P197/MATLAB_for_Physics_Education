%角动量空间量子化的模型
clear                                  %清除变量
l=input('请输入角量子数:');            %键盘输入角量子数
L=sqrt(l*(l+1));                       %计算轨道角动量
z=ceil(L);                             %取整数
a=(-90:90)*pi/180;                     %半圆的角度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(L*cos(a),L*sin(a),'LineWidth',2)  %画轨道角动量半圆
grid on                                %加网格
axis equal                             %使纵横轴相等
axis([0,z,-z,z])                       %设置坐标范围
hold on                                %保持图像
plot([0;0],[-z;z],[0;z],[0;0])         %画纵轴和横轴
m=-l:l;                                %轨道磁量子数向量(纵坐标)
x=sqrt(L^2-m.^2);                      %轨道角动量矢量的横坐标
x0=zeros(size(x));                     %各条直线的原点横坐标
quiver(x0,x0,x,m,0,'LineWidth',2)      %画轨道角动量矢量
% plot([x0;x],[x0;m],'LineWidth',2)      %画轨道角动量矢量
plot([x0;x],[m;m],'--')                %画横虚线
fs=16;                                 %字体大小
title('角动量空间量子化的矢量模型','FontSize',fs)%标题
xlabel('\itL_r\rm/(\ith\rm/2\pi)','FontSize',fs)%x标签
ylabel('\itL_z\rm/(\ith\rm/2\pi)','FontSize',fs)%y标签
text(0,L,['轨道角量子数\itl\rm=',num2str(l)],'FontSize',fs)%显示轨道角量子数
txt=['轨道角动量\itL\rm=',num2str(L),'\ith\rm/2\pi'];%轨道角动量大小的文本
text(0,-L,txt,'FontSize',fs)           %显示轨道角动量
theta=atan2(x,m)*180/pi;               %求角度向量
text(x,m,[num2str(theta',4),repmat('\circ',2*l+1,1)],'FontSize',fs)%显示角度

