%阻尼运动的类型
clear                                  %清除变量
t=0:0.25:20;                           %固有角频率与时间的乘积w0t向量(约化时间向量)
%b=0:0.5:1.5;                           %阻尼因子与固有角频率的倍数向量(约化阻尼因子向量)
b=0:0.25:1.25;                         %阻尼因子与固有角频率的倍数向量(约化阻尼因子向量)
n=length(b);                           %曲线条数
b(b==1)=1+eps;                         %将1值改为1加小量
[B,T]=meshgrid(b,t);                   %约化阻尼因子和约化时间矩阵
W=sqrt(1-B.^2);                        %准角频率矩阵
X=exp(-B.*T).*(cos(W.*T)+B./W.*sin(W.*T));%位移函数矩阵
V=-exp(-B.*T).*sin(W.*T)./W;           %速度函数矩阵
%A=sqrt(B.^2-1);                        %参数矩阵
%X=exp(-B.*T).*((A+B).*exp(A.*T)+(A-B).*exp(-A.*T))/2./A;%位移函数矩阵(效果相同)
%X=exp(-B.*T).*(cosh(A.*T)+B./A.*sinh(A.*T));%位移函数矩阵(效果相同)
%V=-exp(-B.*T).*sinh(A.*T)./A;          %速度函数矩阵(效果相同)
f1=figure;                             %创建图形窗口
%plot(t,X,'LineWidth',2)                %画位移曲线族
plot(t,X(:,1),'o-',t,X(:,2),'d-',t,X(:,3),'s-',t,X(:,4),'p-',...
    t,X(:,5),'h-',t,X(:,6),'<-')       %画位移曲线族
fs=16;                                 %字体大小
xlabel('\it\omega\rm_0\itt','FontSize',fs)%标记横坐标
ylabel('\itx/A','FontSize',fs)         %标记纵坐标
title('质点在不同阻尼下的运动曲线','FontSize',fs)%标题
legend([repmat('\it\beta/\omega\rm_0:',n,1),num2str(b')])%加图例
txt='\it\beta/\omega\rm_0 小于1为欠阻尼,等于1为临界阻尼,大于1为过阻尼';%文本
text(0,-0.7,txt,'FontSize',fs)         %显示文本
grid on                                %加网格
f2=figure;                             %创建图形窗口
%plot(t,V,'LineWidth',2)                %画速度曲线族
plot(t,V(:,1),'o-',t,V(:,2),'d-',t,V(:,3),'s-',t,V(:,4),'p-',...
    t,V(:,5),'h-',t,V(:,6),'<-')       %画位移曲线族
xlabel('\it\omega\rm_0\itt','FontSize',fs)%标记横坐标
ylabel('\itv/\omega\rm_0\itA','FontSize',fs)%标记纵坐标
title('质点在不同阻尼下的速度曲线','FontSize',fs)%标题
grid on                                %加网格
legend([repmat('\it\beta/\omega\rm_0:',n,1),num2str(b')])%加图例
pause                                  %暂停,可取图
X1=[];                                 %位移矩阵清空
V1=[];                                 %速度矩阵清空
X2=[];                                 %位移矩阵清空
V2=[];                                 %速度矩阵清空
for i=1:n                              %按曲线循环
    [tm,XV]=ode45('damped_motion_odefun',t,[1;0],[],b(i));%计算位移和速度
    X1=[X1,XV(:,1)];                   %连接位移矩阵
    V1=[V1,XV(:,2)];                   %连接速度矩阵
    s=['D2x+',num2str(2*b(i)),'*Dx+x'];%微分方程字符串
	sx=dsolve(s,'x(0)=1','Dx(0)=0');   %微分方程的符号解
	sv=diff(sx);                       %求速度的符号解
	x=subs(sx,'t',t);                  %位移
	v=subs(sv,'t',t);                  %速度
    X2=[X2,x'];                        %连接位移矩阵
    V2=[V2,v'];                        %连接速度矩阵
end                                    %结束循环
figure(f1)                             %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
plot(t,X1,'.',t,X2,'*')                %画位移曲线
figure(f2)                             %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
plot(t,V1,'.',t,V2,'*')                %画速度曲线

