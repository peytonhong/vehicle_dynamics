% Vehicle Longitudinal Dynamics Simulation
clc;clear all;close all;
global R J_w i_t i_D eta_M J_e J_s ax Omega_dot B mu h F_t v_x T_d T_b Slip 
global F_n m gamma g Crr Omega v_wind l_r l_f height h_wind l F_R
i_t=3.307;
i_D=3.85;
eta_M=0.9;
J_e=0.15;
J_s=0.02;
ax=0;
R=0.28;
J_w=5;
T=0.01;
Omega=zeros(2,1);
Omega_dot=zeros(2,1);
x=0;
v_x=0;
F_n=[5640.75;5640.75];
B=0.1;
mu=0.9;
h=0.01;
F_t=zeros(2,1);
Slip=zeros(2,1);
m=1150;
gamma=0;
g=9.81;
Crr=0.01;
v_wind=0;
h_wind=0.9;
l_f=1.3;
l_r=1.3;
l=l_f+l_r;
height=0.6;
i=0;
time=0;
F_R=[0,0];
state_save(1,:)=[time,x,v_x];
F_n_save(1,:)=[time,F_n(1),F_n(2)];
Slip_save(1,:)=[time,Slip(1),Slip(2)];
pedal_angle_save(1,:)=[time,0,0];
F_R_save(1,:)=[time,F_R];
F_t_save(1,:)=[time,0,0];
T_d_save(1,:)=[time,0];
ax_save(1,:)=[time,0];
Omega_save(1,:)=[time,0,0];
torque_save(1,:)=[time,0,0];
F_wL_save(1,:)=[time,0];
for time=0:T:20
    i=i+1;
    [accel_angle,brake_angle]=PedalAngle(time);
    
    [M_e,T_b]=AngleToTorque(accel_angle,brake_angle);
    
    T_d=DriveTorque(M_e,ax);
    
    Omega_dot=WheelSpinDynamics(T_d,T_b);
    
    Z=[x,v_x,Omega(1),Omega(2)];
    [t2,Z_ode]=ode45(@fn_vehicle_state,[0 T],Z);
    [N,M]=size(t2);
    x=Z_ode(N,1);
    v_x=Z_ode(N,2);
    Omega(1)=Z_ode(N,3);
    Omega(2)=Z_ode(N,4);
    
    Slip=LongitudinalSlip(Slip,Omega,F_n);
    
    F_t=LongitudinalForce(Slip);
    
    F_grade=GradeResistance(gamma);
    
    F_R=RollingResistance(F_n);
    
    F_wL = AeroDynamicDrag(v_x);
    
    [ax,F_n] = LongitudinalVehicleDynamic(F_grade,F_R,F_wL,F_t);
    
    state_save(i,:)=[time,x,v_x];
    F_n_save(i,:)=[time,F_n(1),F_n(2)];
    Slip_save(i,:)=[time,Slip(1),Slip(2)];
    pedal_angle_save(i,:)=[time,accel_angle,brake_angle];
    F_R_save(i,:)=[time,F_R];
    F_t_save(i,:)=[time,F_t(1),F_t(2)];
    T_d_save(i,:)=[time,T_d];
    ax_save(i,:)=[time,ax];
    Omega_save(i,:)=[time,Omega(1),Omega(2)];
    torque_save(i,:)=[time,T_d,T_b];
    F_wL_save(i,:)=[time,F_wL];
end
figure_plot(state_save,F_n_save,Slip_save,pedal_angle_save,F_R_save,F_t_save,ax_save,Omega_save,torque_save,F_wL_save);
