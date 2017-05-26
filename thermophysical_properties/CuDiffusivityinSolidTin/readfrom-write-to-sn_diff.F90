PROGRAM Diffusivity
!This program is used for the calculation of arrhenious diffusivity  of a given Cu material in solid Sn
! D_{T} = D_{o}*exp{-Q_{a}/RT} , where D_{o} = 2.4*e-7 m^2/s and Q_{a} = 33020.0  J/mol  B. Chao et al., Acta. Mater.(2007) 55: 2805–2814
! ######Notes######
! https://gcc.gnu.org/wiki/GFortranUsage
! https://stackoverflow.com/questions/12002620/write-data-to-file-in-columns-fortran
! http://www.math.hawaii.edu/~hile/fortran/fort7.htm
! * http://www.math.hawaii.edu/~dale/190/files_input_output.pdf *
! http://www.oc.nps.edu/~bird/oc3030_online/fortran/io/io.html
! https://stackoverflow.com/questions/15526203/single-command-to-open-a-file-or-create-it-and-the-append-data
! http://www.cs.mtu.edu/~shene/COURSES/cs201/FAQ/compile.html
! https://www.tutorialspoint.com/fortran/fortran_tutorial.pdf
! http://www.public.iastate.edu/~akmitra/aero361/design_web/AshWWW/makefiles.pdf
! http://www.tutorialspoint.com/fortran/fortran_file_input_output.htm 
! *Learning is a very nice thing*
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
!Write(*,*)'starting T (in Kelvin Scale):'
!Read(*,*)T
!Write(*,*)'A (eg: A for Cu in Sn = 2.4e-7):'
!Read(*,*) A
!Write(*,*)'Earrh(eg: Earrh for Cu in tin= 33020.0):'
!Read(*,*)Earrh
!T=T+273.15 !Convert to Kelvin Scale
!Print*,"#Temperature (K) Diffusivity(kg m^(-3))"
!open (unit = number, file = "name") 
open (unit = 1, file = "input-data.dat") 
Read(1,*) T,A,Earrh
CLOSE(UNIT=1)
open (unit = 7, file = "output-data.dat")
Write(7,*)"#Temperature (K) Diffusivity(kg m^(-3))"
DO Counter = 1, 109, 1
T = T + 1.0
x= Earrh/(R*T)
y=e**(-x)
diffcoeff=A*y
!Write(*,*)'T (K):',T
!Write(*,*)'The Viscosity(mPa.S):',visc
!rho = A + B * T
Write(7,*) T,diffcoeff
END DO
CLOSE(UNIT=7)
END PROGRAM Diffusivity
