%氢原子概率密度等值面(等值线法和旋转法)
clear                                  %清除变量
%maple('with(orthopoly)');              %调用正交多项式功能(只要启动一次)
n=input('请输入主量子数:');            %键盘输入主量子数
l=input('请输入角量子数:');            %键盘输入角量子数
rm=(n+2)^2;                            %最大极坐标
r=linspace(0,rm,50);                   %极径向量
if l==0,r=linspace(0,rm,200);end       %当角量子数为零时极径向量分得多些
th=linspace(0,pi/2,20);                %仰角向量
phi=linspace(0,pi,20);                 %方位角向量
[R,TH]=meshgrid(r,th);                 %极径和极角矩阵
[X,Z]=pol2cart(TH,R);                  %化为直角坐标(取z轴为极轴,pi/2-PHI为极角)
k=0.01;                                %等概率面系数(1%)
z=1;                                   %原子序数
%Wr=hydrogen_radial_probability_poly_fun(n,l,z,2*z/n*R);         %与径向有关的概率密度(非学生版用)
Wr=hydrogen_radial_probability_fun(n,l,z,2*z/n*R);         %与径向有关的概率密度(学生版用)
Y=legendre(l,sin(TH));                 %连带勒让德函数
fs=16;                                 %字体大小
cs='spdfghijklmno';                    %电子状态符号
for m=0:l                              %按级循环
    n2=(2*l+1)*factorial(l-m)/factorial(l+m)/4/pi;%归一化系数的平方
%    n2=(2*l+1)*prod(1:l-m)/prod(1:l+m)/4/pi;%归一化系数的平方(同上)
    if l==0                            %当角量子数为0时
        Wth=n2*Y.^2;                   %求角向概率密度
    else                               %否则
        Wth=n2*Y(m+1,:,:).^2;          %求角向概率密度
        Wth=squeeze(Wth);              %压缩弧维
    end                                %结束条件
    W=Wr.*Wth;                         %求概率密度
    wm=max(W(:));                      %概率密度极大值
    w=k*wm;                            %取概率密度
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    C=contour(X,Z,W,[w,w]);            %取概率密度等值线的二维坐标等
    plot3(0,0,0)                       %画一点删除等值线
    hold on                            %保持图像
    s=length(C);                       %等值线总长度
    i1=1;                              %第1列
    while 1                            %无限循环
        i2=C(2,i1);                    %取一条等概率密度线的数据个数
        rr=C(1,i1+1:i1+i2);            %取横坐标
        zz=C(2,i1+1:i1+i2);            %取纵坐标
        XX=cos(phi)'*rr;               %等概率密度面x坐标网格
        YY=sin(phi)'*rr;               %等概率密度面y坐标网格
        ZZ=ones(size(phi))'*zz;        %等概率密度面z坐标网格
        surf(XX,YY,ZZ,XX)              %画上半前曲面
        surf(XX,YY,-ZZ,XX)             %画下半前曲面
        surf(XX,-YY,-ZZ,XX)            %画下半后曲面
        i1=i1+i2+1;                    %下一条等值线数据个数的列数
        if i1>s,break,end              %如果数据取完则退出循环
    end                                %结束循环
    xlabel('\itx/a\rm_0','FontSize',fs)%显示x轴标签x
    ylabel('\ity/a\rm_0','FontSize',fs)%显示y轴标签y
    zlabel('\itz/a\rm_0','FontSize',fs)%显示z轴标签z
    ss=(['氢原子',num2str(n),cs(l+1),'态1%峰值概率密度曲面']);%标题的主要部分
%    ss=[ss,'(\itn\rm = ',num2str(n)];%连接主量子数
%    ss=[ss,',\itl\rm = ',num2str(l)];%连接角量子数
    if m==0                            %如果磁量子数为零
        ss=[ss,'(\itm\rm = 0)'];       %连接零磁量子数
    else                               %否则
        ss=[ss,'(\itm\rm = \pm',num2str(m),')'];%连接正负磁量子数
    end                                %结束条件
    title(ss,'FontSize',fs)            %显示标题
    grid on                            %加网格
    box on                             %加方框
    axis equal                         %使纵横间隔相等
%    text(0,0,0,['等值面的概率密度为:' num2str(w)],'FontSize',fs)%显示概率密度文本
end                                    %结束循环

