PROGRAM Density
!This program is used for the calculation of density of a given material
! rho = A + B*T , where A = 7379.3 kg/m^3 and B = -0.591  kg/( K m^3)  T. Gancarz et al., Int. J. Thermophysics (2011) 32: 1210-1233 
!International Journal of Thermophysics 32(6):1210-1233 
IMPLICIT NONE
!Real, Parameter::R=8.31 !Universal Gas Constant
!Real, Parameter::e=2.718282 !value of napiers constant
Real::T !Temperature in Kelvin
!Real::Earrh !Exponential constant in Arrhenius Equation
!Real::A !Amplification Factor or Constant
Real::rho !density
!Real :: x \
Real ::y 
Real:: A, B
Integer :: Counter
Write(*,*)'starting T (in Kelvin Scale):'
Read(*,*)T
Write(*,*)'A (eg: A for Sn3.5Ag = 7379.3):'
Read(*,*) A
Write(*,*)'B(eg: A for tinsilver= -0.591):'
Read(*,*)B
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature (K) Density (kg m^(-3))"
DO Counter = 1, 25, 1
T = T + 5.0
!x= Earrh/(R*T)
!y=e**(x)
!visc=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
rho = A + B * T
Write(*,*)T,rho
END DO
END PROGRAM Density
