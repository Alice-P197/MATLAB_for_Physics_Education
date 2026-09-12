%均匀链条从光滑桌面上滑下来的运动规律曲线(用解析式)
clear                                  %清除变量
b=0.1:0.1:0.7;                         %b与l的比值向量
y=0:0.01:1;                            %链条滑过的长度y与l的比值向量
[B,Y]=meshgrid(b,y);                   %化为矩阵
Y(Y<B)=nan;                            %使不符合条件的元素为非数(也可代替下面第二句)
T=acosh(Y./B);                         %求时间
%T(imag(T)~=0)=nan;                     %将复数改为非数
V=B.*sinh(T);                          %求速度
%V=sqrt(Y.^2-B.^2);                     %求速度(同上)
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(T,Y,'LineWidth',2)                %画长度曲线族
plot(T(:,1),Y(:,1),'o-',T(:,2),Y(:,2),'d-',T(:,3),Y(:,3),'s-',...
    T(:,4),Y(:,4),'p-',T(:,5),Y(:,5),'h-',T(:,6),Y(:,6),'^-',...
    T(:,7),Y(:,7),'v-')                %画长度曲线族
fs=16;                                 %字体大小
xlabel('\itt/t\rm_0','FontSize',fs)    %时间比标签
ylabel('\ity/l','FontSize',fs)         %长度比标签
title('均匀链条从桌面上无摩擦滑下的长度','FontSize',fs)%加标题
grid on                                %加网格
n=length(b);                           %比值个数  
legend([repmat('\itb/l\rm=',n,1),num2str(b')])%加图例
text(1.5,0.1,'\itt\rm_0=(\itl/g\rm)^{1/2}','FontSize',fs)%加时间单位文本
tm=max(T);                             %求运动时间
text(tm,ones(size(tm)),num2str(tm',2),'FontSize',fs)%标记时间
%axis tight                             %帖轴
hold on                                %保持图像
stem(tm,ones(size(tm)),'--')           %画杆图
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(T,V,'LineWidth',2)                %画速度曲线
plot(T(:,1),V(:,1),'o-',T(:,2),V(:,2),'d-',T(:,3),V(:,3),'s-',...
    T(:,4),V(:,4),'p-',T(:,5),V(:,5),'h-',T(:,6),V(:,6),'^-',...
    T(:,7),V(:,7),'v-')                %画速度曲线族
xlabel('\itt/t\rm_0','FontSize',fs)    %时间比标签
ylabel('\itv/v\rm_0','FontSize',fs)    %速度比标签
title('均匀链条从桌面上无摩擦滑下的速度','FontSize',fs)%加标题
legend([repmat('\itb/l\rm=',n,1),num2str(b')])%加图例
grid on                                %加网格
text(1.5,0.1,'\itv\rm_0=(\itgl\rm)^{1/2}','FontSize',fs)%速度单位文本
vm=max(V);                             %求最终速度
text(tm,vm,num2str(vm',3),'FontSize',fs)%标记最终速度
hold on                                %保持图像
plot([zeros(size(tm));tm],[vm;vm],'--','LineWidth',2)%画水平线
b=0.1:0.01:1;                          %b与l的比值向量
tm=acosh(1./b);                        %全部滑下的时间
vm=sqrt(1-b.^2);                       %全部滑下的速度
plot(tm,vm,'--','LineWidth',2)         %画全部滑下的速度和时间曲线

