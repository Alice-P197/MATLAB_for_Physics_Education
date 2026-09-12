%麦克斯韦速率分布律
clear                                  %清除变量
f=inline('4*pi*(m/2/pi/1.38E-23./T).^1.5.*v.^2.*exp(-m.*v.^2/2/1.38E-23./T)',...
    'v','T','m');                      %内线函数
k=1.38E-23;                            %玻尔兹曼常数
u=1.66E-27;                            %原子质量单位
m=32*u;                                %氧分子质量
t=(3:6)*100;                           %热力学温度向量
l=length(t);                           %向量长度
v=0:20:1600;                           %速率向量
[T,V]=meshgrid(t,v);                   %温度和速率矩阵
F=f(V,T,m);                            %速率分布函数矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(v,F)                              %画曲线族
plot(v,F(:,1),v,F(:,2),'--',v,F(:,3),'-.',v,F(:,4),':',...
    'LineWidth',2)                     %画曲线族
grid on                                %加网格
h=legend([repmat('\itT\rm=',l,1),num2str(t'),repmat('K',l,1)]);%图例取句柄
fs=16;                                 %字体大小
set(h,'FontSize',fs)                   %放大图例
title('温度不同的麦克斯韦速率分布曲线的比较','FontSize',fs)%标题
xlabel('速率\itv\rm/m\cdots^-^1','FontSize',fs)%横坐标
ylabel('速率分布函数\itf\rm(\itv\rm)/s\cdotm^-^1','FontSize',fs)%纵坐标
text(0,max(F(:)),'氧气O_2:32u','FontSize',fs)%显示文本
vp=sqrt(2*k*t/m);                      %最概然速率向量
fp=f(vp,t,m);                          %峰值函数
hold on                                %保持图像
stem(vp,fp,'--','filled')              %画直杆图
text(vp,fp,num2str(vp',4),'FontSize',fs)%显示最概然速率
t=250:1000;                            %温度向量
vp=sqrt(2*k*t/m);                      %最概然速率向量
fp=f(vp,t,m);                          %峰值函数
plot(vp,fp,'LineWidth',2)              %画峰值曲线

m=[2,4,20,28,32,38]*u;                 %分子量向量
l=length(m);                           %向量长度
n='氢氦氖氮氧氟';                      %气体分子名
t=300;                                 %热力学温度
[M,V]=meshgrid(m,v);                   %质量和速率矩阵
F=f(V,t,M);                            %速率分布函数矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(v,F,'LineWidth',2)                %画曲线族
plot(v,F(:,1),'o-',v,F(:,2),'d-',v,F(:,3),'s-',v,F(:,4),'p-',...
    v,F(:,5),'h-',v,F(:,6),'<-')       %画曲线族
grid on                                %加网格
h=legend([n',repmat('气:',l,1),num2str(m'/u)]);%图例取句柄
set(h,'FontSize',fs)                   %放大图例
title('分子质量不同的麦克斯韦速率分布曲线的比较','FontSize',fs)%标题
xlabel('速率\itv\rm/m\cdots^-^1','FontSize',fs)%横坐标
ylabel('速率分布函数\itf\rm(\itv\rm)/s\cdotm^-^1','FontSize',fs)%纵坐标
vp=sqrt(2*k*t./m);                     %最概然速率向量
fp=f(vp,t,m);                          %峰值函数
hold on                                %保持图像
stem(vp,fp,'--','filled')              %画直杆图
text(vp,fp,num2str(vp',4),'FontSize',fs)%显示最概然速率
m=(2:45)*u;                            %质量向量
vp=sqrt(2*k*t./m);                     %最概然速率向量
fp=f(vp,t,m);                          %峰值函数
plot(vp,fp,'--','LineWidth',2)         %画峰值曲线
text(0,max(F(:)),['\itT\rm = ',num2str(t),'K'],'FontSize',fs)%显示文本

