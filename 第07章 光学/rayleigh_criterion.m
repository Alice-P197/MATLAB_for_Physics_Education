%瑞利判据的三种曲线和图片
clear                                  %清除变量
tit={'不能分辨','恰能分辨','能分辨'};  %标题
zm=1.2;                                %asin(theta)/lambda的最大值
z=-zm:0.01:zm;                         %以pi为单位的自变量向量
z=z+eps;                               %加一小量
[X,Y]=meshgrid(z);                     %自变量矩阵
d0=0.6098;                             %第一个零点坐标
dd=[0.8,1,1.2]*d0/2;                   %角度偏移向量(各偏一半)
l=length(dd);                          %向量长度
i0=1.2;                                %高度
c=linspace(0,1,64)';                   %颜色范围
f1=figure;                             %创建图形窗口
ColorMap([c,c*0,c*0])                  %形成红色色图
f2=figure;                             %创建图形窗口
fs=16;                                 %字体大小
for k=1:l                              %按偏离角度循环
    dz=dd(k);                          %取偏移量
    i1=(2*bessel(1,2*pi*(abs(z+dz)))./(2*pi*(abs(z+dz)))).^2;%求左孔光强
    i2=(2*bessel(1,2*pi*(abs(z-dz)))./(2*pi*(abs(z-dz)))).^2;%求右孔光强
    I=[i1;i2;i1+i2];                   %连接光强矩阵
    figure(f1)                         %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    subplot(2,l,l+k)                   %取图形窗口
    plot(z,I,'LineWidth',2)            %画衍射曲线
    hold on                            %保持图像
    plot([0;0],[0;i0])                 %画纵线
    plot([dz;dz],[0;1],'-.',[-dz;-dz],[0;1],'b-.')%画峰线
    grid on                            %加网格
    axis([-zm zm 0 i0])                %曲线范围
    title(tit{k},'FontSize',fs)        %加标题
    xlabel('\ita\rmsin\it\theta/\lambda','FontSize',fs)%标记横坐标
    if k==1,ylabel('\itI\rm/\itI\rm_0','FontSize',fs),end%判断标记纵坐标
    if k==2                            %恰好分辨时
        i=ceil(length(z)/2);           %取原点的下标
        i=I(3,i);                      %取中间光强的相对强度
        plot([-zm,0],[1,1]*i,'--')     %画水平线
        text(-zm,i,num2str(i),'FontSize',fs)%显示的中间相对光强
    end                                %结束条件
	Z=sqrt((X+dz).^2+Y.^2);            %左孔自变量矩阵
	I1=(2*bessel(1,2*pi*Z)./(2*pi*Z)).^2;%求左孔强度
	Z=sqrt((X-dz).^2+Y.^2);            %右孔自变量矩阵
	I2=(2*bessel(1,2*pi*Z)./(2*pi*Z)).^2;%求右孔强度
    I=I1+I2;                           %二孔光的总强度矩阵
    subplot(2,l,k)                     %取图形窗口
	image(I*64)                        %画图像
	axis off equal                     %隐轴
    figure(f2)                         %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    subplot(1,3,k)                     %取图形窗口
    surf(z,z,I)                        %画光强曲面
    shading interp                     %染色
    view(-20,30)                       %设置视角
    axis([-zm,zm,-zm,zm,0,1.1])        %曲面范围
    box on                             %加框
    title(tit{k},'FontSize',fs)        %加标题
end                                    %结束循环

