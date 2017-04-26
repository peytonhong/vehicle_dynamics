function figure_plot(state_save,F_n_save,Slip_save,pedal_angle_save,F_R_save,F_t_save,ax_save,Omega_save,torque_save,F_wL_save)
figure(1)
subplot(2,1,1)
plot(state_save(:,1),state_save(:,2))
title('Distance')
xlabel('time')
ylabel('distance [m]')
grid on
subplot(2,1,2)
plot(state_save(:,1),state_save(:,3))
title('Velocity')
xlabel('time')
ylabel('velocity [m/s]')
grid on

figure(2)
plot(F_n_save(:,1),F_n_save(:,2:3))
title('Vertical tire force')
xlabel('time')
ylabel('Force [N]')
legend('front','rear')
grid on

figure(3)
plot(Slip_save(:,1),Slip_save(:,2:3))
title('Longitudinal Slip Ratio')
xlabel('time')
ylabel('Ratio')
legend('front','rear')
grid on

figure(4)
plot(pedal_angle_save(:,1),pedal_angle_save(:,2:3).*100)
title('Pedal Angle')
xlabel('time')
ylabel('Pedal angle [%]')
legend('Accelerator','Brake')
grid on

figure(5)
plot(F_R_save(:,1),F_R_save(:,2:3))
title('Rolling resistance')
xlabel('time')
ylabel('[N]')
legend('front','rear')
grid on

figure(6)
plot(F_t_save(:,1),F_t_save(:,2:3))
title('Traction force')
xlabel('time')
ylabel('[N]')
legend('front','rear')
grid on

figure(8)
plot(ax_save(:,1),ax_save(:,2))
title('Acceleration')
xlabel('time')
ylabel('ax [m/s^2]')
grid on

figure(9)
plot(Omega_save(:,1),Omega_save(:,2:3))
title('Omega')
xlabel('time')
ylabel('Angular velocity [rad/s]')
legend('front','rear')
grid on

figure(10)
plot(torque_save(:,1),torque_save(:,2:3))
title('T_d T_b')
xlabel('time')
ylabel('Torque')
legend('T_d','T_b')
grid on

figure(11)
plot(F_wL_save(:,1),F_wL_save(:,2))
title('Wind load (F_wL)')
xlabel('time')
ylabel('Force [N]')
grid on
end