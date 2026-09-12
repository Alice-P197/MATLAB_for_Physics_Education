%在通电直线磁场中绕平行轴匀速旋转线圈的电动势
clear                                  %清除变量
d=[0:0.5:2.5 10];                      %距离与半径比向量
rotating_coil_emf_fun(d)                            %调用函数画曲线
axis([0,2*pi,-2,2])                    %设置曲线范围
text(0,0,'\it\epsilon\rm_0=2\itk\rm_m\itI\omegab','FontSize',16)%插入文本

