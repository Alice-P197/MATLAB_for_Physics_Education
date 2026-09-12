%圆孔夫琅禾费衍射的光强曲线和爱里斑
clear                                  %清除变量
zm=2;                                  %a*sin(theta)/lambda的最大值
z=-zm:0.01:zm;                         %自变量向量
z(z==0)=eps;                           %为零者改为小量
u=2*pi*abs(z);                         %中间变量
%u=2*pi*z;                              %中间变量
f0=inline('bessel(1,x)');              %定义贝塞尔函数
f1=inline(['x.*(bessel(0,x)-bessel(2,x))/2-bessel(1,x)']);%定义导数的分子
z0=[];                                 %零点坐标向量清零
z1=[];                                 %峰值坐标向量清零
n=3;                                   %零点或峰值个数
for i=1:n                              %按个数循环
    z0=[z0,fzero(f0,[pi/2+(i-1)*pi,pi/2+i*pi])];%连接零点的坐标
    z1=[z1,fzero(f1,[i*pi,(i+1)*pi])];%连接导数零点的坐标
end                                    %结束循环
z0=z0/2/pi;                            %零点的坐标
i0=(2*f0(z1)./z1).^2;                  %峰值强度
z1=z1/2/pi;                            %峰值的坐标
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,f1(u),'LineWidth',2)            %画导数分子的曲线
%u=u+eps^(1/2);                         %中间变量
%plot(z,8*bessel(1,u)./u.^3.*f1(u))     %画导数曲线
grid on                                %加网格
hold on                                %保持图像
plot(z1,zeros(1,n),'o')                %画零点
fs=16;                                 %字体大小
xlabel('\ita\rmsin\it\theta/\lambda','FontSize',fs)%标记横坐标
title('圆孔夫琅禾费衍射的光强导数的分子部分曲线的零点','FontSize',fs)%标题
text(z1,zeros(1,n),num2str(z1',3),'FontSize',fs)%标记导数零点横坐标
text(0.5,0.5,'光强导数的零点坐标','FontSize',fs)%标记零点坐标

i=(2*bessel(1,u)./u).^2;               %求光强
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(z,i,'LineWidth',2)                %画光强曲线
grid on                                %加网格
xlabel('\ita\rmsin\it\theta/\lambda','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
title('圆孔的夫琅禾费衍射光强曲线','FontSize',fs) %标题
axis([-zm,zm,0,1])                     %坐标范围
hold on                                %保持图像
plot([-1;1]*z1,[1;1]*i0,'r--')         %画左右相同两次峰的水平线
text(z1,i0,num2str(i0',3),'FontSize',fs)%标记次峰强度
text(-z0,zeros(1,n),num2str(z0',4),'FontSize',fs)%标记零点横坐标
text(1,0.05,'峰值强度','FontSize',fs)%标记峰值强度
text(-zm,0.05,'零点坐标','FontSize',fs)  %标记零点
%axis([-zm,zm,0,0.02])                  %坐标范围
%text(-z1,i0,num2str(z1',3),'FontSize',fs)%标记次峰横坐标

[X,Y]=meshgrid(z);                     %自变量矩阵的分量
Z=sqrt(X.^2+Y.^2);                     %自变量矩阵
I=(2*bessel(1,2*pi*Z)./(2*pi*Z)).^2;   %求光强
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
surf(X,Y,I)                            %画光强曲面
shading interp                         %染色
box on                                 %加框
xlabel('\ita\rmsin\it\theta/\lambda','FontSize',fs)%标记横坐标
ylabel('\ita\rmsin\it\theta/\lambda','FontSize',fs)%标记纵坐标
zlabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记高坐标
title('圆孔的夫琅禾费衍射光强曲面','FontSize',fs) %标题
c=linspace(0,1,64)';                   %颜色范围
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
image(I*5000)                          %画图像
ColorMap([c,c*0,c*0])                  %形成红色色图
axis off equal                         %隐轴
title('圆孔的夫琅禾费衍射条纹和爱里斑','FontSize',fs)%标题

