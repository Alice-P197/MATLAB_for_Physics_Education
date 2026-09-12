%冲击波的产生
clear                                  %清除变量
vs=input('请输入波源速度与声速之比(>1):');%键盘输入波源速度
%vs=1.5;2;                              %参考值
if vs<=1,return,end                    %不大于1则返回
a=asin(1/vs)*180/pi;                   %马赫角
x1=-10;                                %横坐标左边界
x2=20;                                 %横坐标右边界
ym=10;                                 %纵坐标范围
rs=0;                                  %波源的初位置
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(0,0,'k.')                         %画波源
axis([x1,x2,-ym,ym])                   %设定坐标范围
axis equal off                         %使坐标间隔相等,不显示坐标
title('冲击波的产生','FontSize',20)    %显示标题
txt=['\itv\rm_S/\itv\rm=',num2str(vs)];%速度比文本
text(x1,ym,txt,'FontSize',16)          %显示速度比
txt=['\it\alpha\rm=',num2str(a),'\circ'];%连接马赫角文本
text(x1,-ym,txt,'FontSize',16)         %显示速度比和马赫角
th=linspace(0,2*pi);                   %角度向量
hold on                                %保持图像
hl1=plot(0,0,'m','LineWidth',2);       %马赫锥剖面的上斜线句柄
hl2=plot(0,0,'m','LineWidth',2);       %马赫锥剖面的下斜线句柄
pause                                  %暂停
n=1;                                   %第1个波阵面 
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
    hc(n)=plot(0,0,'LineWidth',2);     %点的句柄(以便画圆)
    for r=0.1:0.1:1                    %按相对距离循环
        for i=1:n                      %按波阵面循环
            s=(i-1)*vs;                %波源的横坐标
            rm=n-i+r;                  %波阵面的半径
            set(hc(i),'XData',s+rm*cos(th),'YData',rm*sin(th))%设置圆形波阵面
        end                            %结束循环
        rm=n-1+r;                      %最大圆的半径
        x=rm*vs;                       %锥前的横坐标
        y=rm/sqrt(1-1/vs^2);           %锥尾的纵坐标
        set(hl1,'XData',[0,x],'YData',[y,0])%设置上斜线
        set(hl2,'XData',[0,x],'YData',[-y,0])%设置下斜线
        drawnow                        %更新屏幕
        pause(0.1)                     %延时
    end                                %结束循环 
    rs=rs+vs;                          %波源右移
    plot(rs,0,'k.')                    %画波源
    n=n+1;                             %增加一个波阵面
end                                    %结束循环

