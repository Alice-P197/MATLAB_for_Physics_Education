%红光,绿光和蓝光以及白光的单缝夫琅禾费衍射条纹
clear                                  %清除变量
a=1e-4;                                %缝宽
l=[440,540,750]*1e-9;                  %波长向量
n=length(l);                           %向量个数
thm=1;                                 %最大角度
theta=-thm:0.001:thm;                  %角度向量
theta(theta==0)=eps;                   %零改为小量
th=theta*pi/180;                       %化为弧度
[THETA,L]=meshgrid(th,l);              %角度和波长矩阵
U=pi*a./L.*sin(THETA);                 %中间矩阵
I=(sin(U)./U).^2;                      %光强矩阵
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
%plot(theta,I,'LineWidth',2)            %画衍射曲线
plot(theta,I(1,:),theta,I(2,:),'--',theta,I(3,:),'-.','LineWidth',2)%画衍射曲线
fs=16;                                 %字体大小
xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
ylabel('\itI\rm/\itI\rm_0','FontSize',fs)%标记纵坐标
title('单缝夫琅禾费衍射不同波长的光强曲线','FontSize',fs)%标题
text(-thm,0.95,['缝宽\ita\rm=',num2str(a),'m'],'FontSize',fs)%缝宽文本
leg=[repmat('\it\lambda\rm=',n,1),num2str(l'*1e9),repmat('nm',n,1)];%图例
h=legend(leg);                         %标记图例
set(h,'FontSize',fs)                   %放大字体
grid on                                %加网格
tit={'红光','绿光','蓝光','白光'};     %标题
l=fliplr(l);                           %波长左右互换
M0=0;                                  %色值清零
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
for j=1:n+1                            %按波长循环
    subplot(n+1,1,j)                   %取子图
    if j<=n                            %如果不是最后一种情况
        M=zeros(1,length(th),3);       %1行若干列3页全零矩阵
        u=pi*a*sin(th)/l(j);           %计算中间值
        i=(sin(u)./u).^2;              %计算光强
        M(:,:,j)=i;                    %光强度放入颜色页中
        M0=M0+M;                       %累加色值
    else                               %否则
        M=M0;                          %取累加色值
    end                                %结束条件
    M=M*10;                            %色值放大
	M(M>1)=1;                          %大于1者作1处理
    image(M)                           %画图像
	axis off                           %隐轴
	title([tit{j},'的单缝夫琅禾费衍射条纹'],'FontSize',fs)%标题
end                                    %结束循环

