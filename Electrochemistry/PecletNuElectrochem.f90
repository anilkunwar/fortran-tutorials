PROGRAM Pecletnumber
!This program is used for the calculation of peclet number for Sn^{++} and Zn^{++} ions transport in accordance to 
!Nernst-Planck Kinetics.
! Mathematically, Pe = Advection velocity / Diffusion velocity
! Pe = vL/D_{ion} = (zF*grad_phi/RT)*L/D_{ion} =(z*F*rho*j*L)/(R*T*D_{ion}) =>only magnitudes are considered as -grad_phi = rho*j
IMPLICIT NONE
Real, Parameter::z=2 !for Sn^{2+} and Zn^{2+}
Real, Parameter::F=96500 !C Faraday constant
Real, Parameter::rho=41.67 !ohm m - resistivity of water with Zn^{++} and Sn^{++} ions
Real, Parameter::L=3.0e-4 !Length (m) for advection of ions
Real, Parameter::R=8.31 !J/(mol K) - Universal Gas Constant 
Real, Parameter::T=298.15 !K - Temperature of solution assumed to be equal to room temperature
!Real::Diffcoeff !Diffusivity of Sn or Zn ions
Real, Parameter::Diffzinc=7.12e-10 ! Diffusion coefficient of zinc ions in water
Real, Parameter::Diffsn=9.8e-11	! Diffusion coefficient of tin in water
Real::j !current density associated with ions
Real::Pe !Peclet number

CHARACTER(LEN=4) :: Ions, Zinc, Tin
!If then else if or select case (variable integer or character) can be used here
! Tutorial on select case is found at http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/chap03/select.html
!https://www.tutorialspoint.com/fortran/if_elseif_else_construct.htm
!Cheers
Write(*,*)'Write "Zinc" or "Tin" ions:'
Read(*,*)Ions
SELECT CASE (Ions)
   CASE ("Tin")
      Write(*,*)'current density of tin at 3v/5v = 31.714 or 51.301 A/m^2:'
      Read(*,*)j
      Pe = (z*F*rho*j*L)/(R*T*Diffsn)
   CASE ("Zinc")
      Write(*,*)'current density of zinc at 3v/5v = 35.075 or 56.74 A/m^2:'
      Read(*,*)j
      Pe = (z*F*rho*j*L)/(R*T*Diffzinc)
   CASE DEFAULT
      Write(*,*)'Please choose either tin, zinc, silver or copper (coding for silver and copper yet to be added):'
END SELECT
   Write(*,*)'Peclet number for your selected ion at given current density is:',Pe
END PROGRAM Pecletnumber
