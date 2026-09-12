%从电容器中抽出电介质所作的功
clear                                  %清除变量
t=0:0.01:1;                            %介质相对厚度向量(t/d)
%er=2:8;                               %相对介电常数向量
er=1.1:0.1:1.4;                        %相对介电常数向量
n=length(er);                          %介电常数的个数
[Er,T]=meshgrid(er,t);                 %化为矩阵
A1=Er.*(Er-1).*T./(T+Er.*(1-T)).^2;    %功
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,A1,'LineWidth',2)               %画曲线族
plot(t,A1(:,1),t,A1(:,2),'--',t,A1(:,3),'-.',t,A1(:,4),':','LineWidth',2)%画曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('从电容器中抽出电介质所作的功(断开电源)','FontSize',fs)%标题
xlabel('\itt/d','FontSize',fs)         %标记横坐标
ylabel('\itA\rm_1\it/A\rm_0','FontSize',fs)%标记纵坐标
legend([repmat('\it\epsilon\rm_r=',n,1),num2str(er')],2)%图例
txt='\itA\rm_0=\it\epsilon\rm_0\itSU\rm^2/2\itd';%能量单位
text(0,max(A1(:))/3,txt,'FontSize',fs) %标记能量单位

A2=(Er-1).*T./(T+Er.*(1-T));           %功
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,A2,'LineWidth',2)               %画曲线族
plot(t,A2(:,1),t,A2(:,2),'--',t,A2(:,3),'-.',t,A2(:,4),':','LineWidth',2)%画曲线族
grid on                                %加网格
title('从电容器中抽出电介质所作的功(不断开电源)','FontSize',fs)%标题
xlabel('\itt/d','FontSize',fs)         %标记横坐标
ylabel('\itA\rm_2\it/A\rm_0','FontSize',fs)%标记纵坐标
legend([repmat('\it\epsilon\rm_r=',n,1),num2str(er')],2)%图例
text(0,max(A2(:))/3,txt,'FontSize',fs) %标记能量单位
