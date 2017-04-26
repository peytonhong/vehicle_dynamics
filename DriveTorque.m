% engine torque to drive torque
function T_d=DriveTorque(M_e,ax)
global R i_t i_D eta_M J_e J_s
i_t=3.307;
i_D=3.85;
eta_M=0.9;
J_e=0.15;
J_s=0.02;
if M_e>0
    T_d=M_e*i_t*i_D*eta_M-(i_D^2*J_s+i_D^2*i_t^2*J_e)*ax/R;
else
    T_d=0;
end
end