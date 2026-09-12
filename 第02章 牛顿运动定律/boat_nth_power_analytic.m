%船受的摩擦力与速率的n次方成正比的运动(用解析式)
clear                                  %清除变量
tm=5;                                  %最大无量纲时间
t=0:0.1:tm;                            %时间向量
n=0:0.5:3;                             %指数向量
[N,T]=meshgrid(n+sqrt(eps),t);         %指数和时间矩阵
V=1./(1+(N-1).*T).^(1./(N-1));         %求速度
X=((1+(N-1).*T).^((N-2)./(N-1))-1)./(N-2);%求路程
%----------------------------------------------------------
V(N<1&T>1./(1-N))=nan;                 %将不合理的速度改为非数
X(N<1&T>1./(1-N))=nan;                 %将不合理的路程改为非数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,V)                              %画速度曲线族
plot(t,V(:,1),'o-',t,V(:,2),'d-',t,V(:,3),'s-',t,V(:,4),'p-',...
    t,V(:,5),'h-',t,V(:,6),'^-',t,V(:,7),'v-')%画速度曲线族
fs=16;                                 %字体大小
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标标签
ylabel('速度\itv/v\rm_0','FontSize',fs)%显示纵坐标标签
title('摩擦力与速率的\itn\rm次方成正比的速度与时间','FontSize',fs)%显示标题
text(0,0.1,'\itt_n\rm=\itm/k_nv\rm_0^{\itn\rm-2}','FontSize',fs)%标记时间文本
hold on                                %保持图像
plot(t,exp(-t),'.',t,1./(1+t),'x')     %画n=1和2的解析式速度曲线
grid on                                %加网格
m=length(n);                           %指数个数
leg=[repmat('\itn\rm=',m,1),num2str(n')];%图例字符串
legend(char(leg,'\itn\rm=1的解析式','\itn\rm=2的解析式'))%图例

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(t,X)                              %画路程曲线族
plot(t,X(:,1),'o-',t,X(:,2),'d-',t,X(:,3),'s-',t,X(:,4),'p-',...
    t,X(:,5),'h-',t,X(:,6),'^-',t,X(:,7),'v-')%画路程曲线族
title('摩擦力与速率的\itn\rm次方成正比的路程与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标标签
ylabel('路程\itx/x_n','FontSize',fs)   %显示纵坐标标签
text(0,1,'\itx_n\rm=\itv\rm_0\itt_n','FontSize',fs)%标记路程文本
grid on                                %加网格
hold on                                %保持图像
plot(t,1-exp(-t),'.',t,log(1+t),'x')   %画n=1和2的解析式路程曲线
legend(char(leg,'\itn\rm=1的解析式','\itn\rm=2的解析式'),2)%图例

