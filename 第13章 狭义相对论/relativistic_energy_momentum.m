%相对论能量和动量的关系曲线
clear                                  %清除变量
v=0:0.01:1;                            %质点的速度向量
v(end)=1-eps;                          %最后一个速度接近光速
e=1./sqrt(1-v.^2);                     %能量与速度的关系
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(v,e,'LineWidth',2)                %画能量与速度关系曲线
axis([0,1,0,5])                        %坐标范围
fs=16;                                 %字体大小
title('相对论能量与速度的关系曲线','FontSize',fs)%标题
xlabel('\itv/c','FontSize',fs)         %横坐标
ylabel('\itE/m\rm_0\itc\rm^2','FontSize',fs)%纵坐标
grid on                                %加网格
text(0,0.5,'\itc\rm为光速,\itm\rm_0为静止质量','FontSize',fs)%显示光速和质量
%text(0,0.5,'\itm\rm_0为静止质量')      %时间文本

p=0:0.01:5;                            %动量向量
e=sqrt(p.^2+1);                        %能量与动量的关系
subplot(2,1,2)                         %选子图
plot(p,e,p,p,'--','LineWidth',2)       %画曲线
title('相对论能量与动量的关系曲线','FontSize',fs)%标题
xlabel('\itp/m\rm_0\itc\rm或\itp','FontSize',fs)%横坐标
ylabel('\itE/m\rm_0\itc\rm^2或\itE/c','FontSize',fs)%纵坐标
legend('\itm\rm_0\neq0','\itm\rm_0=0',2)%加图例
grid on                                %加网格

