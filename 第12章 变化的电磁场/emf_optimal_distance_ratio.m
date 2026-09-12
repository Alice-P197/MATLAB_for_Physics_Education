%电动势最平稳的距离与半径之比
clear                                  %清除变量
syms wt k                              %定义符号变量
e1=sin(wt)/(k^2+1+2*k*cos(wt));        %第一个符号电动势
e2=sin(wt)/(k^2+1-2*k*cos(wt));        %第二个符号电动势
de2=diff(e1+e2,2);                     %求电动势之和的二阶导数
s=subs(de2,wt,pi/2);                   %替换数值
dm=solve(s)'                           %求符号解
double(dm)                             %求数值
e=subs(k*(e1+e2),[wt,k],[pi/2,dm(3)])  %求平稳电动势
e=factor(e)                            %分解因式求最简符号解
e=double(e)                            %求数值
%d=[2.2 2.3 eval(dm(1)) 2.5 2.6];       %距离向量
d=[2.2:0.1:2.7,double(dm(3))];         %距离向量
rotating_coil_emf_fun(d)                            %调用函数画曲线
axis([0,pi,0.6,0.8])                   %观察峰值处的电动势曲线
text(pi/2,e,num2str(e),'FontSize',16)  %标记电动势
hold on                                %保持图像
plot(pi/2,e,'x','MarkerSize',12)       %画点

