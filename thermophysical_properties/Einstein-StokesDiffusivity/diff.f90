PROGRAM Diffusivity
!This program is used for the calculation of diffusion coefficient in accordance to 
!Stokes-Einstein relation.
IMPLICIT NONE
Real, Parameter::kb=1.38e-23 !Boltzmann Constant
Real, Parameter::pi=3.1416 !value of pi
Real::T !Temperature in celsius
Real::mu !Viscosity of liquid
Real::r !radius
Real::diffcoeff
Write(*,*)'T in centigrade:'
Read(*,*)T
Write(*,*)'dynamic viscosity:'
Read(*,*)mu
Write(*,*)'radius of diffusing element:'
Read(*,*)r
T=T+273.15 !Convert to Kelvin Scale
diffcoeff=(kb*T)/(6*pi*mu*r)
Write(*,*)'The diffusion coefficient m2/s:',diffcoeff
END PROGRAM Diffusivity
