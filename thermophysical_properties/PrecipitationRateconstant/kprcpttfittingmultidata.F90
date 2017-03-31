
PROGRAM precipitationrateconstant !PRECIPITATIONRATECONSTANT
!This program fits the precipitation rate constant (k_prcpt) of Cu in Sn as a linear function of temperature T
! k_f{T} = k_f{1} + slope*(T-T_l} (m/s) , where k_f{1} = k_prcpt at T_l and slope = \frac{k_f{2}-k_f{1}}.{T_h - T_l}
IMPLICIT NONE
Real::T !Temperature in Kelvin
Real::Tl !lower temperature equal to 226.8 degree centigrade
Real:: Th !Higher temperature equal to 415 degree centigrade
Real:: kl !k_prcpt of Cu corresponding to lower temperature equal to 226.8 degree centigrade
Real:: kh !k_prcpt of Cu corresponding to Higher temperature equal to 415 degree centigrade
Real::kft !precipitation constant at temperature T
Real :: slope
!Real:: A, B
Integer :: Counter
Write(*,*)'lower Temperature (Tl in Kelvin Scale) :'
Read(*,*)Tl
Write(*,*)'higher Temperature (Th in Kelvin Scale) :'
Read(*,*)Th
Write(*,*)'precipitation rate constant of Cu corresponding to Tl :'
Read(*,*)kl
Write(*,*)'precipitation rate constant of Cu corresponding to Th:'
Read(*,*)kh
slope = (kh-kl)/(Th-Tl)
Write(*,*)'starting T (in Kelvin Scale):'
Read(*,*)T
!Write(*,*)'A (eg: A for Cu in Sn = 3.66e-7):'
!Read(*,*) A
!@Write(*,*)'Earrh(eg: Earrh for Cu in tin= 17556):'
!Read(*,*)Earrh
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature(K) Molarity"
DO Counter = 1, 60, 1
T = T + 1.0
!x= Earrh/(R*T)
!y=e**(-x)
!diffcoeff=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
!rho = A + B * T
kft = kl + slope * (T - Tl)
!Write(*,*)'Interpolated value of IMC diameter:', y 
Write(*,*)T,kft
END DO
END PROGRAM precipitationrateconstant !PRECIPITATIONRATECONSTANT

