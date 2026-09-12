%多个同方向同频率相差恒定的简谐振动的合成
clear                                  %清除变量
n0=input('分振动的个数:');             %键盘输入分振动的个数
%n0=7;                                  %参考值
dphi=input('请输入角度差的度数:');     %键盘输入角度
%dphi=20;                              %参考值
n=0:n0-1;                              %分振动编号向量
a=dphi*pi/180;                        %化为弧度数
if a==0 a=eps;end                      %角度为零则改为小值
m=3;                                   %周期的个数
m0=1000;                               %向量个数
wt=linspace(0,2*m*pi,m0);              %角度向量
[N,WT]=meshgrid(n,wt);                 %编号和角度矩阵
X=cos(WT+N*a);                         %各振动的位移
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子图
plot(wt,X,'LineWidth',2)               %画各振动的位移曲线
grid on                                %加网格
axis tight                             %使图像紧帖坐标范围
set(gca,'XTick',(0:2*m)*pi)            %设置横坐标刻度
fs=16;                                 %字体大小
title('等振幅,同频率,同方向简谐振动的位移','FontSize',fs)%显示标题
ylabel('分量的位移\itx_n\rm/\Delta\itA','FontSize',fs)%标记纵轴
txt1=['\itn\rm=',num2str(n0)];         %个数文本
text(0,1,txt1,'FontSize',fs)           %标记文本
txt2=['\Delta\it\phi\rm=',num2str(dphi),'\circ'];%角度文本
text(0,-1,txt2,'FontSize',fs)          %标记文本
%legend([repmat('\itn\rm=',n0,1),num2str(n')],-1)%图例
AA=sin((N+1)*a/2)/sin(a/2);            %合振幅
XX=AA.*cos(WT+N*a/2);                  %合位移
% XX=cumsum(X,2);                        %合位移
subplot(2,1,2)                         %子图
plot(wt,XX,'LineWidth',2)              %画合位移曲线
grid on                                %加网格
axis tight                             %使图像紧帖坐标范围
set(gca,'XTick',(0:2*m)*pi)            %设置横坐标刻度
title('等振幅,同频率,同方向简谐振动的合位移','FontSize',fs)%显示标题
xlabel('相位\it\omegat','FontSize',fs) %标记横轴
ylabel('逐级叠加位移\Sigma\itx_n\rm/\Delta\itA','FontSize',fs)%标记纵轴
A=sin(n0*a/2)/sin(a/2);                %合振幅
if abs(A)<1e-8 A=0;end                 %接近于0的数就当0处理
txt3=['\itA\rm/\Delta\itA\rm=',num2str(A)];%合振幅文本
text(0,A,txt3,'FontSize',fs)           %标记文本
phi=(n0-1)*a/2*180/pi;                 %合振动的初相
if abs(phi)<1e-8 phi=0;end             %接近于0的数就当0处理
txt4=['\it\phi\rm=',num2str(phi),'\circ'];%初相文本
text(0,-A,txt4,'FontSize',fs)          %标记文本
%合振幅
x=cos(n*a);                            %各振动振幅矢量的横坐标
y=sin(n*a);                            %各振动振幅矢量的纵坐标
x=cumsum([0,x]);                       %连接和累加各振幅矢量的横坐标
y=cumsum([0,y]);                       %连接和累加各振幅矢量的纵坐标
x0=[0,x(1:end-1)];                     %箭尾横坐标
y0=[0,y(1:end-1)];                     %箭尾纵坐标
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
quiver(x0,y0,x-x0,y-y0,0,'LineWidth',2)%画各振动的振幅折线
hold on                                %保持图像
quiver(0,0,x(end),y(end),0,'LineWidth',2)%画合矢量
grid on                                %加网格
axis equal                             %坐标刻度相等且使图像紧帖坐标范围
title('等振幅,同频率,同方向简谐振动的合振幅','FontSize',fs)%显示标题
xlabel('振幅矢量横坐标\itA_x\rm/\Delta\itA','FontSize',fs)%标记横轴
ylabel('振幅矢量纵坐标\itA_y\rm/\Delta\itA','FontSize',fs)%标记纵轴
text(1,0,[txt1 ',' txt2],'FontSize',fs)%标记文本
text(x(end),y(end),[txt3 ',' txt4],'FontSize',fs)%标记文本

