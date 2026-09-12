%氢原子概率密度强度曲面
clear                                  %清除变量
%maple('with(orthopoly)');              %调用正交多项式功能(只要启动一次)
n=input('请输入主量子数:');            %键盘输入主量子数
l=input('请输入角量子数:');            %键盘输入角量子数
if l>=n|l<0,return,end                 %不符合条件则退出
rm=(n+1)*(n+2);                        %最大极坐标
if l==0                                %当角量子数为零时
    rm=n*(n+1);                        %修改最大极坐标
    if n==1                            %如果主量子数也为零
        rm=(n+1)*(n+2);                %再修改最大极坐标(以便比较1s和2s态)
    end                                %结束条件
end                                    %结束条件
r=0:0.1:rm;                            %坐标向量
[X,Z]=meshgrid(r);                     %坐标网格
[TH,R]=cart2pol(X,Z);                  %化为极坐标(取z轴为极轴,pi/2-TH为极角)
z=1;                                   %原子序数
%Wr=hydrogen_radial_probability_poly_fun(n,l,z,2*z/n*R);         %与径向有关的概率密度(非学生版用)
Wr=hydrogen_radial_probability_fun(n,l,z,2*z/n*R);         %与径向有关的概率密度(学生版用)
Y=legendre(l,sin(TH));                 %连带勒让德函数
fs=16;                                 %字体大小
cs='spdfghijklmno';                    %电子状态符号
zl='\itw_{nlm}\rm(\itr\rm,\it\theta\rm,\it\phi\rm)\ita\rm_0^3';%z轴标签
for m=0:l                              %按级循环
    n2=(2*l+1)*factorial(l-m)/factorial(l+m)/4/pi;%归一化系数的平方
    if l==0                            %当角量子数为0时
        Wth=n2*Y.^2;                   %求角向概率密度
    else                               %否则
        Wth=n2*Y(m+1,:,:).^2;          %求角向概率密度
        Wth=squeeze(Wth);              %压缩弧维
    end                                %结束条件
    W=Wr.*Wth;                         %求概率密度
    wm=max(W(:));                      %概率密度极大值
    wc=(0.01:0.1:0.91)*wm;             %等值线的概率密度
    figure                             %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
    contour3(X,Z,W,wc,'r')             %画第1象限三维等值线
    hold on                            %保持图像
    contour3(-X,Z,W,wc,'r')            %画第2象限三维等值线
    contour3(-X,-Z,W,wc,'r')           %画第3象限三维等值线
    contour3(X,-Z,W,wc,'r')            %画第4象限三维等值线
    surf(X,Z,W)                        %画第1象限曲面
    surf(-X,Z,W)                       %画第2象限曲面
    surf(-X,-Z,W)                      %画第3象限曲面
    surf(X,-Z,W)                       %画第4象限曲面
    shading interp                     %用插值法染色
    colorbar                           %画色棒
    axis tight                         %在数据范围内设置轴限
    box on                             %加框
    text(-rm,rm,wm,['最大概率密度:',num2str(wm)],'FontSize',fs)%显示最大概率密度
    ss=(['氢原子',num2str(n),cs(l+1),'态电子概率密度']);%标题的主要部分
%     view(2)                           %俯视电子云图
%     ss=(['氢原子',num2str(n),cs(l+1),'态电子云图']);%标题的主要部分
    if m==0                            %如果磁量子数为零
        ss=[ss,'(\itm\rm = 0)'];        %连接零磁量子数
    else                               %否则
        ss=[ss,'(\itm\rm = \pm',num2str(m),')'];%连接正负磁量子数
    end                                %结束条件
    xlabel('\itx/a\rm_0','FontSize',fs)%显示x轴标签
    ylabel('\itz/a\rm_0','FontSize',fs)%显示y轴标签
    zlabel(zl,'FontSize',fs)           %显示z轴标签
    title(ss,'FontSize',fs)            %显示标题
end                                    %结束循环

