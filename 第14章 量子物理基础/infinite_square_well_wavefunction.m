%一维无限深势阱中粒子波函数和概率密度曲线
clear                                  %清除变量
nn=input('请输入能级个数:');           %键盘输入能级个数
%nn=4;                                  %参考值
n=1:nn;                                %整数向量
x=0:0.01:1;                            %坐标向量
[X,N]=meshgrid(x,n);                   %坐标和波的个数矩阵
e=n.^2;                                %能级
z=zeros(size(n));                      %零向量
o=ones(size(n));                       %1向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(1,2,1)                         %取子窗口
plot([z;o],[e;e])                      %画能级水平线
grid on                                %加网格
PSI=sqrt(2)*sin(N*pi.*X);              %计算波函数矩阵
E=n'.^2*ones(size(x));                 %能级矩阵
hold on                                %保持图像
plot(x,E+PSI,'LineWidth',2)            %画波函数实线
plot(x,E-PSI,'--','LineWidth',2)       %画波函数虚线
fs=16;                                 %字体大小
title('无限深势阱中粒子的波函数','FontSize',fs)%标题
xlabel('\itx\rm/\ita','FontSize',fs)   %x标签
ylabel('\it\psi_n\rm(\itx/a\rm)','FontSize',fs)%y标签
text(o*0.5,e,[repmat('\itn\rm=',nn,1),num2str(n')],'FontSize',fs)%标记整数

PSI=PSI.^2;                            %计算概率密度矩阵
subplot(1,2,2)                         %取子窗口
plot([z;o],[e;e])                      %画能级水平线
grid on                                %加网格
hold on                                %保持图像
plot(x,E+PSI,'LineWidth',2)            %画概率密度
txt=[repmat('\itE_n\rm=',nn,1),num2str(n.^2'),repmat('\itE\rm_1',nn,1)];%能量
text(o*0.5,e,txt,'FontSize',fs)        %标记能量
title('概率密度','FontSize',fs)        %标题
xlabel('\itx\rm/\ita','FontSize',fs)   %x标签
ylabel('|\it\psi_n\rm(\itx/a\rm)|^2','FontSize',fs)%y标签
text(0,0,'\itE\rm_1=\ith\rm^2/8\itma\rm^2','FontSize',fs)%显示能量单位

