! --------------------------------------------------------------------
! MODULE  FactorialModule
!    This module contains the computation of size or diameter for a 
!value of number of IMC per unit area in um
! --------------------------------------------------------------------

MODULE  DiameterModule
   IMPLICIT  NONE

CONTAINS

! --------------------------------------------------------------------
! FUNCTION  Diameter() :
!    This function accepts a non-negative integers and returns its
! Factorial.
! --------------------------------------------------------------------
  
   INTEGER FUNCTION  Diameter() 
      IMPLICIT  NONE
      real, parameter :: pi = 3.1415926536  
      Real::numratio !Number of IMC per unit area (um^2)
      real:: diam !diameter of IMC in um
      INTEGER             ::  i    ! steps for do loop

      Write(*,*)'Inital num per um^2 area (zero or non-zero):'
      Read(*,*) numratio
      DO i = 1, 40, 1                       ! with each numration increment of 0.05/um^2, it requires 40 steps
         numratio = numratio + 0.05               ! let's increase 
         diam = sqrt(4.0 /(pi*numratio))
         Write(*,*)'The numratio and diameters (um) are :', numratio, diam
      END DO
      Diameter = diam                  

   END FUNCTION  Diameter

END MODULE  DiameterModule
