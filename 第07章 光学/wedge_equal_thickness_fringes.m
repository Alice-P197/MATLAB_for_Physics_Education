%劈尖的等厚干涉条纹
clear                                  %清除变量
lambda=[750,540,440]*1e-9;             %波长
n=1.5;                                 %劈尖的折射率
k=10;                                  %明纹最高级次
dx=0.002;                              %明纹之间的距离
xm=k*dx;                               %劈尖的长度
x=linspace(0,xm,1000);                 %劈尖的长度向量
theta=lambda(1)/2/n/dx;                %劈尖的夹角
e=x*tan(theta);                        %劈尖的厚度向量
i1=cos(pi*(2*n*e/lambda(1)+1/2)).^2;   %红色反射光的相对光强
M=zeros(1,length(x),3);                %1行若干列3页全零矩阵
M(:,:,1)=i1;                           %矩阵的红色页赋值
figure                                 %开创图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
subplot(4,1,1)                         %选子图
image(M)                               %画红色干涉条纹
axis off                               %隐轴
tit=['(\ith\rm=',num2str(e(end)*1000),'mm'];%厚度文本
tit=[tit,',\it\theta\rm=',num2str(theta*180/pi),'\circ)'];%角度文本
fs=16;                                 %字体大小
title(['劈尖的等厚干涉红色条纹',tit],'FontSize',fs)%标题

i2=cos(pi*(2*n*e/lambda(2)+1/2)).^2;   %绿色反射光的相对光强
M=zeros(1,length(x),3);                %1行若干列3页全零矩阵
M(:,:,2)=i2;                           %矩阵的绿色页赋值
subplot(4,1,2)                         %选子图
image(M)                               %画绿色干涉条纹
axis off                               %隐轴
title('劈尖的等厚干涉绿色条纹','FontSize',fs)%标题
i3=cos(pi*(2*n*e/lambda(3)+1/2)).^2;   %蓝色反射光的相对光强
M=zeros(1,length(x),3);                %1行若干列3页全零矩阵
M(:,:,3)=i3;                           %矩阵的蓝色页赋值
subplot(4,1,3)                         %选子图
image(M)                               %画蓝色干涉条纹
axis off                               %隐轴
title('劈尖的等厚干涉蓝色条纹','FontSize',fs)%标题
M(:,:,2)=i2;                           %矩阵的绿色页赋值
M(:,:,1)=i1;                           %矩阵的红色页赋值
subplot(4,1,4)                         %选子图
image(M)                               %画彩色干涉条纹
axis off                               %隐轴
title('劈尖的等厚干涉彩色条纹','FontSize',fs)%标题

