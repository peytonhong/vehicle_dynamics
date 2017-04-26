% wheel spin dynamics
function Omega_dot=WheelSpinDynamics(T_d,T_b)
global J_w F_R R F_t
Omega_dot_f=(T_d/2+T_b/2-F_t/R-F_R(1)/2*R)/J_w;   % front, T_b<0
Omega_dot_r=(T_d/2+T_b/2-F_t/R-F_R(2)/2*R)/J_w;   % rear,  T_b<0

Omega_dot=[Omega_dot_f;Omega_dot_r];
end