%单缝夫琅禾费衍射强度与缝宽的关系曲线和干涉条纹
clear                                  %清除变量
l=700e-9;                              %红光波长
a=[0.01,0.1,1,10]*1e-3;                %缝宽向量
n=length(a);                           %向量个数
thm=1;                                 %最大度数
theta=-thm:0.001:thm;                  %角度向量
theta(theta==0)=eps;                   %零改为小量
[THETA,A]=meshgrid(theta*pi/180,a);    %角度和缝宽矩阵
U=pi*A/l.*sin(THETA);                  %中间矩阵
I=(sin(U)./U).^2;                      %光强矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,I,'LineWidth',2)            %画衍射曲线
plot(theta,I(1,:),theta,I(2,:),'--',theta,I(3,:),'-.',...
    theta,I(4,:),':','LineWidth',2)    %画衍射曲线
fs=16;                                 %字体大小
title('单缝夫琅禾费衍射不同缝宽的光强曲线','FontSize',fs)%标题
xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
txt=['波长\it\lambda\rm=',num2str(l*1e9),'nm'];%波长文本
text(-thm,0.95,txt,'FontSize',fs)        %标记波长文本
h=legend([repmat('\ita\rm=',n,1),num2str(a'),repmat('m',n,1)]);%标记图例
set(h,'FontSize',fs)                   %放大字体
grid on                                %加网格
c=linspace(0,1,64)';                   %颜色范围
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
ColorMap([c,c*0,c*0])                  %形成红色色图
for j=1:n                              %按缝宽循环
    subplot(n,1,j)                     %取子图
    image(I(j,:)*1000)                 %画图像
    axis off                           %隐轴
    title(['缝宽:',num2str(a(j)),'m'],'FontSize',fs)%标题
end                                    %结束循环

