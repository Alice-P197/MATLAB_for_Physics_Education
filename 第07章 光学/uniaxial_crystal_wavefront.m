%单轴晶体的子波波阵面
clear                                  %清除变量
th=linspace(0,2*pi,300);               %角度向量
ve=input('请输入晶体中e光波速与o光波速之比ve/vo:');%键盘输入晶体的波速之比
tc='正晶体';                           %标题一部分
if ve>1 tc='负晶体';end                %判断修改标题一部分
%ve=0.6;                                %正晶体的e光波速参考值
%ve=1.6;                                %负晶体的e光波速参考值
[X0,Y0,Z0]=sphere(50);                 %球面坐标
Z0(X0<0&Y0<0)=nan;                     %割去1/4
[X1,Y1,Z1]=ellipsoid(0,0,0,ve,ve,1,50);%椭球面坐标
Z1(X1<0&Y1<0&Z1>0)=nan;                %割去1/8
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
mesh(X1,Y1,Z1)                         %画椭球网格面
hidden off                             %不隐藏背面图形
hold on                                %保持图像
surf(X0,Y0,Z0)                         %画球面
plot3([0,0],[0,0],[-1.2,1.2],'r','LineWidth',2)%画光轴
axis off equal                         %隐轴并使坐标间隔相等
shading interp                         %染色
fs=16;                                 %字体大小
title([tc,'的子波立体波阵面'],'FontSize',fs)%显示标题
txt=['\itv\rm_e/\itv\rm_o=',num2str(ve)];%波速之比文本
text(-1,1,1,txt,'FontSize',fs)         %显示波速之比

figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot([0,0],[-1.1,1.1],'r','LineWidth',2)%画光轴
hold on                                %保持图像
plot(0,0,'o')                          %画原点
plot([0,1],[0,0],1,0,'>')              %画o光传播线
plot([0,-ve],[0,0],'k',-ve,0,'k<')     %画e光传播线
axis([-ve,ve,-1.1,1.1])                %坐标范围
axis off equal                         %隐轴并使坐标间隔相等
title([tc '的子波波阵面'],'FontSize',fs)%显示标题
text(1,0,'\itv\rm_o','FontSize',fs)    %标记o光速度
text(-ve,0,'\itv\rm_e','FontSize',fs)  %标记e光速度
text(-1,1,txt,'FontSize',fs)           %显示波速之比
pause                                  %暂停
h1=plot(0,0,'LineWidth',2,'EraseMode','Xor');%o光的句柄
h2=plot(0,0,'m','LineWidth',2,'EraseMode','xor');%e光的句柄
r=0:0.01:1;                            %半径向量
for i=1:length(r)                      %按半径循环
    x0=r(i)*cos(th);                   %圆的横坐标
    y0=r(i)*sin(th);                   %圆的纵坐标
    set(h1,'XData',x0,'YData',y0)      %设置o光坐标
    set(h2,'Xdata',ve*x0,'YData',y0)   %设置e光坐标
    pause(0.05)                        %延时
end                                    %结束循环

