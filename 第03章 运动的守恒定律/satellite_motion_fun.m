%卫星绕地球运行的函数
function f=fun(t,rho)
f=[ rho(3);                            %径向速度表达式
    rho(4);                            %角速度表达式
    rho(1)*rho(4)^2-1/2/rho(1)^2;      %径向加速度表达式
   -2*rho(3)*rho(4)/rho(1)];           %角加速度表达式
end
    
    