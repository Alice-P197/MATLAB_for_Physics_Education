%狄塞尔循环图
clear                                  %清除变量
i=5;                                   %自由度
gamma=(i+2)/i;                         %比热容比
k1=input('请输入绝热压缩比V0/V1:');    %键盘输入体积比
k2=input('请输入绝热膨胀比V0/V2:');    %键盘输入压强比
%k1=15;k2=5;                           %膨胀比和压缩比(参考值)
vb=1/k1;                               %b点的体积
pb=k1.^gamma;                          %b点的压强
pc=pb;                                 %c点的压强
vd=1;                                  %d点的体积
%k2=k1^(1/gamma);             %压缩比(最低和最高温度不变的最大功的压缩比)
vc=1/k2;                               %c点的体积
pd=(k1/k2)^gamma;                      %d点的压强
%pd=pc/k2^gamma;                        %d点的压强(同上)

vab=linspace(1,vb);                    %a到b点的体积比向量
pab=(1./vab).^gamma;                   %a到b点的压强向量
vcd=linspace(vc,vd);                   %c到d点的体积比向量
pcd=pd*(vd./vcd).^gamma;               %c到d点的压强向量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(vab,pab,[vb;vc],[pb;pc],'--',vcd,pcd,'-.',[vd;1],[pd;1],':',...
    'LineWidth',3)                     %画循环曲线
h=legend(char(['绝热压缩\itV\rm_a/\itV\rm_b=',num2str(k1)],...
    ['等压膨胀\itp\rm_c/\itp\rm_a=',num2str(pc)],...
    ['绝热膨胀\itV\rm_a/\itV\rm_c=',num2str(k2)],...
    ['等容减压\itp\rm_d/\itp\rm_a=',num2str(pd)]));%加图例并取句柄
fs=16;                                 %字体大小
set(h,'FontSize',fs)                   %放大图例
grid on                                %加网格
title('狄塞尔循环图','FontSize',fs)    %标题
xlabel('体积\itV/V\rm_a','FontSize',fs)%横坐标
ylabel('压强\itp/p\rm_a','FontSize',fs)%纵坐标
v=[1,vb,vc,vd];                        %4个点的体积
p=[1,pb,pc,pd];                        %4个点的压强
hold on                                %保持图像
plot(v,p,'.')                          %画点
text(v,p,char(double('a')+[0:3]'),'FontSize',fs)%标记各点
eta=1-(1/k2^gamma-1/k1^gamma)/gamma/(1/k2-1/k1);%热机效率
v=(1+vb)/2;                            %平均体积
p=(1+pb)/2;                            %平均压强
text(v,p,['\it\eta\rm=',num2str(eta*100,3),'%'],...
    'FontSize',fs)                     %标记热机效率
a=i/2*k1^gamma*(gamma*(1/k2-1/k1)-(1/k2^gamma-1/k1^gamma));%功
text(v,p-5,['\itA/A\rm_0=',num2str(a)],...
    'FontSize',fs)                     %标记功
txt='\itA\rm_0=(\itM/\mu\rm)\itRT\rm_a';%功的单位
text(v,p-10,txt,'FontSize',fs)         %标记功的单位

