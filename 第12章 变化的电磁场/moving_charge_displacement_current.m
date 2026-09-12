%电荷匀速运动时在垂直于速度方向的圆面上产生的电位移通量和位移电流
clear                                  %清除变量
zm=5;                                  %最大距离
z=-zm:0.01:zm;                         %距离向量
a=1:4;                                 %半径向量
[Z,A]=meshgrid(z,a);                   %化为矩阵
PHId=(sign(Z)-Z./sqrt(Z.^2+A.^2))/2;   %电位移通量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,PHId,'LineWidth',2)             %画电位移通量曲线族
plot(z,PHId(1,:),z,PHId(2,:),'--',z,PHId(3,:),'-.',z,PHId(4,:),':','LineWidth',2)%画电位移通量曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('匀速运动的电荷在圆面上产生的电位移通量','FontSize',fs)%显示标题
xlabel('\itz/z\rm_0','FontSize',fs)    %显示横坐标
ylabel('\it\Phi_D/q','FontSize',fs)    %显示纵坐标
legend([repmat('\ita/z\rm_0=',length(a),1),num2str(a')],2)%图例
Id=A.^2./(Z.^2+A.^2).^(3/2)/2;         %位移电流
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,Id,'LineWidth',2)               %画位移电流曲线族
plot(z,Id(1,:),z,Id(2,:),'--',z,Id(3,:),'-.',z,Id(4,:),':','LineWidth',2)%画位移电流曲线族
grid on                                %加网格
title('匀速运动的电荷在圆面上产生的位移电流','FontSize',fs)%显示标题
xlabel('\itz/z\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itI_D/I\rm_0','FontSize',fs)  %显示纵坐标
legend([repmat('\ita/z\rm_0=',length(a),1),num2str(a')])%图例
txt='\itI\rm_0=\itqv/z\rm_0';          %位移电流单位文本
text(-zm,0.4,txt,'FontSize',fs)        %标记位移电流单位
B=A./(Z.^2+A.^2).^(3/2);               %磁感应强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(z,B,'LineWidth',2)                %画磁感应强度曲线族
plot(z,B(1,:),z,B(2,:),'--',z,B(3,:),'-.',z,B(4,:),':','LineWidth',2)%磁感应强度曲线族
grid on                                %加网格
title('匀速运动的电荷在圆的边界上产生的磁感应强度','FontSize',fs)%显示标题
xlabel('\itz/z\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itB/B\rm_0','FontSize',fs)    %显示纵坐标
legend([repmat('\ita/z\rm_0=',length(a),1),num2str(a')])%图例
txt='\itB\rm_0=\itk\rm_m\itqv/z\rm_0^2';%磁感应强度单位文本
text(-zm,0.4,txt,'FontSize',fs)        %标记位移电流单位

