%麦克斯韦速率分布率的梯形直方杆图
clear                                  %清除变量
k=1.38E-23;                            %玻尔兹曼常数
m=32*1.66E-27;                         %氧气分子质量
f=inline('4*pi*(m/(2*pi*k*T))^1.5*v.^2.*exp(-v.^2*m/(2*k*T))',...
    'v','k','T','m');                  %分布函数内线函数
figure                                 %创建图形窗口
set(gcf,'Color','w','InvertHardcopy','off')%图窗背景纯白
set(gcf,'DefaultTextColor','k','DefaultTextFontName','Times New Roman',...
    'DefaultTextFontSize',16)%文字黑色Times New Roman16号
set(gcf,'DefaultAxesColor','w','DefaultAxesXColor','k','DefaultAxesYColor','k',...
    'DefaultAxesZColor','k','DefaultAxesBox','on')%坐标轴白底黑字加边框
set(gcf,'DefaultAxesFontName','Times New Roman','DefaultAxesFontSize',16)%坐标轴字体
grid on                                %加网格
hold on                                %保持图像
T=273;                                 %热力学温度
tit=['氧气分子数比例的速率分布直方图(',num2str(T),'K)'];%标题文本
title(tit,'FontSize',16)               %标题
xlabel('速率\itv\rm/m\cdots^-^1','FontSize',16)%横坐标
ylabel('速率分布函数\itf\rm(\itv\rm)/s\cdotm^-^1','FontSize',16)%纵坐标
dv=100;                                %速率间隔
vm=1200;                               %最大速率
%dv=128;                                %速率间隔(可使速率间隔为整数)
%vm=1280;                               %最大速率
c='krbgcmy';                           %颜色符号
for i=1:length(c)                      %按颜色循环
    v=dv/2:dv:vm-dv/2;                 %速率向量
    fv=f(v,k,T,m);                     %速率分布函数向量值
    stairs(v-dv/2,fv,c(i))             %画梯形折线
    stem(v+dv/2,fv,['.',c(i)])         %画直杆图
    txt=[num2str(fv'*dv*100,4),repmat('%',length(v),1)]%分子数比例(在命令窗口显示)
    [fm,ii]=max(fv);                   %求极大值和下标
    if i==1                            %当速率间隔为100m/s时
        h=text(v(1:10)-dv/2,fv(1:10),txt(1:10,:),'FontSize',16);%在图形窗口显示分子数比例
        h1=text(0,0,'','FontSize',16); %空字符串句柄
        h2=text(v(ii),fm,'','FontSize',16);%空字符串句柄
    else                               %否则
        set(h,'String','')             %删除图中比例文本
        s=sum(fv(1:2^(i-1)))*dv*100;   %统计0~100m/s的分子数比例
        set(h1,'String',[num2str(s,3),'%'])%显示0~100m/s的分子数比例
        txt=[num2str(v(ii)-dv/2),'~',num2str(v(ii)+dv/2)];%极大值范围文本
        txt=[txt,':',num2str(fm)];     %连接极大值
        set(h2,'String',txt)           %显示极大值和速度范围
    end                                %结束条件
    dv=dv/2;                           %减少速率间隔
    pause                              %暂停
end                                    %结束循环

