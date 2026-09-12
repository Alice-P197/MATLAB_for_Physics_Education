%均匀带电圆柱壳的电场强度和电势 
clear                                  %清除变量
r0=input('请输入内半径与外半径之比(大于等于0小于等于1):');%键盘输入半径比
if r0==1,r0=1-eps;end                  %如果是1则改小一点
rm=4;                                  %最大距离与外半径之比
dr=0.01;                               %距离间隔
rA=0:dr:r0;                            %腔内距离向量
uA=((1-r0^2)/2+r0^2*log(r0))/(1-r0^2); %腔内电势向量
uA=ones(size(rA))*uA;                  %腔内电势
eA=-diff(uA)/dr;                       %根据电势梯度求腔内场强
rB=r0:dr:1;                            %壳内距离向量
uB=((1-rB.^2)/2+r0^2*log(rB))/(1-r0^2);%壳内电势
eB=-diff(uB)/dr;                       %根据电势梯度求壳内场强
rC=1:dr:rm;                            %壳外距离向量
uC=-log(rC);                           %壳外电势
eC=-diff(uC)/dr;                       %根据电势梯度求壳外场强
r=[rA,rB,rC];                          %连接距离
u=[uA,uB,uC];                          %连接电势
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(2,1,1)                         %子图
plot(rA(2:end),eA,rB(2:end),eB,rC(2:end),eC,'LineWidth',2)%画电场强度曲线
grid on                                %加网格
fs=16;                                 %字体大小
title('均匀带电圆柱壳的电场强度','FontSize',fs)%显示标题
xlabel('距离\itr/R\rm','FontSize',fs)  %显示横坐标
ylabel('电场强度\itE/E\rm_0','FontSize',fs)%显示纵坐标
txt='\itE\rm_0=2\itk\lambda/R';        %电场强度的单位文本
text(0,0.9,txt,'FontSize',fs)          %标记电场强度单位
txt=['\itR\rm_0/\itR\rm=',num2str(r0)];%外内半径比
text(2,0.9,txt,'FontSize',fs)          %标记外内半径比
eA=zeros(size(rA));                    %用公式求腔内场强
eB=(rB.^2-r0^2)./rB/(1-r0^2);          %用公式求壳内场强
eC=1./rC;                              %用公式求壳外场强
hold on                                %保持图像
plot(rA,eA,'.',rB,eB,'.',rC,eC,'.')    %补画电场强度曲线

subplot(2,1,2)                         %子图
plot(rA,uA,rB,uB,rC,uC,'LineWidth',3)  %画电势曲线
grid on                                %加网格
title('均匀带电圆柱壳的电势','FontSize',fs)%显示标题
xlabel('距离\itr/R','FontSize',fs)     %显示横坐标
ylabel('电势\itU/U\rm_0','FontSize',fs)%显示纵坐标
txt='\itU\rm_0=2\itk\lambda';          %电势的单位文本
text(0,-0.5,txt,'FontSize',fs)         %标记电势单位
text(0,-1,'取柱的表面为电势零面','FontSize',fs)%文本

