%势垒和隧道效应
clear                                  %清除变量
e=input('请输入粒子能量(E/V0):');      %键盘输入能量比
%e=1.2;                                 %粒子能量与势垒高度的比(粒子能量大于势垒高度)
%e=0.8;                                 %粒子能量与势垒高度的比(粒子能量小于势垒高度)
%e=1;                                   %粒子能量与势垒高度的比(粒子能量等于势垒高度)
if e==1 e=1-eps;end                    %1改小一点
k0=5;                                  %势垒常数
%k0=10;                                  %参数
a1=0.2;                                %入射波振幅或缩小系数
th=acosh(sqrt(e));                     %能量角
k1=k0*cosh(th);                        %I和III区的约化波矢(k1与a的乘积)
k2=k0*sinh(th);                        %II区的约化波矢(k2与a的乘积)
xm1=-4;                                %左边界(以a为单位)
x1=xm1:0.01:0;                         %左区域坐标向量
x2=0:0.01:1;                           %阱垒的坐标向量(以a为单位)
xm3=5;                                 %右边界(以a为单位)
x3=1:0.01:xm3;                         %右区域坐标向量
psi11=a1*exp(i*k1*x1);                 %零时刻的入射波
d=2*k1*k2*cos(k2)-i*(k1^2+k2^2)*sin(k2);%分母
a2=-i*(k1^2-k2^2)*sin(k2)*a1/d;        %反射波的振幅
psi12=a2*exp(-i*k1*x1);                %零时刻的反射波
b1=((k2+k1)*a1+(k2-k1)*a2)/2/k2;       %势垒入射波振幅
psi21=b1*exp(i*k2*x2);                 %势垒入射波
b2=((k2-k1)*a1+(k2+k1)*a2)/2/k2;       %势垒反射波振幅
psi22=b2*exp(-i*k2*x2);                %零时刻的势垒反射波
c1=2*k1*k2*exp(-i*k1)*a1/d;            %透射波振幅
psi31=c1*exp(i*k1*x3);                 %零时刻的透射波
y0=0.5;                                %中线高度
fs=16;                                 %字体大小
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h1=plot(x1,real(psi11+psi12)+y0,'LineWidth',2);%画I区的波(取实部)
hold on                                %保持图像
h11=plot(x1,real(psi11)+y0,'g--','LineWidth',2);%画I区的入射波(取实部)
h12=plot(x1,real(psi12+y0),'r-.','LineWidth',2);%画I区的反射波(取实部)
legend('合成波','入射波','反射波')     %图例
h2=plot(x2,real(psi21+psi22)+y0,'LineWidth',2);%画势垒II区的波
h21=plot(x2,real(psi21)+y0,'g--','LineWidth',2);%画势垒II区的入射波
h22=plot(x2,real(psi22)+y0,'r-.','LineWidth',2);%画势垒II区的反射波
h31=plot(x3,real(psi31)+y0,'LineWidth',2);%画III区的波
xx0=[xm1;0;0;1;1;xm3];                 %势垒的横坐标
yy0=[0  ;0;1;1;0;0  ];                 %势垒的纵坐标
plot(xx0,yy0,'k','LineWidth',2)        %画势垒
plot([xm1,xm3],[y0,y0],'-.')           %画中线
title('势垒和隧道效应','FontSize',fs)   %波函数标题
xlabel('\itx\rm/\ita','FontSize',fs)   %x标签   
ylabel('\it\psi','FontSize',fs)        %y标签
set(gca,'fontname','宋体','fontsize',fs)
axis off                               %隐轴
axis([xm1,xm3,0,1])                    %曲线范围
text(0,0,'0','FontSize',fs)            %显示原点文本
text(1,0,'\ita','FontSize',fs)         %显示势垒宽度文本
text(1,1,'\itV\rm_0','FontSize',fs)    %显示势垒高度文本
txt=['\itk\rm_0=',num2str(k0)];        %参数文本
txt=[txt ',\itE/\itV\rm_0=',num2str(e)];%能量文本
text(xm1,1,txt,'FontSize',fs)          %显示文本
plot(x1,imag(psi11+psi12)+y0,':',...
    x1,imag(psi11)+y0,x1,imag(psi12)+y0,':','LineWidth',2)%画I区的波(虚部)
plot(x2,imag(psi21+psi22)+y0,':',...
    x2,imag(psi21)+y0,x2,imag(psi22)+y0,':','LineWidth',2)%画势垒区域的波(虚部)
plot(x3,imag(psi31)+y0,':','LineWidth',2)%画III区的波(虚部)
pause                                  %暂停
t=0;                                   %零时刻
while 1                                %无限循环
    t=t+0.1;                           %下一时刻
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出循环
%    if abs(t-1.7)<1e-3,break,end       %波函数实部与虚部重叠时退出循环(取图用k0=5,e=1.2)
    psi11=a1*exp(i*(k1*x1-t));         %入射波
    psi12=a2*exp(-i*(k1*x1+t));        %反射波
    psi21=b1*exp(i*(k2*x2-t));         %势垒入射波
    psi22=b2*exp(-i*(k2*x2+t));        %势垒反射波
    psi31=c1*exp(i*(k1*x3-t));         %透射波
    set(h1,'YData',psi11+psi12+y0)     %设置I区波
    set(h11,'YData',psi11+y0)          %设置I区入射波
    set(h12,'YData',psi12+y0)          %设置I区反射波
    set(h2,'YData',psi21+psi22+y0)     %设置II区波
    set(h21,'YData',psi21+y0)          %设置II区入射波
    set(h22,'YData',psi22+y0)          %设置II区反射波
    set(h31,'YData',psi31+y0)          %设置III区波
    drawnow                            %刷新屏幕
end                                    %结束循环

