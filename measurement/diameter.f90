!This program calculates the bubble diameter on the basis of following formula
!BD=(0.5*measured*scalefactor)/depth+depth
program bubblediameter
implicit none
real,parameter::depth=0.226 !micrometers
real::scalefactor     !0.2364 um/mm for S-cu-08
real::measured !measured diameter at IMC surface
real::bd  !bubble diameter
write(*,*)'write the scale factor in um/mm:'
read(*,*)scalefactor
write(*,*)'write the value of measured diamter at surface(millimeters):'
read(*,*)measured
bd=((0.5*measured*scalefactor)/depth)+depth
write(*,*)'The bubble diameter in micrometers is',bd
end program bubblediameter



