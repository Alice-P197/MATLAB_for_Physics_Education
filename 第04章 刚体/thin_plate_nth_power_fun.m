%薄板所受的阻力与速率的n次方成正比的运动的函数
function f=fun(t,th,flag,n)
f=[ th(2);                             %速度
   -3/(n+2)*th(2)^n];                  %加速度

