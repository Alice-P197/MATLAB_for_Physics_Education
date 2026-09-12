%受迫振动的稳态位移振幅,初相和速度振幅曲线
clear                                  %清除变量
b=1:-0.2:0;                            %约化阻尼因子向量
n=length(b);                           %向量的个数
wm=2.5;                                %最大约化驱动角频率
w=0:0.1:wm;                            %约化驱动角频率
w(w==1)=1+eps;                         %为1者取大一点
[B,W]=meshgrid(b,w);                   %阻尼因子和驱动角频率矩阵
A=1./sqrt((1-W.^2).^2+(2*B.*W).^2);    %约化位移振幅
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(w,A,'LineWidth',2)                %画振幅曲线族
plot(w,A(:,1),'o-',w,A(:,2),'d-',w,A(:,3),'s-',w,A(:,4),'p-',...
    w,A(:,5),'h-',w,A(:,6),'<-')       %画振幅曲线族
h=legend([repmat('\it\beta/\omega\rm_0=',n,1),num2str(b')]);%加图例
fs=16;                                 %字体大小
set(h,'FontSize',fs)                   %放大图例
grid on                                %加网格
[m,i]=max(A);                          %求峰值和下标
hold on                                %保持图像
stem(w(i),m,'--')                      %画杆图
bm=linspace(0.05,sqrt(2)/2);           %峰值曲线的约化阻尼因子
omegam=sqrt(1-2*bm.^2);                %峰值曲线的驱动力约化角频率
am=1./(2*bm.*sqrt(1-bm.^2));           %峰值曲线的振幅
plot(omegam,am,'r--','LineWidth',2)    %画峰值曲线
xlabel('\it\Omega/\omega\rm_0','FontSize',fs)%标记横坐标
ylabel('\itA/A\rm_0','FontSize',fs)    %标记纵坐标
axis([0,wm,0,6])                       %曲线范围
title('受迫振动的稳态振幅曲线','FontSize',fs)%标题
txt='\itA\rm_0=\itF\rm_0/(\itm\omega\rm_0^2)';%位移振幅文本
text(0,3,txt,'FontSize',fs)            %标记文本

PHI=atan2(-2*B.*W,1-W.^2)*180/pi;      %初相
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(w,PHI,'LineWidth',2)              %画初相曲线族
plot(w,PHI(:,1),'o-',w,PHI(:,2),'d-',w,PHI(:,3),'s-',w,PHI(:,4),'p-',...
    w,PHI(:,5),'h-',w,PHI(:,6),'<-')   %画振幅曲线族
h=legend([repmat('\it\beta/\omega\rm_0=',n,1),num2str(b')]);%加图例
set(h,'FontSize',fs)                   %放大图例
grid on                                %加网格
%phim=-atan(sqrt(1-2*bm.^2)./bm)*180/pi;%位移共振初相
phim=atan2(-sqrt(1-2*bm.^2),bm)*180/pi;%位移共振初相
hold on                                %保持图像
plot(omegam,phim,'r--','LineWidth',2)  %画峰值曲线
xlabel('\it\Omega/\omega\rm_0','FontSize',fs)%标记横坐标
ylabel('\it\Phi\rm/\circ','FontSize',fs)%标记纵坐标
title('受迫振动的稳态初相曲线','FontSize',fs)%标题

V=W./sqrt((1-W.^2).^2+(2*B.*W).^2);    %约化速度振幅
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(w,V,'LineWidth',2)                %画速度振幅曲线族
plot(w,V(:,1),'o-',w,V(:,2),'d-',w,V(:,3),'s-',w,V(:,4),'p-',...
    w,V(:,5),'h-',w,V(:,6),'<-')       %画振幅曲线族
h=legend([repmat('\it\beta/\omega\rm_0=',n,1),num2str(b')]);%加图例
set(h,'FontSize',fs)                   %放大图例
grid on                                %加网格
hold on                                %保持图像
plot([1;1],[0;6],'r--','LineWidth',2)  %画竖线
xlabel('\it\Omega/\omega\rm_0','FontSize',fs)%标记横坐标
ylabel('\itv\rm_m/\itv\rm_0','FontSize',fs)%标记纵坐标
axis([0,wm,0,6])                       %曲线范围
title('受迫振动的稳态速度振幅曲线','FontSize',fs)%标题
txt='\itv\rm_0=\itF\rm_0/(\itm\omega\rm_0)';%速度振幅文本
text(0,3,txt,'FontSize',fs)            %标记文本

