%多普勒效应
clear                                  %清除变量
c=input('请选择(1只有接收者运动,2只有波源运动,3两者都运动):');%键盘输入数值选择
if c==1                                %对于第1种选择
    drr=0.02;drs=0;                    %接收者取步长,波源步长为零
    ts='波源静止接收者运动';           %标题
elseif c==2                            %对于第2种选择
    drr=0;drs=0.8;                     %波源取步长,接收者步长为零
    ts='波源运动接收者静止';           %标题
else                                   %否则
    drr=0.02;drs=0.8;                  %波源和接受者取步长
    ts='波源和接收者都运动';           %标题
end                                    %结束条件
figure                                 %建立图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
axis off equal                         %不显示坐标,使轴相等
rm=20;                                 %坐标范围(波的个数)
axis([-1,1,-1,1]*rm)                   %设定坐标范围
title([ts,'的多普勒效应'],'FontSize',20)%显示标题
hold on                                %保持图像
plot(0,0,'k*')                         %画波源
rectangle('Position',[-1,-1,2,2]*rm,'LineWidth',3)%画方框
rp=10;                                 %接收者的初始距离
plot(rp,0,'ro');                       %画点表示接收者的初始位置
hp=plot(rp,0,'ko');                    %取点的句柄表示接收者
rs=0;                                  %波源的初位置
r0=2;                                  %波阵面之间的距离
n=1;                                   %第1个波阵面 
th=linspace(0,2*pi);                   %角度向量
pause                                  %暂停
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
    hc(n)=plot(0,0,'LineWidth',1.2);   %波阵面的句柄(取一个点)
	r=0.1;                             %波阵面的相对初半径
    while r<r0                         %相对半径在两波阵面的距离之内时循环
        for i=1:n                      %按波阵面循环
            s=(i-1)*drs;               %波源的横坐标
            R=r0*(n-i)+r;              %波阵面的横坐标
            set(hc(i),'XData',s+R*cos(th),'YData',R*sin(th))%设置圆形波阵面
        end                            %结束循环
        set(hp,'XData',rp)             %设置右移点
        drawnow                        %更新屏幕
        pause(0.02)                    %延时
        r=r+0.1;                       %下一相对半径
        rp=rp-drr;                     %接收者左移后的距离
        plot([rp,rp+0.02],[0,0],'r')   %画轨迹
    end                                %结束循环 
    rs=rs+drs;                         %波源右移
    plot(rs,0,'k*')                    %画波源
    n=n+1;                             %增加一个波阵面
end                                    %结束循环

