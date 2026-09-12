%竖直杆滑倒的函数
function varargout=fun(t,th,flag)
switch flag                            %将标志作为开关
	case ''                            %当标志为空时
       varargout{1}=f(t,th);           %输出一个函数值
	case 'events'                      %当标志为事件时
       [varargout{1:3}]=events(th);    %输出三个事件值
	otherwise                          %否则
       error(['Unknown flag ''',flag,'''.']);%显示错误信息
end                                    %结束开关
%-----------------------------------------------------------
%计算微分方程的子函数
function alpha=f(t,th)
alpha=[th(2);                          %角速度表达式
      6*sin(th(1))*(1+12*sin(th(1)/2)^4)/(1+3*sin(th(1))^2)^2];%角加速度表达式
%      3*sin(th(1))*(2-th(2)^2*cos(th(1)))/(3*sin(th(1))^2+1)];%角加速度表达式
%-----------------------------------------------------------
%事件判断子函数
function [value,isterminal,direction]=events(th)
value=th(1)-pi/2;                      %角度值,0表示倒地
direction=1;                           %由增加(1)的方向终止
isterminal=1;                          %开启判断终止功能


