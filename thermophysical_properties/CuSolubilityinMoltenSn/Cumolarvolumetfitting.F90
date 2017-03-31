
PROGRAM Cumolepervolume
!This program fits the molepervolume of Cu in Sn as a linear function of temperature T
! x_f{T} = x_f{1} + slope*(T-T_l} , where x_f{1} = molepervolume at T_l and slope = \frac{x_f{2}-x_f{1}}.{T_h - T_l}
IMPLICIT NONE
Real::T !Temperature in Kelvin
Real,Parameter:: Tl= 499.95 !lower temperature equal to 226.8 degree centigrade
Real,Parameter:: Th= 688.15 !Higher temperature equal to 415 degree centigrade
Real,Parameter:: xl= 0.001022 !mole per CC of Cu corresponding to lower temperature equal to 226.8 degree centigrade
Real,Parameter:: xh= 0.015357 !mole per cc of Cu corresponding to Higher temperature equal to 415 degree centigrade
Real::xft !molarity at temperature T
Real :: slope
!Real:: A, B
Integer :: Counter
slope = (xh-xl)/(Th-Tl)
Write(*,*)'starting T (in Kelvin Scale):'
Read(*,*)T
!Write(*,*)'A (eg: A for Cu in Sn = 3.66e-7):'
!Read(*,*) A
!@Write(*,*)'Earrh(eg: Earrh for Cu in tin= 17556):'
!Read(*,*)Earrh
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature(K) Mole_per_cc "
DO Counter = 1, 209, 1
T = T + 1.0
!x= Earrh/(R*T)
!y=e**(-x)
!diffcoeff=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
!rho = A + B * T
xft = xl + slope * (T - Tl)
!Write(*,*)'Interpolated value of IMC diameter:', y 
Write(*,*)T,xft
END DO
END PROGRAM Cumolepervolume

