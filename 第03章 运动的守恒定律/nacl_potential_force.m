%氯化钠分子的势能和作用力
clear                                  %清除变量
n1=8.9;                                %第一指数
n2=2;                                  %第二指数
x1=0.9;                                %自变量最小值
x2=4;                                  %自变量最大值
x=x1:0.001:x2;                         %距离向量
v1=1./x.^n1;                           %斥力势能
v2=-1./x.^n2;                          %引力势能
v=v1+v2;                               %总势能
f1=n1./x.^(n1+1);                      %斥力
f2=-n2./x.^(n2+1);                     %引力
f=f1+f2;                               %合力
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(1,2,1)                         %选子图
%plot(x,v1,x,v2,x,v,'LineWidth',2)      %画势能曲线
plot(x,v1,'--',x,v2,'-.',x,v,'LineWidth',2)%画势能曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('氯化钠分子中离子的势能','FontSize',fs)%显示标题
xlabel('\itx/x\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itV/V\rm_0','FontSize',fs)    %显示纵坐标
text(0,min(v2),['\itx\rm_0=(\ita/b\rm)^{1/',num2str(n1-n2),'}'],...
    'FontSize',fs)                     %显示坐标单位
text(0,0,['\itV\rm_0=\itb/x\rm_0^',num2str(n2)],'FontSize',fs)%显示势能单位
legend('斥力势能','引力势能','总势能') %图例
subplot(1,2,2)                         %选子图
%plot(x,f1,x,f2,x,f,'LineWidth',2)      %画力的曲线
plot(x,f1,'--',x,f2,'-.',x,f,'LineWidth',2)%画力的曲线
title('离子间的作用力','FontSize',fs)  %显示标题
xlabel('\itx/x\rm_0','FontSize',fs)    %显示横坐标
ylabel('\itF/F\rm_0','FontSize',fs)    %显示纵坐标
axis([0,x2,-3,6])                      %曲线范围
grid on                                %加网格
legend('斥力','引力','合力')           %图例
text(0,0,'\itF\rm_0=\itb/x\rm_0^3','FontSize',fs)%显示力的单位

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(x,v,x,f,'LineWidth',2)           %画势能和力的曲线
plot(x,v,x,f,'--','LineWidth',2)       %画势能和力的曲线
title('氯化钠分子中离子的势能和相互作用力','FontSize',fs)%显示标题
xlabel('\itx/x\rm_0','FontSize',fs)    %显示横坐标
grid on                                %加网格
axis([0,x2,-0.6,1])                    %曲线范围
legend('势能','力')                    %图例
[vm,iv]=min(v);                        %求势能的极小值
xv=x(iv);                              %求极小值的横坐标
hold on                                %保持图像
stem(xv,vm,'--')                       %画峰值杆
text(xv,vm,['(',num2str(xv),',',num2str(vm),')'],'FontSize',fs)%显示极值
[fm,im]=min(f);                        %求力的极小值
xf=x(im);                              %求极小值的横坐标
stem(xf,fm,'--')                       %画峰值杆线
text(xf,fm/2,['(',num2str(xf),',',num2str(fm),')'],'FontSize',fs)%显示极值

