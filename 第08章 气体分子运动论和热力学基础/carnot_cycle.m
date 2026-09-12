%卡诺循环图
clear                                  %清除变量
i=3;                                   %自由度
gamma=(i+2)/i;                         %比热容比
t2=input('请输入温度比T2/T1:');        %键盘输入温度比
vb=input('请输入体积比Vb/Va:');        %键盘输入体积比
%t2=0.8;vb=1.6;                        %放热热源的温度T2/Ta,b点的体积Vb/Va(热机参考值)
%t2=1.5;vb=0.6;                        %放热热源的温度T2/Ta,b点的体积Vb/Va(致冷机参考值)
pb=1/vb;                               %b点的压强pb/pa
vd=(1/t2)^(1/(gamma-1));               %d点的体积Vd/Va
pd=(1/vd).^gamma;                      %d点的压强pd/pa
vc=vb*(1/t2)^(1/(gamma-1));            %c点的体积Vc/Va
%vc=vb*vd/va;                           %c点的体积Vc/Va(同上)
pc=pb*(vb/vc)^gamma;                   %c点的压强pc/pa

vab=linspace(1,vb);                    %a到b点的体积向量
pab=1./vab;                            %吸热等温过程的压强
vbc=linspace(vb,vc);                   %b到c点的体积向量
pbc=pb*(vb./vbc).^gamma;               %绝热过程的压强
vcd=linspace(vc,vd);                   %d到c点的体积向量
pcd=t2./vcd;                           %放热等温过程的压强
vda=linspace(vd,1);                    %d到a点的体积向量
pda=(1./vda).^gamma;                   %绝热过程的压强
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
plot(vab,pab,vbc,pbc,'--',vcd,pcd,'-.',vda,pda,':',...
    'LineWidth',3)                     %画循环曲线
grid on                                %加网格
legend(char('等温过程\itT\rm_1/\itT\rm_a=1','绝热过程',...
    ['等温过程\itT\rm_2/\itT\rm_a=',num2str(t2)],'绝热过程'))%加图例并取句柄
fs=16;                                 %字体大小
title('卡诺循环图','FontSize',fs)      %标题
xlabel('体积\itV/V\rm_a','FontSize',fs)%横坐标
ylabel('压强\itp/p\rm_a','FontSize',fs)%纵坐标
if t2<1                                %如果吸热的热源温度较高
    eta=1-t2;                          %热机效率
    txt=['\it\eta\rm_C=',num2str(eta*100,3),'%'];%热机效率文本
else                                   %否则
    omega=1/(t2-1);                    %致冷系数
    txt=['\it\omega\rm_C=',num2str(omega*100,3),'%'];%致冷系数文本
end                                    %结束条件
v=[1,vb,vc,vd];                        %4个点的体积
p=[1,pb,pc,pd];                        %4个点的压强
text(0,min(p)/2,txt,'FontSize',fs)     %标记文本
hold on                                %保持图像
stem(v,p,'--')                         %画杆线
text(v,p,char(double('a')+(0:3)'),'FontSize',fs)%标记各点
o=[0,0,0,0];                           %零点坐标
text(v,o,num2str(v',3),'FontSize',fs)  %标记体积
plot([o;v],[p;p],'--')                 %画横虚线
text(o,p,num2str([1;pb;pc;pd],3),'FontSize',fs)%标记压强

