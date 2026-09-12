%均匀带电圆圈在轴线上的电势和电场强度 
clear                                  %清除变量
zm=4;                                  %最大横坐标
z=linspace(-zm,zm,300);                %横坐标向量
b=0:0.5:1;                             %圆圈的内外半径比向量
%b(end)=1-2*eps^(1/2);                  %1减一小量
n=length(b);                           %半径比的个数
[B,Z]=meshgrid(b+eps^(1/2),z);         %矩阵
U=2*(sqrt(1+Z.^2)-sqrt(B.^2+Z.^2))./(1-B.^2);%电势
E=2*Z./(1-B.^2).*(1./sqrt(B.^2+Z.^2)-1./sqrt(1+Z.^2));%电场强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,U,z,1./abs(z),'LineWidth',2)    %画电势线族
plot(z,U(:,1),z,U(:,2),'--',z,U(:,3),'-.',...
    z,1./abs(z),':','LineWidth',2)     %画曲线族
grid on                                %加网格
axis([-zm,zm,0,2])                     %曲线范围
leg=char([repmat('\itb/a\rm=',n,1),num2str(b')],'点电荷');%图例文本
legend(leg,2)                          %图例
fs=16;                                 %字体大小
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itU/U\rm_0','FontSize',fs)    %标记纵坐标
title('均匀带电圆圈(包括圆环和圆盘)在轴线上的电势','FontSize',fs)%标题
text(-zm,0.6,'\itU\rm_0=\itkQ/a','FontSize',fs)%标记电势单位
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,E,z,sign(z)./z.^2,'LineWidth',2)%画电场强度曲线族
plot(z,E(:,1),z,E(:,2),'--',z,E(:,3),'-.',...
    z,sign(z)./z.^2,':','LineWidth',2) %画曲线族
grid on                                %加网格
axis([-zm,zm,-2,2])                    %曲线范围
legend(leg,2)                          %图例
xlabel('\itz/a','FontSize',fs)         %标记横坐标
ylabel('\itE/E\rm_0','FontSize',fs)    %标记纵坐标
title('均匀带电圆圈(包括圆环和圆盘)在轴线上的电场强度','FontSize',fs)%标题
text(-zm,-1,'\itE\rm_0=\itkQ/a\rm^2','FontSize',fs)%标记场强单位
[em,im]=max(E);                        %求场强最大值和下标
hold on                                %保持图像
stem(z(im),em,'--')                    %画最大值的杆图
b=0:0.01:1;                            %圆圈的内外半径比向量
b(1)=eps^(1/2);                        %零改为小量
b(end)=1-eps^(1/2);                    %1减一小量
z=sqrt((b.^(4/3)-b.^2)./(1-b.^(4/3))); %极大值的坐标
%e=2*b.*((1./b.^(2/3)-1)./(1-b.^2)).^(3/2);%电场强度极值
%e=2*sqrt((b.^(4/3)-b.^2)./(1-b.^2).^3).*(1./b.^(2/3)-1);%电场强度极值
e=2*z./(1-b.^2).*(1./sqrt(b.^2+z.^2)-1./sqrt(1+z.^2));%电场强度极值
plot(z,e,'k--','LineWidth',2)          %画极值曲线

