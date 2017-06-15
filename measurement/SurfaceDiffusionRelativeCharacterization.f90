PROGRAM SurfaceDiffusionRation
!This program is used for the calculation of dimensionless surface diffusion ratio Beta for Sn material.
! Mathematically, Beta_{V} = Electric wind driving force / Surface Tension Beta_{T} = Thermal wind driving force / Surface Tension 
! Beta_{v} = \frac{R^2}{omega*gamma} \times z*e*gradPhi;Beta_{T} = \frac{R^2}{omega*gamma} \times \frac{Q^{*}*gradT}{T}
! Wang et al, 1996, A simulation of electromigration‐induced transgranular slits , JAP, vol.79, pp.2394-2403.
IMPLICIT NONE
Real, Parameter::z=2 !for Sn^{2+} and Zn^{2+}
Real, Parameter::e=1.602e-19 !can be used as charge of electron in C and eV to Joule conversion factor
Real, Parameter::Omega=2.70e-29 ! m^3 Molar Volume of Sn atom/Number of atoms in a mole
! http://www.periodictable.com/Elements/050/data.html
Real, Parameter::Gammasn=0.709	! J/m^2 Surface energy of tin and references Vitos1998, Sellers2010
Real::Tavg !initial temperature of the medium
Real::L !length of the Sn medium
Real::TVhigh !Value of Higher Field
Real:: TVlow ! Value of lower field
Real::gradField !temperature or voltage gradient
Real::Qasterik ! in eV
Real::ro !initial radius of the void in m
Real::preconstant
Real::beta
!Real::phi
!Real::volt !Electrical phi
!Real::temp !Thermal phi
CHARACTER(LEN=4) :: phi, volt, temp
Write(*,*)'initial radius of the void in m:'
Read(*,*)ro
preconstant =(ro*ro)/(Omega*Gammasn) !or (Ro*Ro)/(Omega*Gammasn)
Write(*,*)'Length of Sn medium in m:'
Read(*,*)L
!INTEGER          :: DrMD = 0, PhD = 0, MS = 0, BS = 0, Others = 0
! Tutorial on select case is found at http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/chap03/select.html
!https://www.tutorialspoint.com/fortran/if_elseif_else_construct.htm
!Cheers
Write(*,*)'Write "volt" for Electrical field phi or "temp" for Thermal field phi:'
Read(*,*)phi
SELECT CASE (phi)
   CASE ("volt")
      Write(*,*)'Value of lower voltage:'
      Read(*,*)TVlow
      Write(*,*)'Value of high voltage:'
      Read(*,*)TVhigh
      gradField = (TVhigh - TVlow)/L
      beta = preconstant*z*e*gradField
   CASE ("temp")
      Write(*,*)'Value of average T field or initial T field in Sn medium (K):'
      Read(*,*)Tavg
      Write(*,*)'Value of lower T field in K:'
      Read(*,*)TVlow
      Write(*,*)'Value of higher T field in K:'
      Read(*,*)TVhigh
      Write(*,*)'Value of heat of Transport for void in Sn field in eV:'
      Read(*,*)Qasterik
      gradField = (TVhigh - TVlow)/L
      beta = preconstant*Qasterik*e*gradField/Tavg !e converts Qasterik from eV to J
   CASE DEFAULT
      Write(*,*)'Please choose either "volt" for Electrical or "temp" for Thermal Field(phi) :'
END SELECT
   Write(*,*)'Dimensionless beta for surface characterization of your selected void-Sn pair parameters is:',beta
END PROGRAM SurfaceDiffusionRation
