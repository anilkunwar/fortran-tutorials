PROGRAM Viscosity
!This program is used for the calculation of asymptotic viscosity of a given material for solid fraction
!mu_infinity = mu(T) * (1 - fs)^(-2.5) Z.Fan & J.Y.Chen 2002 Mater. Sci. Tech. vol. 18.
!mu_infinity = mu(T) * (1 - fs)^(-2.5) L.S.Turng & K.K.Wang 1991 J. Mater. Sci. vol. 26.
!mu(T) = A *exp(Ea/RT); A = 0.091 L.S.Turng & K.K.Wang 1991 J. Mater. Sci. vol. 26.
!Ea in mu(T) for Sn0.7Cu = 2962.997 M. Tan et al (2007)  Physica B : Condensed Matter Vol. 387.
IMPLICIT NONE
Real, Parameter::R=8.31 !Universal Gas Constant
Real, Parameter::e=2.718282 !value of napiers constant
Real::T !Temperature in celsius
Real::Earrh !Exponential constant in Arrhenius Equation
Real::A !Amplification Factor or Constant
Real::visc !viscosity
Real :: x
Real :: y
Real :: z
Real :: phi !solid fraction
Integer :: Tcounter
!Integer :: Fcounter
Write(*,*)'Liquidus T (in Kelvin Scale):'
Read(*,*)T
Write(*,*)'E (eg: E for SnAgCu= 6586.62 J/mol):'
Read(*,*)Earrh
Write(*,*)'A(eg: A for tin= 0.091 PaS):'
Read(*,*)A
!T=T+273.15 !Convert to Kelvin Scale
Print*,"#Temperature (K) Viscosity (Pa S)"
DO Tcounter = 1, 175, 1
T = T - 0.2
phi = phi + 0.15
!phi = 1.0
x= Earrh/(R*T)
y=e**(x)
!z=(1.0 - phi)**(-2.5)
z=e**(4.32*phi)
visc=A*y*z
!visc=300.062714
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
Write(*,*)T,visc
END DO
END PROGRAM Viscosity

