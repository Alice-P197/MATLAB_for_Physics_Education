%长直圆柱壳均匀载流导线内外的磁感应强度曲线
clear                                  %清除变量
rm=4;                                  %最大横坐标
dr=0.01;                               %间隔
r1=0:dr:1;                             %柱内的自变量向量                             
r2=1:dr:rm;                            %柱外的自变量向量
b=input('请输入内外半径之比(大于等于0小于等于1):');%键盘输入内外半径比
if b==1,b=1-eps;end                    %1改小一点
%b=0.5;                                 %内半径与外半径之比
%b=1-eps;                               %圆柱面
%b=0;                                   %圆柱体
b1=(r1.^2-b^2)./r1/(1-b^2);            %柱内磁感应强度向量
b1(r1<b)=0;                            %空腔内场强为零
b2=1./r2;                              %柱外磁感应强度向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([r1,r2],[b1,b2],'LineWidth',2)    %画磁感应强度
grid on                                %加网格
fs=16;                                 %字体大小
title('电流均匀分布在圆柱壳导体截面上的磁感应强度','FontSize',fs)%标题
xlabel('\itr/a','FontSize',fs)         %标记横坐标
ylabel('\itB\rm/\itB\rm_0','FontSize',fs)%标记纵坐标
text(0,0.8,['\itb/a\rm=',num2str(b)],'FontSize',fs)%标记半径比
text(0,0.5,'\itB\rm_0=2\itk\rm_m\itI/a','FontSize',fs)%标记单位

