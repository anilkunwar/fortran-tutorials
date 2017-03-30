! The data for this calculation are taken from http://www.metallurgy.nist.gov/phase/solder/cusn.html
! M.L. Huang et al, APPLIED PHYSICS LETTERS 86, 181908 (2005)http://aip.scitation.org/doi/pdf/10.1063/1.1925317
!This program calculates the mole fraction of Cu from the mass fraction in Cu-Sn mixture
!x_f=(w_f*M_Cu)/(M_Cu + M_Sn)
!CuWftoXf.F90 and cu_fraction_mass_to_molefraction.F90
program cusolubilityxf
implicit none
real,parameter::mcu=63.546 !molar weight of Cu in grams/mole
real,parameter::msn=118.710 !molar weight of Sn in grams/mole
real::weightfractionofcu     !weight fraction of Cu in decimals
real::molefractionofcu  !mole fraction of Cu in decimals
real::moleofcu  !weight fraction of Cu divided by its molar weight
real:moleofsn   !weight fraction of Sn divided by its molar weight
!real::bd  !bubble diameter
write(*,*)'write the weight fraction of Cu in fraction or decimal (0.1307 at 415 degree centigrade)'
read(*,*)weightfractionofcu 
moleofcu=weightfractionofcu/mcu
moleofsn=(1-weightfractionofcu)/msn
!write(*,*)'write the value of measured diamter at surface(millimeters):'
!read(*,*)measured
molefractionofcu=(weightfractionofcu/mcu)*(moleofcu + moleofsn)
write(*,*)'The mole fraction of Cu in Sn-Cu mixture is',molefractionofcu 
end program cusolubilityxf
