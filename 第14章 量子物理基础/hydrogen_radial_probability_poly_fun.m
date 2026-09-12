%氢原子概率密度由径向决定的函数(用正交多项式函数)
function Wr=fun(n,l,z,x)
L=['L(',num2str(n+l),',x)'];           %拉盖尔多项式函数
sL=maple(L);                           %求拉盖尔多项式字符串
sL=sym(sL);                            %化为符号函数
sdL=diff(sL,2*l+1);                    %通过导数求连带拉盖尔多项式字符串
m2=4*z^3*factorial(n-l-1)/n^4/factorial(n+l);%归一化系数的平方
sw=m2*sdL^2*['exp(-x)*x^',num2str(2*l)];%概率密度表达式
v=vectorize(sw);                       %矢量化
wr=inline(v);                          %化为内线函数
Wr=wr(z*x);                            %与径向有关的概率密度

