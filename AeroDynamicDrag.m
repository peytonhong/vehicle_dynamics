% aero dynamic drag
function F_wL = AeroDynamicDrag(v_x)
global v_wind
C_w=0.3;    % typical passenger's car
A=5;        % frontal area [m^2]
P_L=1.2*((v_x-v_wind)^2)/2;
F_wL=C_w*A*P_L;
end