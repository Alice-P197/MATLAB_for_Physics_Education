%康普顿散射
clear                                  %清除变量
phi=0:10:180;                          %散射角向量
p=phi*pi/180;                          %化为弧度
dl=2*sin(p/2).^2;                      %波长的变化量
f=figure;                              %创建图形窗口
plot(phi,dl,'-o')                      %画波长的增量曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('康普顿散射光子的波长的增量','FontSize',fs)%标题
xlabel('\it\phi\rm/\circ','FontSize',fs)%横坐标
ylabel('\Delta\it\lambda/\lambda\rm_C','FontSize',fs)%纵坐标
m0=9.1e-31;                            %电子质量
h=6.63e-34;                            %普朗克常数
c=3e8;                                 %光速
lc=h/m0/c;                             %电子的康普顿波长
text(0,1,['\it\lambda\rm_C=',num2str(lc),'/m'],'FontSize',fs)%显示波长文本

l0=0.8:0.2:1.2;                        %入射X射线的波长与康普顿波长的倍数
n=length(l0);                          %波长个数
[L0,PHI]=meshgrid(l0,p);               %倍数和角度矩阵
E=2*sin(PHI/2).^2./L0./(L0+2*sin(PHI/2).^2);%电子获得的能量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %选子图
%plot(phi,E)                            %画曲线族(细线)
plot(phi,E(:,1),'o-',phi,E(:,2),'d-',phi,E(:,3),'s-')%画曲线族
grid on                                %加网格
title('康普顿散射反冲电子获得的能量','FontSize',fs)%标题
xlabel('\it\phi\rm/\circ','FontSize',fs)%横坐标
ylabel('\Delta\itE/m\rm_0\itc\rm^2','FontSize',fs)%纵坐标
legend([repmat('\it\lambda\rm_0/\it\lambda\rm_C=',n,1),num2str(l0')],4)%图例

L=L0+2*sin(PHI/2).^2;                  %散射后的波长
P=sqrt(1./L0.^2+1./L.^2-2./L./L0.*cos(PHI));%电子的动量
%P=sqrt(L.^2+L0.^2-2*L.*L0.*cos(PHI))./L0./L;%电子的动量
%P=sqrt((L-L0).^2+2*L.*L0.*(1-cos(PHI)))./L0./L;%同上
%P=2*sin(PHI/2).*sqrt(L.*L0+sin(PHI/2).^2)./L0./L;%同上
%P=2*sin(PHI/2)./L0./(L0+2*sin(PHI/2).^2).*sqrt(L0.^2+(2*L0+1).*sin(PHI/2).^2);%电子的动量(
subplot(2,1,2)                         %选子图
%plot(phi,P)                            %画曲线族(细线)
plot(phi,P(:,1),'o-',phi,P(:,2),'d-',phi,P(:,3),'s-')%画曲线族
grid on                                %加网格
title('康普顿散射反冲电子的动量','FontSize',fs)%标题
xlabel('\it\phi\rm/\circ','FontSize',fs)%横坐标
ylabel('\itp/m\rm_0\itc','FontSize',fs)%纵坐标
legend([repmat('\it\lambda\rm_0/\it\lambda\rm_C=',n,1),num2str(l0')],4)%图例
%pause                                  %暂停
s1='1/l0-1/(dl+l0)+1-1/sqrt(1-v^2)';   %第1个方程
s2='1/l0^2+1/(dl+l0)^2-2/l0/(dl+l0)*cos(phi)-v^2/(1-v^2)';%第2个方程
s=solve(s1,s2,'dl','v')                %求方程的符号解
dl=subs(s.dl(1),'phi',p);              %数值替换符号

V=abs(subs(s.v(1),{'phi','l0'},{PHI,L0}));%数值替换符号
E=1./sqrt(1-V.^2)-1;                   %电子获得的能量
P=V./sqrt(1-V.^2);                     %电子的动量
hold on                                %保持图像
plot(phi,P,'.')                        %重画动量曲线(点)
subplot(2,1,1)                         %选子图
hold on                                %保持图像
plot(phi,E,'.')                        %重画能量曲线(点)
figure(f)                              %重开图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
hold on                                %保持图像
plot(phi,dl,'.')                       %重画波长的增量曲线(点)

