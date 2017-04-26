% take-home exam of vertical dynamics
m_b=317.5;
m_t=45.4;
k_b=22000;
c_b=1500;
k_t=192000;

det=[m_t^2 -2*m_t*c_b*1i -(2*m_t*k_b+m_t*k_t) k_t*c_b*1i k_t*k_b];
w=roots(det);
f=w/(2*pi);
nom_Zt=[-k_t*(-m_b) k_t*c_b*1i k_b*k_t];
nom_Zb=[k_t*c_b*1i k_t*k_b];
