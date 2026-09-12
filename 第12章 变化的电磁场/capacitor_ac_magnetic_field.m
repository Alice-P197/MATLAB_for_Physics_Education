%圆板电容器被细线连接并加交变电压时的磁感应强度
clear                                  %清除变量
k=input('请输入位移电流与传导电流振幅之比:');%键盘输入位移电流与传导电流振幅之比
%k=0.5;5;                               %参考值
r=0.2:0.2:1.4;                         %板外的距离向量
n=2;                                   %周期个数
wt=linspace(0,n*2*pi,50);              %时间或相位向量
[R,WT]=meshgrid(r,wt);                 %化为矩阵
B0=sqrt(1+(k*R.^2).^2)./R;             %板内磁感应强度振幅
PHI=atan(k*R.^2);                      %板内磁感应强度初相位
L=R>1;                                 %板外逻辑值
B0(L)=sqrt(1+k^2)./R(L);               %板外磁感应强度振幅
PHI(L)=atan(k);                        %板外磁感应强度初相位
B=B0.*cos(WT+PHI);                     %板内外磁感应强度
%B=(cos(WT)-k*R.^2.*sin(WT))./R;        %板内磁感应强度
%B(L)=(cos(WT(L))-k*sin(WT(L)))./R(L);  %板外磁感应强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(wt,B,'LineWidth',2)               %画磁感应强度曲线族
plot(wt,B(:,1),'o-',wt,B(:,2),'d-',wt,B(:,3),'s-',wt,B(:,4),'p-',...
    wt,B(:,5),'h-',wt,B(:,6),'<-',wt,B(:,7),'>-','LineWidth',2)%画磁感应强度曲线族
grid on                                %加网格
legend([repmat('\itr/a\rm=',length(r),1),num2str(r')],4)%图例
fs=16;                                 %字体大小
title('细线连接的圆板电容器加交变电压时的磁感应强度','FontSize',fs)%标题
xlabel('\it\omegat','FontSize',fs)     %标记横坐标
ylabel('\itB/B_a','FontSize',fs)       %标记纵坐标
txt='{\itB_a}=2{\itk}_m{\itU}_0/{\itaR}';%磁感应强度单位
set(gca,'Xtick',(0:2*n)*pi)            %设置横坐标刻度
bm=max(B(:));                          %最大值
text(0,-bm,txt,'FontSize',fs)          %标记磁感应强度单位
txt=['\it\epsilon\rm_0\pi\ita\rm^2\it\omegaR/d\rm=',num2str(k)];%电流振幅之比文本
text(0,bm,txt,'FontSize',fs)           %标记电流振幅之比
bm=sqrt(1+(k*r.^2).^2)./r;             %板内磁感应强度振幅
l=r>1;                                 %板外逻辑值
bm(l)=sqrt(1+k^2)./r(l);               %板外磁感应强度振幅
phi=atan(k*r.^2);                      %板内场强的初相
phi(l)=atan(k);                        %板外场强的初相
hold on                                %保持图像
stem(-phi+2*pi,bm,'--.')               %画杆图
r=0.2:0.01:1;                          %密集的距离向量
phi=atan(k*r.^2);                      %板内场强的初相
bm=sqrt(1+(k*r.^2).^2)./r;             %板内磁感应强度振幅
plot(-phi+2*pi,bm,'.')                 %画振幅曲线
if k>1 plot(-atan(1)+2*pi,sqrt(2*k),'r*'),end%判断画振幅最小值

