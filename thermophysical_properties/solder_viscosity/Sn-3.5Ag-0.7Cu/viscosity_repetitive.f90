PROGRAM Viscosity
!This program is used for the calculation of viscosity of a given material
IMPLICIT NONE
Real, Parameter::R=8.31 !Universal Gas Constant
Real, Parameter::e=2.718282 !value of napiers constant
Real::T !Temperature in celsius
Real::Earrh !Exponential constant in Arrhenius Equation
Real::A !Amplification Factor or Constant
Real::visc !viscosity
Real :: x
Real ::y
Integer :: Counter
Write(*,*)'T (in Kelvin Scale):'
Read(*,*)T
Write(*,*)'E (eg: E for SnAgCu = 6586.62):'
Read(*,*)Earrh
Write(*,*)'A(eg: A for tin= 0.48965):'
Read(*,*)A
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature (K) Viscosity (Pa S)"
DO Counter = 1, 109, 1
T = T + 1.0
x= Earrh/(R*T)
y=e**(x)
visc=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
Write(*,*)T,visc
END DO
END PROGRAM Viscosity
