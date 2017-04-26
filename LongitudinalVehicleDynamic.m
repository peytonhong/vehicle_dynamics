% longitudinal vehicle dynamic and vertical force
function [ax,F_n] = LongitudinalVehicleDynamic(F_grade,F_R,F_wL,F_t)
global gamma m l_r l_f height h_wind g
F_t_sum=F_t(1)+F_t(2);
% x acceleration
if abs(F_t_sum)<abs((F_R(1)+F_R(2))-F_wL-F_grade)
    ax=0;
else
    ax=(F_t_sum-(F_R(1)+F_R(2))-F_wL-F_grade)/m;
end
l=l_f+l_r;
% tire vertical force
F_nf=1/l*(-(m*g*sin(gamma)+m*ax)*height+(m*g*cos(gamma)*l_r-F_wL*h_wind));
F_nr=1/l*((m*g*sin(gamma)+m*ax)*height+(m*g*cos(gamma)*l_f+F_wL*h_wind));
F_n=[F_nf;F_nr];
end