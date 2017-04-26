% Longitudinal Slip Calculation
function Slip=LongitudinalSlip(Slip,Omega,F_n)
global v_x R T_d T_b J_w B mu ax h F_t
low_speed=0.9;
% f1=zeros(2,1);
% f2=zeros(2,1);
% dFdS=zeros(2,1);
% for i=1:2
%     if abs(Slip(i))<0.2
%         dmu_ds=5.25*mu;
%     elseif abs(Slip(i))>=0.2 && abs(Slip(i))<0.25
%         dmu_ds=0;
%     elseif abs(Slip(i))>=0.25 && abs(Slip(i))<0.5
%         dmu_ds=-0.2*mu;
%     else
%         dmu_ds=0;
%     end
%     dFdS(i)=dmu_ds*F_n(i);
% end
% 
% if abs(v_x)<=low_speed      % driving or braking at low speed
%     for i=1:2
%         f1(i)=h*v_x/(2*B);
%         f2(i)=h*(v_x-R*Omega(i))/B;
%     end
% else                % braking at high speed
%     for i=1:2
%         f1(i)=(h/(2*v_x))*(ax-R^2/J_w*(dFdS(i)));
%         f2(i)=(h/v_x)*(ax+R/J_w*(R*F_t(i)+T_b/2));
%     end
% end
% Slip(1)=((1-f1(1))*Slip(1)+f2(1))/(1+f1(1));
% Slip(2)=((1-f1(2))*Slip(2)+f2(2))/(1+f1(2));

if (T_d>0)       % driving at high speed
    for i=1:2
        Slip(i)=(R*Omega(i)-v_x)/(R*Omega(i));
    end
elseif ((abs(v_x)>low_speed) && (T_b<0))       % braking at high speed
    for i=1:2
        Slip(i)=(v_x-R*Omega(i))/(v_x);
    end
else
    for i=1:2
        Slip(i)=0;
    end
end