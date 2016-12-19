! --------------------------------------------------------------------
! PROGRAM  ComputeDiameter:
!    This program uses MODULE DiameterModule for outputting them.
! --------------------------------------------------------------------

PROGRAM  ComputeSize
   USE       DiameterModule            ! use a module that has a data of diameters from the measure IMC per unit area
   USE       IntermediateModule        ! use a module that has function for producing interpolated value of IMC height  for given scan speed
   IMPLICIT  NONE

   INTEGER :: i                     

   WRITE(*,*)  'Integer i for number of increment steps each of 0.05 per um^2 --> '
   READ(*,*)   i

   !WRITE(*,*)  N,   '! = ', Factorial(N)
   WRITE(*,*)   Diameter()
   WRITE(*,*)   Imcsize()

END PROGRAM  ComputeSize
