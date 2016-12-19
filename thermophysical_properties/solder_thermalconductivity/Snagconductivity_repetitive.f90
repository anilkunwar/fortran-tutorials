PROGRAM ThermalConductivity
!This program is used for the calculation of thermal conductivity of a given material
! kth = A + B*T , where A = 72.065 W/(m K) and B = -0.0108  W/( m K^2 ) N. Aksoz et al. J. Electron. Mater. (2013) 42:3573-3581
! F. Meydaneri et al., Met. Mater. Int. (2012) 18: 77-85
IMPLICIT NONE
!Real, Parameter::R=8.31 !Universal Gas Constant
!Real, Parameter::e=2.718282 !value of napiers constant
Real::T !Temperature in Kelvin
!Real::Earrh !Exponential constant in Arrhenius Equation
!Real::A !Amplification Factor or Constant
Real::kth !density
!Real :: x \
Real ::y 
Real:: A, B
Integer :: Counter
Write(*,*)'starting T (in Kelvin Scale):'
Read(*,*)T
Write(*,*)'A (eg: A for SnAg = 72.065):'
Read(*,*) A
Write(*,*)'B(eg: A for tin3.5Ag= -0.0108):'
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
kth = A + B * T
Write(*,*)T,kth
END DO
END PROGRAM ThermalConductivity
