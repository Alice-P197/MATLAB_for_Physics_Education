%轻线单摆作圆周运动的角速度和张力
clear                                  %清除变量
theta=0:5:180;                           %角度向量
th=theta*pi/180;                       %化为弧度
v0=0.4:0.2:1.6;                        %初速度向量
[V0,TH]=meshgrid(v0,th);               %化为矩阵
W=sqrt(V0.^2+cos(TH)-1);               %计算角速度
T=2*V0.^2+3*cos(TH)-2;                 %张力
W(T<0)=nan;                            %张力小于零的角速度改为非数
T(T<0)=nan;                            %张力小于零改为非数
T(imag(W)~=0)=nan;                     %角速度为复数的张力改为非数
W(imag(W)~=0)=0;                       %角速度为复数者改为零
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,W,'LineWidth',2)            %画角速度曲线族
plot(theta,W(:,1),'o-',theta,W(:,2),'d-',theta,W(:,3),'s-',...
    theta,W(:,4),'p-',theta,W(:,5),'h-',theta,W(:,6),'^-',...
    theta,W(:,7),'.-')                 %画角速度曲线族
vc=sqrt(5/2);                          %计算临界速度
wc=sqrt(3/2+cos(th));                  %计算临界角速度
grid on                                %加网格
hold on                                %保持图像
plot(theta,wc,'--','LineWidth',2)      %画临界角速度曲线
n=length(v0)+1;                        %速度个数
legend([repmat('\itv\rm_0/\itV\rm_0=',n,1),num2str([v0 vc]')])%图例
fs=16;                                 %字体大小
title('轻线单摆受冲击作圆周运动的角速度与角度的关系','FontSize',fs)%显示标题
xlabel('角度\it\theta\rm/\circ','FontSize',fs)%显示横坐标标签
ylabel('角速度\it\omega/\omega\rm_0','FontSize',fs)%显示纵坐标标签
txt='\itV\rm_0=(2\itgl\rm)^{1/2},\it\omega\rm_0=\itV\rm_0/\itl';%速度文本
text(0,0.1,txt,'FontSize',fs)          %标记文本
vm=linspace(1,sqrt(5/2));              %初速度向量
%vm=linspace(1,sqrt(5/2)-eps);          %初速度向量(可避免复数)
thm=acos((1-vm.^2)*2/3);               %角度向量
wm=sqrt((vm.^2-1)/3);                  %最小角速度向量
%wm=sqrt(-cos(thm)/2);                  %最小角速度(同上)
plot(thm*180/pi,wm,'-.','LineWidth',2) %画最小角速度线
text(0,1.5,'虚线为临界角速度','FontSize',fs)%显示临界角速度文本
text(100,0.2,'点虚线为最小角速度','FontSize',fs)%显示最小角速度文本

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,T,'LineWidth',2)            %画张力曲线族
plot(theta,T(:,1),'o-',theta,T(:,2),'d-',theta,T(:,3),'s-',...
    theta,T(:,4),'p-',theta,T(:,5),'h-',theta,T(:,6),'^-',...
    theta,T(:,7),'.-')                 %画角速度曲线族
tc=3*(1+cos(th));                      %临界拉力
grid on                                %加网格
hold on                                %保持图像
plot(theta,tc,'--','LineWidth',2)      %画临界张力线
legend([repmat('\itv\rm_0/\itV\rm_0=',n,1) num2str([v0 vc]')])%图例
title('轻线单摆受冲击作圆周运动的张力与角度的关系','FontSize',fs)%显示标题
xlabel('角度\it\theta\rm/\circ','FontSize',fs)%显示横坐标标签
ylabel('张力\itT/mg','FontSize',fs)    %显示纵坐标标签
vm=0:0.01:1;                           %初速度向量
thm=acos(1-vm.^2);                     %角度向量
tm=1-vm.^2;                            %最小张力向量
%tm=cos(thm);                           %最小张力(同上)
plot(thm*180/pi,tm,'-.','LineWidth',2) %画最小张力线
text(0,5.5,'虚线为临界张力','FontSize',fs)%显示临界张力文本
text(0,0.5,'点虚线为最小张力','FontSize',fs)%显示最小张力文本

