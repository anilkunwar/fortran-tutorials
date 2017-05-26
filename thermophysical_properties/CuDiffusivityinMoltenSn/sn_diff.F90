PROGRAM Diffusivity
!This program is used for the calculation of arrhenious diffusivity  of a given Cu material in liquid Sn
! D_{T} = D_{o}*exp{-Q_{a}/RT} , where D_{o} = 3.66*e-7 and Q_{a} = 17,556  J/mol  A. Kunwar et al., J. Mater. Sci.: Mater. Electron.(2016) 27: 7699–7706 
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
Write(*,*)'A (eg: A for Cu in Sn = 3.66e-7):'
Read(*,*) A
Write(*,*)'Earrh(eg: Earrh for Cu in tin= 17556):'
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
