% rolling resistance
function F_R = RollingResistance(F_n)
global Omega Crr
F_R=zeros(1,2);
for i=1:2
    F_R(i)=(Crr*F_n(i))*sign(Omega(i));
end
end