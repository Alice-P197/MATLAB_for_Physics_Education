%渥拉斯顿棱镜
clear                                  %清除变量
no=1.658;                              %o光折射率
ne=1.486;                              %e光折射率
i=45*pi/180;                           %入射角
reo=asin(ne/no*sin(i));                %左e光右o光的折射角
io=i-reo;                              %o光的入射角
r2=asin(no*sin(io));                   %o光在空气中的折射角
roe=asin(no/ne*sin(i));                %左o光右e光的折射角
ie=roe-i;                              %e光的入射角
r1=asin(ne*sin(ie));                   %e光在空气中的折射角
theta=(r1+r2)*180/pi;                  %空气中相互垂直的光的夹角
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
fill([-1,1,-1],[1,-1,-1],'y')          %画光轴平行的左下棱镜
fs=16;                                 %字体大小
text(0,-1,'光轴平行平面','FontSize',fs)%标记文本
hold on                                %保持图像
fill([-1,1,1],[1,-1,1],'c')            %画光轴垂直的右上棱镜
plot([0,0],[-0.2,-0.8],'-.','LineWidth',2)%画平行平面的光轴
plot(0,0.8,'.',0,0.8,'o')              %画垂直平面的光轴
text(0,1,'光轴垂直平面','FontSize',fs) %标记文本
axis equal                             %使坐标间隔相等
title('渥拉斯顿棱镜的光路','FontSize',fs)%显示标题
plot([0.5,-0.5],[0.5,-0.5],'--','LineWidth',2)%画棱镜界面的法线
plot([-1.5,0],[0,0],'>-','LineWidth',2)%画入射光
text(-1.5,0,'自然光','FontSize',fs)    %标记文本
text(-1,0,'线偏振光','FontSize',fs)    %标记文本
yo=tan(io);                            %o光在棱镜中的偏移量
plot([0,1],[0,yo],'r','LineWidth',2)   %画o光在右上棱镜中的折射光
txt=[num2str(reo*180/pi,3),'\circ,',num2str(roe*180/pi,3),'\circ'];%文本
text(0,0.2,txt,'FontSize',fs)          %标记两个折射角
plot([0.5,1.5],[yo,yo],'--','LineWidth',2)%画棱镜右边界的法线
text(0.5,yo,[num2str(io*180/pi,3),'\circ'],'FontSize',fs)%标记o光入射角
yyo=0.5*tan(r2);                       %o光在空气中的偏移量
plot([1,1.5],[yo,yo+yyo],'r->','LineWidth',2)%画o光在空气中的折射光
txt=[num2str(r2*180/pi,3),'\circ'];    %文本
text(1.5,yo+yyo,txt,'FontSize',fs)     %标记o光折射角
text(1,yo+yyo+0.1,'平行平面的光','FontSize',fs)%标记文本
plot([1,0.5],[yo,yo-yyo],'r--','LineWidth',2)%画o光在晶体中的延长线

ye=tan(ie);                            %e光在棱镜中的偏移量
x=linspace(0,1,10);                    %e光在棱镜中的横坐标
y=linspace(0,-ye,10);                  %e光在棱镜中的纵坐标
plot(x,y,'m.-','LineWidth',2)          %画e光在右上棱镜中的折射光
%plot([0,1],[0,-ye],'m')                %画e光在右上棱镜中的折射光
text(0.5,-ye,[num2str(ie*180/pi,3),'\circ'],'FontSize',fs)%标记e光入射角
plot([0.5,1.5],-[ye,ye],'--','LineWidth',2)%画棱镜右边界的法线
yye=0.5*tan(r1);                       %e光在空气中的偏移量
x=linspace(1,1.5,5);                   %e光在空气中的横坐标
y=linspace(-ye,-(ye+yye),5);           %e光在空气中的纵坐标
plot(x,y,'m.-',1.5,-(ye+yye),'m>','LineWidth',2)%画e光在空气中的折射光
%plot([1,1.5],-[ye,ye+yye],'m->')       %画e光在空气中的折射光
txt=[num2str(r1*180/pi,3),'\circ'];    %文本
text(1.5,-(ye+yye),txt,'FontSize',fs)  %标记e光折射角
text(1,-(ye+yye+0.1),'垂直平面的光','FontSize',fs)%标记文本
plot([1,0.5],-[ye,ye-yye],'m--','LineWidth',2)%画e光在晶体中的延长线
text(1,0,['夹角:',num2str(theta,3),'\circ'],'FontSize',fs)%标记两光的夹角

