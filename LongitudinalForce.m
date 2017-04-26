% Longitudinal force F_t
function F_t=LongitudinalForce(Slip)
global F_n mu T_d T_b v_x R
F_t=zeros(2,1);
for i=1:2
    if abs(Slip(i))<0.2
        mu_longi=5.25*mu*(Slip(i));
    elseif abs(Slip(i))>=0.2 && abs(Slip(i))<0.25
        mu_longi=1.05*mu;
    elseif abs(Slip(i))>=0.25 && abs(Slip(i))<0.5
        mu_longi=1.05*mu-0.05*mu/0.25*(Slip(i)-0.25);
    else
        mu_longi=mu;
    end
    
    if T_d>0        % 주행시
        F_t(i)=mu_longi*F_n(i);
    elseif T_b<0    % 제동시
        F_t(i)=-mu_longi*F_n(i);
    else
        F_t(i)=0;   % free rolling
    end
        
    if abs(v_x)<0.9
        F_t(i)=T_d/R;
    end       
end


end