%质点的螺旋运动轨迹和速度
clear                                  %清除变量
k=input('请输入角度系数:');            %键盘输入角度系数
%0.5                                    %参考值
th=(0:5000)/5000*2*pi*5;               %5圈极角
r=1+k*th;                              %极径
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
h=polar(th,r);                         %画极坐标图
set(h,'LineWidth',2)                   %加粗曲线
fs=16;                                 %字体大小
title('质点在极坐标系中的螺旋运动','FontSize',fs)%标题
text(0,0,['\itk\rm=',num2str(k)],'FontSize',fs)%角度系数文本
x=r.*cos(th);                          %横坐标
y=r.*sin(th);                          %纵坐标
%[x,y]=pol2cart(th,r);                  %效果同上
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
comet(x,y)                             %画彗星式轨迹
plot(x,y,'LineWidth',2)                %画轨迹曲线
grid on                                %加网格
axis equal                             %使坐标间隔相等
title('质点在直角坐标系中的螺旋运动','FontSize',fs)%标题
xlabel('\itx/r\rm_0','FontSize',fs)    %横坐标标签
ylabel('\ity/r\rm_0','FontSize',fs)    %纵坐标标签
text(0,0,['\itk\rm=',num2str(k)],'FontSize',fs)%角度系数文本

wt=0:0.1:2;                            %时间与角速度的乘积(角度)
vr=ones(size(wt));                     %径向速度(全1向量)
vth=1/k+wt;                            %角向速度
v=sqrt(1+(1/k+wt).^2);                 %总速度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(wt,[vr;vth;v],'LineWidth',3)      %画速度曲线
plot(wt,vr,'o-',wt,vth,'*-',wt,v,'.-','LineWidth',2)%画速度曲线
grid on                                %加网格
title('螺旋运动的速度','FontSize',fs)  %标题
xlabel('\it\omegat','FontSize',fs)     %横坐标标签
legend('径向速度\itv_r/v\rm_0','角向速度\itv_\theta/v\rm_0',...
       '速度\itv/v\rm_0')            %图例
text(0,2,['\itk\rm=',num2str(k)],'FontSize',fs)%角度系数文本

