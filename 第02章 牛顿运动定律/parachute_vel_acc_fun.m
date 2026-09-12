%降落伞的速度和加速度函数
function f=fun(t,x,flag,g,vt)
f=[x(2);                               %速度表达式
   g-g*x(2)^2/vt^2];                   %加速度表达式

