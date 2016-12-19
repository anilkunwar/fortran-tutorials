! --------------------------------------------------------------------
! MODULE  IntermediateModule
!    This module contains a procedure to compute the imc diameter(y) at the 
! intermediate scan speed between measured IMC size (y1,y2) at two scan speeds 
! (x1,x2)
! y = y1 + (x-x1)(y2 - y1)/(x2-x1)
! point on a line with constant slope
! y = vertical height on coordinate axes
! x = horizontal length on coordinate axes
! --------------------------------------------------------------------

MODULE  IntermediateModule
   IMPLICIT  NONE

CONTAINS

! --------------------------------------------------------------------
! FUNCTION  Imcsize() :
!    This function calculates the intermediate IMC diameter (um) corresponding to
! two measured IMC heights for the associated laser scan speed (mm/s).
! --------------------------------------------------------------------
  
   INTEGER FUNCTION  Imcsize()
      IMPLICIT  NONE
      
      Real::x !Scan speed for which IMC diameter is to be known
      Real::y ! Intermediate IMC diameter
      Real::x1 ! Scan speed at point 1 (lower speed)
      Real::x2 ! Scan speed at point 2 (higher speed)
      Real::y1 ! Measured IMC diameter at x1
      Real::y2 ! Measured IMC diameter at x2
      Real::slope !slope of the straight line
      Write(*,*)'Write the scan speed x (mm/s) for which IMC diameter has to be known:'
      Read(*,*) x
      Write(*,*)'Write scan speeds x1, x2(mm/s) and IMC diameters y1,y2(um):'
      Read(*,*) x1,x2,y1,y2
      !Start the calculation procedure
      slope = (y2-y1)/(x2-x1)
      y = y1 + slope * (x - x1)
      Imcsize = y 
      Write(*,*)'Interpolated value of IMC diameter:', y 

   END FUNCTION  Imcsize

END MODULE  IntermediateModule
