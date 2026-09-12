%亥姆霍兹线圈中轴线上磁感应强度曲线
clear                                  %清除变量
syms z L                               %定义符号变量(变量L代表比值L/a)
B1=1/(1+(L+z)^2)^(3/2)                 %第一个磁感应强度
B2=1/(1+(L-z)^2)^(3/2)                 %第二个磁感应强度
dB2=diff(B1+B2,2)                      %求总磁感应强度的二阶导数
f=subs(dB2,z,0)                        %变量替换成0
l=solve(f,L)                           %求半长与半径之比的符号解
l=double(l(1))                         %取第一个数值
l=[2,1,0.5]*l;                         %半距离向量
zm=2;                                  %窗口的最大宽度
bm=2;                                  %窗口高度
dz=0.01;                               %增量
z=-zm:dz:zm;                           %窗口宽度向量
fs=16;                                 %字体大小
tit='亥姆霍兹线圈中轴线上磁感应强度合成曲线';%标题
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for i=1:length(l)                      %按刻度或距离循环
    subplot(3,1,i)                     %取子窗口
    plot([0;0],[0;bm])                 %画纵线
    grid on                            %加网格
    axis([-zm,zm,0,bm])                %设置坐标范围
    z0=l(i);                           %取距离
    b1=1./(1+(z-z0).^2).^(3/2);        %第一个磁感应强度向量
    b2=1./(1+(z+z0).^2).^(3/2);        %第二个磁感应强度向量
    B=[b1;b2;b1+b2];                   %连接磁感应强度矩阵
    hold on                            %保持图像
    plot(z,B,'LineWidth',2)             %画曲线
    text(-zm,bm-0.5,['2\itL\rm/\ita\rm=',num2str(2*z0)],'FontSize',fs)%显示距离
    if i==1,title(tit,'FontSize',fs),end%判断显示标题
    if i==2                            %对于第二图
        ylabel('\itB\rm/\itB\rm_0','FontSize',fs)%标记纵坐标
        text(-zm,1,'\itB\rm_0=\it\mu\rm_0\itI\rm/2\ita','FontSize',fs)%显示B0
        m=max(b1+b2);                  %求最大值
        text(0,m,['\itB\rm_{max}/\itB\rm_0=',num2str(m)],'FontSize',fs)%显示最大值
    end                                %结束条件
end                                    %结束循环
xlabel('\itz\rm/\ita','FontSize',fs)   %最后标记横坐标

