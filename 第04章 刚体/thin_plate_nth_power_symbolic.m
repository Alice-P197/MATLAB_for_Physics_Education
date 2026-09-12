%薄板所受的阻力与速率的n次方成正比的运动(求微分方程符号解)
clear                                  %清除变量
th=dsolve('D2x+3/(n+2)*(Dx)^n','Dx(0)=1','x(0)=0');%求微分方程的符号解
w=diff(th);                            %求角速度的符号解
tm=5;                                  %最大时间
t=0:0.05:tm;                           %时间向量
n=0:0.5:3;                             %指数向量
m=length(n);                           %指数个数
[N,T]=meshgrid(n+sqrt(eps),t);         %化为矩阵
TH=subs(th,{'n','t'},{N,T});           %将符号用常数代替
W=subs(w,{'n','t'},{N,T});             %将符号用常数代替
W(N<1&T>(N+2)/3./(1-N))=nan;           %将不合理的角速度改为非数
TH(N<1&T>(N+2)/3./(1-N))=nan;          %将不合理的角度改为非数
%----------------------------------------------------------
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,W)                              %画角速度曲线族
plot(t,W(:,1),'o-',t,W(:,2),'d-',t,W(:,3),'s-',t,W(:,4),'p-',...
    t,W(:,5),'h-',t,W(:,6),'<-',t,W(:,7),'>-')%画曲线族
fs=16;                                 %字体大小
title('薄板所受阻力与速率的\itn\rm次方成正比的角速度与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('角速度\it\omega/\omega\rm_0','FontSize',fs)%显示纵坐标
grid on                                %加网格
hold on                                %保持图像
plot(t,exp(-t),'.')                    %验证n=1时的角速度
leg=[repmat('\itn\rm=',m,1),num2str(n')];%图例字符串
legend(char(leg,'\itn\rm=1的解析式'))  %图例
txt='\itt_n\rm=\itm/k_na^nb\omega\rm_0\it^n\rm^-^1';%时间文本
text(0,0.1,txt,'FontSize',fs)          %标记时间文本
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,TH)                             %画角度曲线族
plot(t,TH(:,1),'o-',t,TH(:,2),'d-',t,TH(:,3),'s-',t,TH(:,4),'p-',...
    t,TH(:,5),'h-',t,TH(:,6),'<-',t,TH(:,7),'>-')%画曲线族
title('薄板所受阻力与速率的\itn\rm次方成正比的角度与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('角度\it\theta/\omega\rm_0\itt_n','FontSize',fs)%显示纵坐标
grid on                                %加网格
hold on                                %保持图像
plot(t,4/3*log(1+3/4*t),'.')           %验证n=2时的角度
legend(char(leg,'\itn\rm=2的解析式'))  %图例

