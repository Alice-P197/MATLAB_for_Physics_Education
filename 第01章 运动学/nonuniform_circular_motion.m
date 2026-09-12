%质点的变速圆周运动
clc;clear;close all;                                  %清除变量
r=0.5;                                 %圆周运动的半径
%t=0:0.01:2;                            %时间向量
t=0:0.001:2;                           %时间向量
th=3+2*t.^2;                           %角度
w=4*t;                                 %角速度
an=r*w.^2;                             %法向线速度
alpha=4;                               %角加速度
at=r*alpha;                            %切向加速度
a=sqrt(an.^2+at.^2);                   %总加速度
phi=atan(an./at)*180/pi;               %总加速度的方向与切向加速度的夹角
f=[{at*ones(size(t))},{an},{a},{phi}]; %加速度等元胞
%f={at*ones(size(t)),an,a,phi};         %加速度等元胞
% tit=[{'切向加速度'},{'法向加速度'},{'质点的总加速度'},...
%      {'总加速度与切向加速度的夹角'}];  %标题元胞
tit{1}='切向加速度';
tit{2}='法向加速度';
tit{3}='质点的总加速度';
tit{4}='总加速度与切向加速度的夹角';   %标题元胞
ylbl=[{'a\rm_t/m\cdots^-^2'},{'a\rm_n/m\cdots^-^2'},...
      {'a\rm/m\cdots^-^2'},{'\phi\rm/\circ'}];%y标签元胞
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:4                              %按子图循环
    subplot(2,2,i)                     %选子图
    plot(t,f{i},'LineWidth',2)         %画曲线
    grid on                            %加网格
    title(tit{i},'FontSize',16)        %标题
    xlabel('\itt\rm/s','FontSize',16)  %横坐标标签
    ylabel(['\it' ylbl{i}],'FontSize',16)%纵坐标标签
end                                    %结束循环
ann=at*sqrt(3);                        %切向加速度为总加速度一半时的法向加速度
[z0,i]=min(abs(ann-an));               %求最小值所在下标
tm=t(i);                               %求时间
thm=3+2*t(i)^2;                        %求角度
subplot(2,2,3)                         %再取第3子图
hold on                                %保持图像
plot([1,1]*tm,[0,1]*2*at,'--')         %画虚线
text(tm,0,['\itt\rm=' num2str(tm)],'FontSize',16)%标记时间
text(0,max(an),['\it\theta\rm=' num2str(thm)],'FontSize',16)%标记角度
return
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,2,1)                         %选子图
plot(t,at)                             %画切向加速度曲线
grid on                                %加网格
title('切向加速度')                    %标题
ylabel('\ita_t\rm/m\cdots^-^2')        %纵坐标
subplot(2,2,2)                         %选子图
plot(t,an)                             %画法向加速度曲线
grid on                                %加网格
title('法向加速度')                    %标题
ylabel('\ita_n\rm/m\cdots^-^2')        %纵坐标
subplot(2,2,3)                         %选子图
plot(t,a)                              %画总加速度曲线
grid on                                %加网格
title('质点的总加速度')                %标题
xlabel('\itt\rm/s')                    %横坐标
ylabel('\ita\rm/m\cdots^-^2')          %纵坐标
subplot(2,2,4)                         %选子图
plot(t,phi)                             %画角度曲线
grid on                                %加网格
title('总加速度与切向加速度的夹角')    %标题
xlabel('\itt\rm/s')                    %横坐标
ylabel('\it\theta\rm/\circ')           %纵坐标

