%摩擦力与速率成正比的圆周运动
clear                                  %清除变量
t=0:0.1:5;                             %无量纲时间向量
s=1-exp(-t);                           %无量纲路程向量
v=exp(-t);                             %无量纲速率向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(t,s,'*-',t,v,'+-','LineWidth',2)  %画距离和速率曲线
fs=15;                                 %字体大小
title('摩擦力与速率成正比的圆周运动的路程和速率','FontSize',fs)%显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标
legend('路程\its/s\rm_0','速率\itv/v\rm_0',0)%图例
grid on                                %加网格
txt='\it\tau\rm=\itm/k\rm,\its\rm_0=\itmv\rm_0/\itk';%时间和距离文本
text(0,0.15,txt,'FontSize',fs)         %标记文本
 
f=0.05:0.15:0.95;                      %初始力之比向量
n=length(f);                           %向量个数
[F,T]=meshgrid(f,t);                   %力之比和时间矩阵
AT=F.*exp(-T);                         %切向加速度矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,AT,'LineWidth',2)               %画切向加速度曲线族
plot(t,AT(:,1),'o-',t,AT(:,2),'d-',t,AT(:,3),'s-',t,AT(:,4),'p-',...
    t,AT(:,5),'h-',t,AT(:,6),'^-',t,AT(:,7),'v-')%画切向加速度曲线族
tit='摩擦力与速率成正比的圆周运动的切向加速度(实线)和法向加速度(虚线)';%标题文本
title(tit,'FontSize',fs)               %显示标题
xlabel('时间\itt/\tau','FontSize',fs)  %显示横坐标
ylabel('加速度\ita/a\rm_0','FontSize',fs)%显示纵坐标
legend([repmat('\itkR/mv\rm_0=',n,1) num2str(f')])%图例
an=exp(-2*t);                          %法向加速度向量
grid on                                %加网格
hold on                                %保持图像
plot(t,an,'--','LineWidth',2)          %画法向加速度曲线
te=-log(f);                            %切向加速度大小与法向加速度相等的时间
ae=f.^2;                               %切向加速度大小与法向加速度相等的大小
%ae=exp(-2*te);                         %同上
%ae=abs(-f.*exp(-te));                  %同上
stem(te,ae,'--')                       %画杆图
txt=[num2str(te'),repmat(',',n,1),num2str(ae')];%两加速度相等时间和大小文本
text(te,ae,txt,'FontSize',fs)          %标记文本
text(4,0.25,'\ita\rm_0=\itv\rm_0^2/\itR','FontSize',fs)%标记加速度单位文本

