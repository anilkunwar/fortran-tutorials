! The data for this calculation are taken from http://www.metallurgy.nist.gov/phase/solder/cusn.html
! M.L. Huang et al, APPLIED PHYSICS LETTERS 86, 181908 (2005)http://aip.scitation.org/doi/pdf/10.1063/1.1925317
!This program calculates the mole fraction of Cu from the mass fraction in Cu-Sn mixture
!x_f=(w_f*M_Cu)/(M_Cu + M_Sn)
!CuWftoXf.F90 and cu_fraction_mass_to_molefraction.F90
program cusolubilityxbyvf
implicit none
real,parameter::mcu=63.546 !molar weight of Cu in grams/mole
real,parameter::rhocu=8.933 !density of elemental Cu in g/cc http://education.jlab.org/itselemental/ele029.html
real,parameter::rhosn=7.287 !density of elemental Sn in grams/cc http://education.jlab.org/itselemental/ele050.html
real::weightfractionofcu     !weight fraction of Cu in decimals
real::molepervolume  !mole fraction of Cu in decimals
real::moleofcu  !weight fraction of Cu divided by its molar weight
real::volumefofcu   !weight fraction of Cu divided by its density
real::volumefofsn   !weight fraction of Sn divided by its density
!real::bd  !bubble diameter
write(*,*)'write the weight fraction of Cu in decimal (0.1307 at 415 degree centigrade or 0.0089 at 226.8 degree centigrade)' !write the fraction or
read(*,*)weightfractionofcu 
moleofcu=weightfractionofcu/mcu
volumefofcu = weightfractionofcu/rhocu 
volumefofsn = (1-weightfractionofcu)/rhosn 
!write(*,*)'write the value of measured diamter at surface(millimeters):'
!read(*,*)measured
molepervolume=(weightfractionofcu/mcu)/(volumefofcu + volumefofsn)
write(*,*)'The mole per volume (cc) of Cu in Sn-Cu mixture is',molepervolume 
end program cusolubilityxbyvf
