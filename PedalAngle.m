% pedal angle
function [accel_angle,brake_angle]=PedalAngle(time)
% Accelerator pedal angle (1 = 100%)
if time>=0 && time<=5
    accel_angle=0.2*time;
%elseif time>1 && time<=10
%    accel_angle=1;
else
    accel_angle=0;
end
% Brake pedal angle (1 = 100%)
if time>=0 && time<=10
    brake_angle=0;
elseif time>10
    brake_angle=1;
else
    brake_angle=0;
end
end