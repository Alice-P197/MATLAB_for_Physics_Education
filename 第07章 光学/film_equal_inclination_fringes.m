%介质薄膜的等倾干涉条纹
clear                                  %清除变量
e=50;                                  %薄膜厚度与波长比(中心为暗斑)
%e=50.5;                                %薄膜厚度与波长比(中心为亮斑)
n=1.5;                                 %介质折射率
n1=1;                                  %空气折射率
d=1/2;                                 %附加光程差与波长之比
r=-1:0.001:1;                          %半径与高度之比
%r=-1:0.01:1;                           %半径与高度之比(内存不够则用此句)
[X,Y]=meshgrid(r);                     %直角坐标的两个分量
R=sqrt(X.^2+Y.^2);                     %半径与高度之比矩阵
I=atan(R);                             %入射角向量
D=2*e*sqrt(n^2-n1^2*sin(I).^2)+d;      %光程差与波长的倍数
I=cos(pi*D).^2./(1+R.^2);              %光波的相对强度
c=linspace(0,1,64)';                   %颜色范围
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
image(I*64)                            %画图像
ColorMap([c,c*0,c*0])                  %形成红色色图
axis off equal                         %隐轴
fs=16;                                 %字体大小
title('介质薄膜的等倾干涉条纹','FontSize',fs)%标题

i=0:90;                                %入射角向量
k=2*e*sqrt(n^2-n1^2*sin(i*pi/180).^2)+d;%明纹级次
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(i,k,'LineWidth',2)                %画曲线
grid on                                %加网格
title('介质薄膜的等倾干涉条纹的明纹级次范围','FontSize',fs)%标题
xlabel('入射角\iti\rm/\circ','FontSize',fs)%x标签
ylabel('级次\itk','FontSize',fs)       %y标签
text(0,max(k),num2str(floor(max(k))),'FontSize',fs)%最高级次
text(90,min(k),num2str(ceil(min(k))),'FontSize',fs)%最低级次
txt=['\ite/\lambda\rm=',num2str(e)];   %薄膜厚度文本
text(0,min(k),txt,'FontSize',fs)       %标记折射率
k=k-1/2;                               %暗纹级次
subplot(2,1,2)                         %选子图
plot(i,k,'LineWidth',2)                %画曲线
grid on                                %加网格
title('介质薄膜的等倾干涉条纹的暗纹级次范围','FontSize',fs)%标题
xlabel('入射角\iti\rm/\circ','FontSize',fs)%x标签
ylabel('级次\itk','FontSize',fs)       %y标签
text(0,max(k),num2str(floor(max(k))),'FontSize',fs)%最高级次
text(90,min(k),num2str(ceil(min(k))),'FontSize',fs)%最低级次
txt=['\itn\rm=',num2str(n),',\itn\rm_1=',num2str(n1)];%折射率文本
text(0,min(k),txt,'FontSize',fs)       %标记薄膜厚度

