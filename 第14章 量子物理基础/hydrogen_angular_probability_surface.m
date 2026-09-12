%氢原子中电子概率角分布立体图
clear                                  %清除变量
l=input('请输入角量子数:');            %键盘输入角量子数
fs=16;                                 %字体大小
th=linspace(-pi/2,pi/2);               %仰角向量(th为矢径与x-y平面的夹角,pi/2-th才是轴向角)
m0=50;                                 %方位角的分点数
phi=linspace(0,2*pi,m0);               %方位角向量(phi为矢径与x-z平面的夹角)
x=sin(th);                             %自变量(cos(pi/2-th)的结果)
Y=legendre(l,x);                       %连带勒让德函数
tit='氢原子电子概率密度角分布剖面图';   %标题
for m=0:l                              %按级循环
    n2=(2*l+1)*factorial(l-m)/factorial(l+m)/4/pi;%归一化系数的平方
    w=n2*Y(m+1,:).^2;                  %概率密度
    wm=max(w);                         %概率密度极大值
    [wr,wz]=pol2cart(th,w);            %将概率密度的极坐标化为直角坐标
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    subplot(1,2,1)                     %取子图
    plot(wr,wz,'r',-wr,wz,'r','LineWidth',2)%画曲线
    title(tit,'FontSize',fs-4)         %显示标题
    axis equal off                     %使坐标间隔相等并隐轴
    text(0,0,['最大概率密度:',num2str(wm)])%显示最大概率密度
    WX=cos(phi)'*wr;                   %x坐标网格
    WY=sin(phi)'*wr;                   %y坐标网格
    WZ=ones(1,m0)'*wz;                 %概率网格
    WW=sqrt(WX.*WX+WY.*WY+WZ.*WZ);     %求各点的概率密度
    subplot(1,2,2)                     %取子图
    surf(WX,WY,WZ,WW)                  %画曲面
    shading flat                       %染色
    axis equal tight                   %使坐标间隔相等,框紧靠图
    box on                             %加框
    ss=['立体图(\itl\rm = ',num2str(l)];%连接角量子数
    if m==0                            %如果磁量子数为零
        ss=[ss,',\itm\rm = 0'];        %连接零磁量子数
    else                               %否则
        ss=[ss,',\itm\rm = \pm',num2str(m)];%连接正负磁量子数
    end                                %结束条件
    ss=[ss,')'];                       %连接右括号
    title(ss,'FontSize',fs)            %显示标题
    xlabel('\itx','FontSize',fs)       %显示x轴标签x
    ylabel('\ity','FontSize',fs)       %显示y轴标签y
    zlabel('\itz','FontSize',fs)       %显示z轴标签z
end                                    %结束循环

