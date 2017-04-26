function d_Z = fn_vehicle_state(~,Z)
global ax Omega_dot R Omega F_n Crr F_R m
d_Z=zeros(4,1); % d_Z=[v_x;ax;omega_dot_f;omega_dot_r]

d_Z(1)=Z(2);
d_Z(2)=ax;
d_Z(3)=Omega_dot(1);
d_Z(4)=Omega_dot(2);
%d_Z(3)=Omega_dot(1)-(Crr*F_n(1))*sign(Omega(1))*R;
%d_Z(4)=Omega_dot(2)-(Crr*F_n(2))*sign(Omega(2))*R;
end