%玻尔兹曼分布率之重力场中气体分子按高度分布概率
clear                                  %清除变量
g=9.8;                                 %重力加速度
k=1.38e-23;                            %玻尔兹曼常数
m0=1.66e-27;                           %原子质量单位
m=[20,28,32];                          %分子量向量
name='氖氮氧';                         %气体分子名
len=length(m);                         %质量向量长度
t=300;                                 %热力学温度
zm=40000;                              %最大高度
z=0:10:zm;                             %高度向量
x=rand(size(z));                       %在每个高度随机选取横坐标
n0=rand(size(z));                      %随机概率
fs=16;                                 %字体大小
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:len                            %按分子循环
    n=exp(-m(i)*m0*g*z/k/t);           %分子数密度
    l=n0<n;                            %在分子数密度范围内为逻辑真(随机筛选法)
    subplot(1,len,i)                   %选子图
    plot(x(l),z(l),'.')                %画点
    grid on                            %加网格
    xlabel([name(i),'气'],'FontSize',fs)%横坐标
end                                    %结束循环
subplot(1,len,1)                       %选子图
ylabel('高度\itz\rm/m','FontSize',fs)  %加纵坐标
tit='重力场中气体分子按高度分布';       %标题字符串
subplot(1,len,2)                       %选子图
title([tit,'(气体温度:',num2str(t),'K)'],'FontSize',fs)%加标题

