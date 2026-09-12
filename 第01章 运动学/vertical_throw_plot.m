function [tm,Hm] = vertical_throw_plot(v0,g)

t0 = v0/g;
tm = 2*t0;

t = linspace(0, tm, 500);
v = v0 - g*t;
H = v0*t - 0.5*g*t.^2;
Hm = v0^2/2/g;
figure("Color","w")
plot(t,v,"g-","LineWidth",2)
hold on;
fill([t,fliplr(t)],[v,fliplr(0*ones(size(t)))],"r",FaceAlpha=0.3)
xlabel("$t\ ({\rm s})$","Interpreter","latex"); 
ylabel("$v\ ({\rm m/s})$","Interpreter","latex")
set(gca,"Color","w","XColor","k","YColor","k", ...
    "FontName","times new roman","Fontsize",16)
axis on;
yline(0,"r")
figure("Color","w")
plot(t,H,"g-","LineWidth",2);hold on;
fill([t,fliplr(t)],[H,fliplr(0*ones(size(H)))],"r",FaceAlpha=0.3)
xlabel("$t\ ({\rm s})$","Interpreter","latex"); 
ylabel("$H\ ({\rm m})$","Interpreter","latex")
set(gca,"Color","w","XColor","k","YColor","k", ...
    "FontName","times new roman","Fontsize",16)

axis on;
end