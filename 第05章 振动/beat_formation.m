%拍的形成
clear                                  %清除变量
d=10;                                  %分母
%d=15;                                  %分母
t=0:0.01:60;                           %时间向量
w1=pi/2;                               %第一个角频率
dw=pi/d;                               %角频率之差
w2=w1+dw;                              %第二个角频率
x1=cos(w1*t);                          %第一个位移
x2=cos(w2*t);                          %第二个位移
x=x1+x2;                               %合位移
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(3,1,1)                         %选择子图
plot(t,x1,t,x2,'--','LineWidth',2)     %画位移曲线
grid on                                %加网格
leg1='\itx\rm_1/\itA\rm=cos\it\omega\rm_1\itt';%第一个图例字符串
leg2='\itx\rm_2/\itA\rm=cos\it\omega\rm_2\itt';%第二个图例字符串
legend(leg1,leg2)                      %图例
tit=['(\it\omega\rm_1=\pi/2,\Delta\it\omega\rm=\pi/',num2str(d),')'];%标题一部分
fs=16;                                 %字体大小
title(['拍的形成' tit],'FontSize',fs)  %加标题
%xx1=cos(dw*t/2);                       %调幅线
xx1=cos((w2-w1)*t/2);                  %调幅线(同上)
%xx2=cos((w1+dw/2)*t);                  %无调幅的振动线
xx2=cos((w2+w1)*t/2);                  %无调幅的振动线(同上)
subplot(3,1,2)                         %选择子图
plot(t,xx2,t,xx1,'r--','LineWidth',2)  %画曲线
grid on                                %加网格
leg1='cos(\it\omega\rm_2';             %图例字符串的第一部分
leg2='\it\omega\rm_1)\itt\rm/2';       %图例字符串的第二部分
legend([leg1,'+',leg2],[leg1,'-',leg2])%图例
subplot(3,1,3)                         %选择子图
plot(t,x1+x2,t,2*xx1,'r--',t,-2*xx1,'m--','LineWidth',2)%画曲线
grid on                                %加网格
xlabel('\itt\rm/s','FontSize',fs)      %标记横坐标
ylabel(['\itx/A\rm=\itx\rm_1/\itA\it+\itx\rm_2/\itA'],'FontSize',fs)%标记纵坐标

