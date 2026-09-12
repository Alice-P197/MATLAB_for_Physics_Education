%阻尼运动的二阶微分方程的函数
function f=fun(t,x,flag,b)
f=[ x(2);                              %速度
   -2*b*x(2)-x(1)];                    %加速度

