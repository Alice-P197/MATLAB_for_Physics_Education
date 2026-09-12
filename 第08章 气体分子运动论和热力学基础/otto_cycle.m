%奥托循环图
clear                                  %清除变量
i=5;                                   %自由度
gamma=(i+2)/i;                         %比热容比
kv=input('请输入绝热体积比V1/V2:');    %键盘输入体积比
kp=input('请输入等容压强比pc/pb:');    %键盘输入压强比
%kv=7;kp=3;                             %参考值
%kv=7;kp=2;                             %参考值
vb=1/kv;                               %b点的体积
pb=kv^gamma;                           %b点的压强
%pb=(1/vb)^gamma;                       %b点的压强(同上)
pc=kp*kv^gamma;                        %c点的压强
%pc=kp*pb;                              %c点的压强(同上)
pd=kp;                                 %d点的压强
%pd=pc*(vb)^gamma;                      %d点的压强(同上)

vab=linspace(1,vb);                    %a(d)到b(c)点的体积向量
pab=(1./vab).^gamma;                   %a点到b点绝热过程的压强
pcd=pc*(vb./vab).^gamma;               %c点到d点绝热过程的压强
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(vab,pab,[vb;vb],[pb;pc],'--',vab,pcd,'-.',[1;1],[pd;1],':',...
    'LineWidth',3)                     %画循环曲线
grid on                                %加网格
axis([0,1.1,0,pc+1])                   %图形范围
h=legend(char(['绝热压缩\itV\rm_a/\itV\rm_b=',num2str(kv)],...
    ['等容增压\itp\rm_c/\itp\rm_b=',num2str(kp)],...
    '绝热膨胀','等容减压'));            %加图例并取句柄
fs=16;                                 %字体大小
set(h,'FontSize',fs)                   %放大图例
title('奥托循环图','FontSize',fs)      %标题
xlabel('体积\itV/V\rm_a','FontSize',fs)%横坐标
ylabel('压强\itp/p\rm_a','FontSize',fs)%纵坐标
v=[1,vb,vb,1];                         %4个点的体积
p=[1,pb,pc,pd];                        %4个点的压强
hold on                                %保持图像
plot(v,p,'.')                          %画点
text(v,p,char(double('a')+[0:3]'),'FontSize',fs)%标记各点
o=[0,0,0,0];                           %零点坐标
plot([o;v],[p;p],'--')                 %画横虚线
text(o,p,num2str([1;pb;pc;pd],3),'FontSize',fs)%标记压强
v=(1+vb)/2;                            %平均体积
p=(1+pc)/2;                            %平均压强
eta=1-1/kv^(gamma-1);                  %热机效率
txt=['\it\eta\rm=',num2str(eta*100,3),'%'];%热机效率文本
text(v,p,['\it\eta\rm=',num2str(eta*100,3),'%'],...
    'FontSize',fs)                     %标记热机效率
a=i/2*(kv^(gamma-1)-1)*(kp-1);         %功
text(v,p-5,['\itA/A\rm_0=',num2str(a)],'FontSize',fs)%标记功
txt='\itA\rm_0=(\itM/\mu\rm)\itRT\rm_a';%功的单位
text(v,p-10,txt,'FontSize',fs)         %标记功的单位

