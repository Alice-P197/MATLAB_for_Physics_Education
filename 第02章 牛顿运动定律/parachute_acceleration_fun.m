%降落伞的加速度函数
function f=fun(t,v,flag,g,vt)
f=g-g*v^2/vt^2;                        %加速度表达式

