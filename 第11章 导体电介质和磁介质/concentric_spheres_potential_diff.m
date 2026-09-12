%同心导体球和球壳之间的电势差和感应电荷
clear                                  %清除变量
r1=0.01:0.01:1;                        %球体半径向量(R1/R3)
r2=0.4:0.2:1;                          %球壳内半径向量(R1/R3)
[R1,R2]=meshgrid(r1,r2);               %半径矩阵
Q=-1./(1+1./R1-1./R2);                 %感应电荷
Q(R1>R2)=nan;                          %不合理的数据改为非数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(r1,Q,'LineWidth',2)               %画曲线族
plot(r1,Q(1,:),r1,Q(2,:),'--',r1,Q(3,:),'-.',r1,Q(4,:),':','LineWidth',2)%画曲线族
grid on                                %加网格
leg=[repmat('\itR\rm_2/\itR\rm_3=',length(r2),1),num2str(r2')];%图例字符串
legend(leg)                            %加图例
fs=16;                                 %字体大小
title('同心导体球的感应电荷','FontSize',fs)%显示标题
xlabel('\itR\rm_1/\itR\rm_3','FontSize',fs)%显示x坐标
ylabel('\itq\prime/Q','FontSize',fs)   %显示y坐标

U=-(1./R1-1./R2)./(1+1./R1-1./R2);     %电势差
U(R1>R2)=nan;                          %不合理的数据改为非数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(r1,U,'LineWidth',2)               %画曲线族
plot(r1,U(1,:),r1,U(2,:),'--',r1,U(3,:),'-.',r1,U(4,:),':','LineWidth',2)%画曲线族
grid on                                %加网格
legend(leg,4)                          %加图例
title('同心导体球和球壳之间的电势差','FontSize',fs)%显示标题
xlabel('\itR\rm_1/\itR\rm_3','FontSize',fs)%显示x坐标
ylabel('\itU\prime_A_B/U\rm_0','FontSize',fs)%显示y坐标
text(0,-0.5,'\itU\rm_0=\itkQ/R\rm_3','FontSize',fs)%显示电势单位

