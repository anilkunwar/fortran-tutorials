PROGRAM Diffusivity
!This program is used for the calculation of arrhenious diffusivity  of a given Cu material in solid Sn
! D_{T} = D_{o}*exp{-Q_{a}/RT} , where D_{o} = 2.4*e-7 m^2/s and Q_{a} = 33020.0  J/mol  B. Chao et al., Acta. Mater.(2007) 55: 2805–2814
IMPLICIT NONE
Real, Parameter::R=8.31 !Universal Gas Constant
Real, Parameter::e=2.718282 !value of napiers constant
Real::T !Temperature in Kelvin
Real::Earrh !Exponential constant in Arrhenius Equation i.e. Q_a
Real::A !Amplification Factor or Constant D_o
Real::diffcoeff !diffusivity
Real :: x 
Real :: y 
!Real:: A, B
Integer :: Counter
Write(*,*)'starting T (in Kelvin Scale):'
Read(*,*)T
Write(*,*)'A (eg: A for Cu in Sn = 2.4e-7):'
Read(*,*) A
Write(*,*)'Earrh(eg: Earrh for Cu in tin= 33020.0):'
Read(*,*)Earrh
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature (K) Diffusivity(m^(2)/s)"
DO Counter = 1, 109, 1
T = T + 1.0
x= Earrh/(R*T)
y=e**(-x)
diffcoeff=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
!rho = A + B * T
Write(*,*)T,diffcoeff
END DO
END PROGRAM Diffusivity
