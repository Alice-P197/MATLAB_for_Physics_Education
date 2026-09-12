%氢原子径向概率密度曲线
clear                                  %清除变量
n=input('请输入主量子数:');            %键盘输入主量子数
rm=(n+1)^2*2;                          %最大坐标
r=linspace(0,rm);                      %坐标向量
z=1;                                   %原子序数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
grid on                                %加网格
fs=16;                                 %字体大小
title('氢原子中电子径向概率密度曲线','FontSize',fs)%显示标题
xlabel('\itr/a\rm_0','FontSize',fs)    %显示x轴标签
ylabel('\itw_n_l\rm(\itr\rm)\ita\rm_0','FontSize',fs)%显示y轴标签
c1='ods^ph>';                          %符号字符串
c2='bgrcmyk';                          %颜色字符串
hold on                                %保持图像属性
%W=[];                                  %概率密度矩阵置空
for l=0:n-1                            %按角量子数循环
    nl=n+l;                            %最大量子数
    ll1=2*l+1;                         %磁量子数的个数
    nl1=n-l-1;                         %剩余量子数
    c=-factorial(nl)^2/factorial(ll1)/factorial(nl1);%零次项系数
%    p=-prod(1:nl)^2/prod(1:ll1)/prod(1:nl1);%零次项系数(低版本用)
%----------------------------------------------------------
    p=c;                               %系数向量的初值
    for i=1:nl1                        %从1开始循环
        c=-c*(nl1+1-i)/(ll1+i)/i;      %计算拉盖尔多项式系数
        p=[c,p];                       %按降序排列连接系数向量
    end                                %结束循环
    la=polyval(p,2*z*r/n);             %连带拉盖尔多项式函数值
%----------------------------------------------------------
% la=c;                                  %初值
% for i=1:nl1                            %从1开始循环
%     c=-c*(nl1+1-i)/(ll1+i)/i;          %计算拉盖尔多项式系数
%     la=la+c*(2*z*r/n).^i;              %累加拉盖尔多项式之值
% end                                    %结束循环
%----------------------------------------------------------
    s=la.*exp(-z*r/n).*(2*z*r/n).^(l+1);%计算径向波函数的变量部分
    mm=z*factorial(nl1)/n^2/factorial(nl)^3;%归一化常量的平方
%    n_nl=prod(1:nl1)/n^2/prod(1:nl)^3;%归一化常量的平方(低版本用)
    w=mm*s.^2;                         %计算概率密度
%    W=[W;w];                           %连接径向概率密度
    plot(r,w,[c1(l+1),c2(l+1),'-'])    %画概率密度曲线
end                                    %结束循环
%plot(r,W,'LineWidth',2)                %画曲线族
legend([repmat('角量子数\itl\rm=',n,1),num2str((0:n-1)')])%图例
text(0,max(w)/2,['主量子数\itn\rm=',num2str(n)],'FontSize',fs)%显示主量子数

