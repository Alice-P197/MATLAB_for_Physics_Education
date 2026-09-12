%完全非弹性碰撞的速度和动能损失
clear                                  %清除变量
m=input('请输入两物体的质量m1和m2:');  %键盘输入两物体的质量
v1=input('请输入第一个物体的速度分量v1x和v1y:');%键盘输入第一个物体的速度分量
v2=input('请输入第二个物体的速度分量v2x和v2y:');%键盘输入第二个物体的速度分量
%m=[4,6];                               %参考值
%v1=[0.5,0];                            %参考值
%v2=[0.3,0.4];                          %参考值
%v2=[0.3,0.6];                          %参考值
vx=(m(1)*v1(1)+m(2)*v2(1))/(m(1)+m(2));%合速度的第一分量
vy=(m(1)*v1(2)+m(2)*v2(2))/(m(1)+m(2));%合速度的第二分量
v=sqrt(vx^2+vy^2);                     %合速度的大小
th=atan2(vy,vx);                       %合速度的方向
theta=th*180/pi;                       %化为度数
dt=m(1)*m(2)/(m(1)+m(2))/2*sum((v1-v2).^2);%计算损失的机械能
p1=m(1)*v1;                            %第一个动量
p2=m(2)*v2;                            %第二个动量
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
quiver(0,0,p1(1),p1(2),0,'LineWidth',2)%画第一个动量
grid on                                %加网格
axis equal                             %使坐标间隔相等
hold on                                %保持图像
quiver(0,0,p2(1),p2(2),0,'LineWidth',2)%画第二个动量
plot([p1(1),p1(1)+p2(1)],[p1(2),p1(2)+p2(2)],'--')%画平行四边形的一边
plot([p2(1),p1(1)+p2(1)],[p2(2),p1(2)+p2(2)],'--')%画平行四边形的另一边
quiver(0,0,p1(1)+p2(1),p1(2)+p2(2),0,'LineWidth',2)%画总动量
vv=(p1+p2)/(m(1)+m(2));                %合速度向量
quiver(0,0,vv(1),vv(2),0,'LineWidth',2)%画合速度
fs=16;                                 %字体大小
title('完全非弹性碰撞的速度和动能损失','FontSize',fs)%加标题
xlabel('\itp_x\rm/kg\cdotm\cdots^-^1','FontSize',fs)%动量px标签
ylabel('\itp_y\rm/kg\cdotm\cdots^-^1','FontSize',fs)%动量py标签
txt=[num2str(m(1)),'(',num2str(v1(1)),',',num2str(v1(2)),')'];%第一个物体的动量
text(m(1)*v1(1),m(1)*v1(2),txt,'FontSize',fs)%标记第一个物体的动量
txt=[num2str(m(2)),'(',num2str(v2(1)),',',num2str(v2(2)),')'];%第一个物体的动量
text(m(2)*v2(1),m(2)*v2(2),txt,'FontSize',fs)%标记第二个物体的动量
txt=[num2str(p1(1)+p2(1)),',',num2str(p1(2)+p2(2))];%两物体的合动量
text(p1(1)+p2(1),p1(2)+p2(2),txt,'FontSize',fs)%标记两物体的合动量
txt=['\itv\rm=',num2str(v),'m/s'];     %速度大小文本
text(vv(1),vv(2),txt,'FontSize',fs)    %标记速度大小
txt=['\it\theta\rm=',num2str(theta),'\circ'];%速度方向(角度)文本
text(0,0,txt,'FontSize',fs)            %标记角度
txt=['\Delta\itT\rm=',num2str(-dt),'J'];%损失的动能文本
text(0,p1(2)+p2(2),txt,'FontSize',fs)  %标记损失的动能

