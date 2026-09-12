%氢原子电子云图
clear                                  %清除变量
n=input('请输入主量子数:');            %键盘输入主量子数
l=input('请输入角量子数:');            %键盘输入角量子数
if l>=n|l<0,return,end                 %不符合条件则退出
rm=(n+1)*(n+2);                        %最大极坐标
r=linspace(-rm,rm,400);                %坐标向量
[X,Z]=meshgrid(r);                     %坐标网格
[TH,R]=cart2pol(X,Z);                  %化为极坐标(取z轴为极轴,pi/2-TH为极角)
z=1;                                   %原子序数
Wr=hydrogen_radial_probability_fun(n,l,z,2/n*R);           %与径向有关的概率密度
Y=legendre(l,sin(TH));                 %连带勒让德函数
fs=16;                                 %字体大小
cs='spdfghijklmno';                    %电子状态符号
for m=0:l                              %按级循环
    n2=(2*l+1)*factorial(l-m)/factorial(l+m)/4/pi;%归一化系数的平方
    if l==0                            %当角量子数为0时
        Wth=n2*Y.^2;                 %求角向概率密度
    else                               %否则
        Wth=n2*Y(m+1,:,:).^2;        %求角向概率密度
        Wth=squeeze(Wth);              %压缩弧维
    end                                %结束条件
    W=Wr.*Wth;                         %求概率密度
    wm=max(W(:));                      %概率密度极大值
    R=rand(size(X)).*wm;               %随机数
    L=R<=W;                            %逻辑值
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    plot(X(L),Z(L),'.')                %画点
    axis([-rm,rm,-rm,rm])              %坐标范围
    axis equal off                     %使坐标间隔相等并隐轴
    ss=(['氢原子',num2str(n),cs(l+1),'态电子云图']);%标题
    if m==0                            %如果磁量子数为零
        ss=[ss,'(\itm\rm = 0)'];       %连接零磁量子数
    else                               %否则
        ss=[ss,'(\itm\rm = \pm',num2str(m),')'];%连接正负磁量子数
    end                                %结束条件
    title(ss,'FontSize',fs)            %显示标题
end                                    %结束循环

