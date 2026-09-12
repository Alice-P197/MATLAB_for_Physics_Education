%温度不同的普朗克黑体单色辐射能力与波长的曲线
clear                                  %清除变量
k=1.38054e-23;                         %玻尔兹曼常数
h=6.626e-34;                           %普朗克常数
c=2.997925e8;                          %光速
syms x                                 %定义符号变量
y=x^3/(exp(x)-1);                      %被积函数
i=int(y,0,inf)                         %求积分
sigma=double(2*pi*k^4/h^3/c^2*i)       %求斯特藩常数
y=x^5/(exp(x)-1);                      %普朗克约化公式
d=diff(y)                              %求符号导数
s=solve(d)                             %求符号零解
e=double(s)                            %求零解的数值
b=h*c/e/k                              %求维恩常数

t=1400:200:2000;                       %热力学温度向量
n=length(t);                           %向量长度
lambda=[0:0.01:5]*1e-6;                %波长向量(单位由微米化为米)
lambda(1)=eps;                         %给零加一小量使分母不为零
[T,L]=meshgrid(t,lambda);              %波长和温度矩阵
M=2*pi*h*c^2./(exp(h*c./(k*T.*L))-1)./L.^5;%单色辐射能力
l=lambda*1e6;                          %取微米为单位
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(lambda*1e6,M,'LineWidth',2)       %画曲线族(波长的单位为微米)
plot(l,M(:,1),l,M(:,2),'--',l,M(:,3),'-.',l,M(:,4),':','LineWidth',3)%画曲线族(波长的单位为微米)
hl=legend([repmat('\itT\rm=',n,1),num2str(t'),repmat('K',n,1)]);%标记图例
fs=16;                                 %字体大小
set(hl,'FontSize',fs)                  %设置图例大小
grid on                                %加网格
title('普朗克黑体单色辐射能力与波长的关系','FontSize',fs)%标题
xlabel('波长\it\lambda\rm/\mum','FontSize',fs)%横坐标
yl='单色辐射能力\itM\rm(\it\lambda\rm,\itT\rm)/(W\cdotm^-^3)';%纵坐标字符串
ylabel(yl,'FontSize',fs)               %纵坐标
txt=['\itb\rm=',num2str(b),'m\cdotK']; %维恩常数文本
txt=[txt,',\it\sigma\rm=',num2str(sigma),'W/(m^2\cdotK^4)'];%斯特藩常数文本
text(0,max(M(:))/10,txt,'FontSize',fs) %显示常数
[mx,ix]=max(M);                        %找各条曲线的最大值和下标
lm=lambda(ix)*1e6;                     %各条曲线的峰值波长(单位微米)
hold on                                %保持图像
stem(lm,mx,'--','filled')              %画直杆图
text(lm,mx,num2str(lm'),'FontSize',fs) %显示峰值波长
t=1300:2020;                           %较密的温度向量
lm=b./t;                               %峰值波长向量(单位米)
m=2*pi*h*c^2./(exp(h*c./(k*t.*lm))-1)./lm.^5;%单色辐射能力向量
plot(lm*1e6,m,'.')                     %画峰值曲线

