%无限长通电圆柱体和介质中的磁场强度和磁感应强度以及磁能密度
clear                                  %清除变量
mur=1.5;                               %磁介质的相对磁导率
r1=2;                                  %磁介质的半径
r=0:0.001:4;                           %距离向量(与内导体圆柱半径的比值)
h=r;                                   %圆柱内的磁场强度
b=r;                                   %圆柱内的磁感应强度
w=r.^2;                                %圆柱内的磁能密度
l=r>1;                                 %圆柱之外的距离为逻辑真
h(l)=1./r(l);                          %圆柱之外的磁场强度
b(l)=mur./r(l);                        %圆柱之外磁介质之中的磁感应强度
w(l)=mur./r(l).^2;                     %圆柱之外磁介质之中的磁能密度
l=r>r1;                                %磁介质之外的距离为逻辑真
b(l)=1./r(l);                          %磁介质之外的磁感应强度
w(l)=1./r(l).^2;                       %磁介质之外的磁能密度
%w=b.*h;                                %效果相同
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
plot(r,h,'LineWidth',2)                %画距离和磁场强度曲线
fs=16;                                 %字体大小
title('无限长通电圆柱体和磁介质内外的磁场强度','FontSize',fs)%显示标题
xlabel('\itr/R\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itH/H\rm_0','FontSize',fs)    %显示纵坐标
grid on                                %加网格
txt='\itH\rm_0=\itI\rm/2\pi\itR\rm_0'; %磁场强度的单位文本
text(0,0.8,txt,'FontSize',fs)          %标记磁场强度的单位文本
text(0,0.5,['\it\mu\rm_r=',num2str(mur)],'FontSize',fs)%显示相对磁导率
subplot(2,1,2)                         %选子图
plot(r,b,'LineWidth',2)                %画距离和磁感应强度曲线
grid on                                %加网格
title('无限长通电圆柱体和磁介质内外的磁感应强度','FontSize',fs)%显示标题
xlabel('\itr/R\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itB/B\rm_0','FontSize',fs)    %显示纵坐标
txt='\itB\rm_0=2\itk\rm_m\itI/R\rm_0'; %磁感应强度的单位文本
text(0,1,txt,'FontSize',fs)            %标记磁感应强度的单位文本
text(0,0.5,['\itR\rm_1=',num2str(r1),'\itR\rm_0'],'FontSize',fs)%显示磁介质半径
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(r,w,'LineWidth',2)                %画距离和磁场强度曲线
grid on                                %加网格
title('无限长通电圆柱体和磁介质内外的磁能密度','FontSize',fs)%显示标题
xlabel('\itr/R\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itw\rm_m/\itw\rm_0','FontSize',fs)%显示纵坐标
txt='\itw\rm_0=\it\mu\rm_0\itH\rm_0^2/2';%磁能密度的单位文本
text(0,1,txt,'FontSize',fs)            %标记磁感应强度的单位文本

