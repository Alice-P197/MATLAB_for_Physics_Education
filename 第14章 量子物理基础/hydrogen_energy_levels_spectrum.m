%氢原子的能级,光谱线系和波长
clear                                  %清除变量
e=1.602176462e-19;                     %电子的电量
me=9.10938188e-31;                     %电子的质量
c=2.99792458e8;                        %光速
h=6.62606876e-34;                      %普朗克常数
eps0=8.854187817e-12;                  %真空介电常数
a0=eps0*h^2/pi/me/e^2;                 %玻尔半径
E1=-e*e/2/(4*pi*eps0)/a0;              %基态能量(单位J)
%RH=E1/h/c;                             %里德伯常数
e1=E1/e;                               %基态能量(单位eV)
name={'赖曼','巴尔末','帕邢','布喇开','普芳德'};%线系名称
n=length(name);                        %线系个数
i=1:n+2;                               %能级向量(加2条)
ei=e1./i.^2;                           %能级能量(单位eV)
o=ones(size(i));                       %全1向量
xm=100;                                %图形宽度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0*o;xm*o],[ei;ei],'LineWidth',2) %画水平线
hold on                                %保持图像
plot([0;xm],[0;0],'--','LineWidth',3)  %画能量为0的水平线
i=1:n;                                 %新的能级向量
ei=e1./i.^2;                           %能级能量(单位eV)
o=ones(size(i));                       %全1向量
text(0*o,ei,num2str(i'))               %显示能级量子数
text(xm*o,ei,num2str(ei'))             %显示能级的能量
text(0,0.2,'\infty')                   %在左上角标记无穷大符号
text(xm,0.2,'0')                       %在右上角标记0能量
text(0,floor(e1),'\itn')               %在左下角标记量子符号
text(xm,floor(e1),'\itE_n')            %在右下角标记能级符号
x=i*20-5;                              %极限跃迁线横坐标
Ei=E1./i.^2;                           %低能级能量(单位J)
plot([x;x]-8,[Ei/e;0*o],'k:','LineWidth',2)%画极限跃迁线
lambda=h*c./(-Ei)*1e9;                 %极限波长
text(16*i,-5*o,num2str(lambda'))       %显示极限波长
title('氢原子的能级,光谱线系和波长(nm)','FontSize',16)%标题
e0=ceil(e1)/10;                        %文本间隔
axis off                               %关闭坐标
for i=1:n                              %按低能级循环
    Ei=E1/i/i;                         %低能级能量(单位J)
    j=i+1:n+1;                         %条数向量
    Ej=E1./j.^2;                       %计算高能级能量(单位J)
    x=i*20-5-j;                        %跃迁线的横坐标
    o=ones(size(j));                   %全1向量
    plot([x;x],[Ei*o;Ej]/e,'LineWidth',2)%画跃迁线
    lambda=h*c./(Ej-Ei)*1e9;           %波长(单位nm)
    yy=e1-(j-1)*e0;                    %文本的纵坐标
    xx=16*i;                           %文本的横坐标
    text(xx*o,yy,num2str(lambda'))     %显示波长值
    text(xx,-4,name(i))                %显示线系名称
end                                    %结束循环

