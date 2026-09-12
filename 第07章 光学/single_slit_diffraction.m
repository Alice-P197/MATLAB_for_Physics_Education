%单缝夫琅禾费衍射强度曲线和条纹
clear                                  %清除变量
n=3;                                   %解的个数
xm=(n+1)*pi;                           %自变量的最大值
xx=linspace(0,xm,1000);                %自变量向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0;xm],[0;0],xx,xx,'k')           %画水平线和斜线
hold on                                %保持图像
plot(xx,tan(xx),'LineWidth',2)         %画正切线
grid on                                %加网格
axis([0,xm,-20,20])                    %限定曲线范围
set(gca,'XTick',pi*(0:n),'YTick',pi*(-(n+1):(n+1)))%加刻度线
x0=[];                                 %向量置空
f=inline('x-tan(x)');                  %定义内线函数
for i=1:n                              %按解的个数循环
    x1=i*pi-pi/2+pi/1e5;               %取下界
    x2=i*pi+pi/2-pi/1e5;               %取上界
    x0=[x0;fzero(f,[x1,x2])];          %连接零点向量
end                                    %结束循环
stem(x0,x0,'r--')                      %画解的杆图
fs=16;                                 %字体大小
text(x0,x0,num2str(x0),'FontSize',fs)  %标记解
txt=[num2str(x0/pi),repmat('\pi',n,1)];%以pi的倍数的解
text(x0,zeros(1,n),txt,'FontSize',fs)  %以pi的倍数标记解
title('超越方程\itu\rm=tan\itu\rm的解','FontSize',fs) %标题
xlabel('\itu','FontSize',fs)           %x标签
ylabel('\itu','FontSize',fs)           %y标签

u=-11:0.01:11;                         %中间变量
u(u==0)=eps;                           %零改为小量
i=(sin(u)./u).^2;                      %光的强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(u,i,'LineWidth',2)                %画曲线
grid on                                %加网格
xlabel('\itu','FontSize',fs)           %标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
title('单缝夫琅禾费衍射光强的峰值','FontSize',fs)%标题
txt='\itu\rm=\pi\ita\rmsin\it\theta/\lambda';%中间变量文本
text(-10,0.5,txt,'FontSize',fs)        %标记中间变量
y0=(sin(x0)./x0).^2;                   %求光强
text(-x0,y0,num2str(y0,3),'FontSize',fs)%标记强度
text(x0,y0,[num2str(x0/pi,3),repmat('\pi',n,1)],'FontSize',fs)%标记横坐标
hold on                                %保持图像
stem([-x0,x0],[y0,y0],'--')            %画杆图
set(gca,'XTick',pi*(-n:n))             %加竖线
axis tight                             %框紧贴图
%axis([-11,11,0,0.06])                  %设置曲线范围观察次峰

c=linspace(0,1,64)';                   %颜色范围
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
image(i*1000)                          %画图像(乘以1000使次条纹比较亮)
ColorMap([c,c*0,c*0])                  %形成红色色图
axis off                               %隐轴
title('单缝夫琅禾费衍射条纹','FontSize',fs)%标题

