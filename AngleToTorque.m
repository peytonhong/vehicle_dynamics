% pedal angle to torque (accelerator & brake)
function [M_e,T_b]=AngleToTorque(accel_angle,brake_angle)
% accel angle to engine torque
if accel_angle<0.6
    M_e=467*accel_angle;
else
    M_e=280;
end
% brake angle to brake torque
T_b=-3000*brake_angle;
end