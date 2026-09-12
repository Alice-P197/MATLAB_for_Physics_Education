%两束相干光的干涉强度和干涉条纹函数
function fun(v)
n=3;                                   %条纹的最高阶数
dphi=0.01;                             %相差
phi=(-1:dphi:1)*n*2*pi;                %相差向量
i=1+v*cos(phi);                        %干涉的相对强度
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %取子图
plot(phi,i,'LineWidth',2)              %画曲线
grid on                                %加网格
set(gca,'XTick',(-n:n)*2*pi)           %改水平刻度
axis([-n*2*pi,n*2*pi,0,2])             %曲线范围
fs=16;                                 %字体大小
title('光的干涉强度分布','FontSize',fs)%标题
xlabel('相差\Delta\it\phi','FontSize',fs)%x标签
ylabel('相对强度\itI\rm/(\itI\rm_1+\itI\rm_2)','FontSize',fs)%y标签
txt=['\itV\rm=',num2str(v)];           %可见度值文本
text(0,1,txt,'FontSize',fs)            %显示文本
txt=['\itI\rm_{max}=',num2str(max(i))];%最大干涉光强文本
text(-n*2*pi,1+v,txt,'FontSize',fs)    %显示文本
txt=['\itI\rm_{min}=',num2str(min(i))];%最小干涉光强文本
text(-n*2*pi,1-v,txt,'FontSize',fs)    %显示文本
subplot(2,1,2)                         %取子图
r=linspace(0,1,64)';                   %红色的范围
g=zeros(size(r));                      %不取绿色
b=zeros(size(r));                      %不取蓝色
ColorMap([r,g,b]);                     %形成色图
image(i*32)                            %画红色条纹(乘以32放大强度,最大为64)
axis off                               %隐轴
title('光的干涉条纹','FontSize',fs)    %标题

    