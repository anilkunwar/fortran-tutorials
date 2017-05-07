! The data for this calculation are taken from http://www.metallurgy.nist.gov/phase/solder/cusn.html
! M.L. Huang et al, APPLIED PHYSICS LETTERS 86, 181908 (2005)http://aip.scitation.org/doi/pdf/10.1063/1.1925317
!This program calculates the mole fraction of Sn,Ag and Cu from the mass fraction in Cu-Ag-Sn mixture
!x_i=(w_i*M_i)/(w_Ag/M_Ag + w_Cu/M_Cu + w_Sn/M_Sn)
!CuWftoXf.F90 and cu_fraction_mass_to_molefraction.F90
! Mathematical reference is given in http://kasap13.usask.ca/EE271/solutions/Tutorial_1.pdf
program sacwttomolfrac
implicit none
real,parameter::mag=107.8682 !molar weight of Sn in grams/mole
real,parameter::mcu=63.546 !molar weight of Cu in grams/mole
real,parameter::msn=118.710 !molar weight of Sn in grams/mole
real::weightfractionofag     !weight fraction of Ag in decimals
real::molefractionofag  !mole fraction of Ag in decimals
real::weightfractionofcu     !weight fraction of Cu in decimals
real::molefractionofcu  !mole fraction of Cu in decimals
real::molefractionofsn !mole fraction of Sn in decimals
real::moleofag  !weight fraction of Cu divided by its molar weight
real::moleofcu  !weight fraction of Cu divided by its molar weight
real::moleofsn   !weight fraction of Sn divided by its molar weight
!real::bd  !bubble diameter
write(*,*)'write the weight fraction of Cu in fraction or decimal (0.5 % or 0.005 in Sn3.5Ag0.5Cu)'
read(*,*)weightfractionofcu 
molefractionofcu=weightfractionofcu/mcu
write(*,*)'write the weight fraction of Ag in fraction or decimal (3.5 % or 0.035 in Sn3.5Ag0.5Cu)'
read(*,*)weightfractionofag 
molefractionofag=weightfractionofag/mag
molefractionofsn=(1-(weightfractionofcu + weightfractionofag))/msn
!write(*,*)'write the value of measured diamter at surface(millimeters):'
!read(*,*)measured
moleofag=(molefractionofag)/(molefractionofcu + molefractionofag + molefractionofsn)
moleofcu=(molefractionofcu)/(molefractionofcu + molefractionofag + molefractionofsn)
moleofsn=(molefractionofsn)/(molefractionofcu + molefractionofag + molefractionofsn)
write(*,*)'mole % of Ag i.e. n_Ag=',100*moleofag, 'mole % of Cu i.e. n_Cu=',100*moleofcu ,'mole % of Sn i.e. n_Sn=', 100*moleofsn  
end program sacwttomolfrac
