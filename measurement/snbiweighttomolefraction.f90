! The data for this calculation are taken from http://www.metallurgy.nist.gov/phase/solder/cusn.html
! M.L. Huang et al, APPLIED PHYSICS LETTERS 86, 181908 (2005)http://aip.scitation.org/doi/pdf/10.1063/1.1925317
!This program calculates the mole fraction of Sn,Ag and Cu from the mass fraction in Cu-Ag-Sn mixture
!x_i=(w_i/M_i)/(w_Bi/M_Bi + w_Sn/M_Sn)
!CuWftoXf.F90 and cu_fraction_mass_to_molefraction.F90
! Mathematical reference is given in http://kasap13.usask.ca/EE271/solutions/Tutorial_1.pdf
program snbiwttomolfrac
implicit none
real,parameter::mbi=208.980 !molar weight of Bi in grams/mole
real,parameter::msn=118.710 !molar weight of Sn in grams/mole
real::weightfractionofbi    !weight fraction of Bi in decimals
real::molefractionofbi  !mole fraction of Bi in decimals
real::molefractionofsn !mole fraction of Sn in decimals
real::moleofbi  !weight fraction of Bi divided by its molar weight
real::moleofsn   !weight fraction of Sn divided by its molar weight
real::Meffective !Effective molar/atomic weight of alloy
!real::bd  !bubble diameter
write(*,*)'write the weight fraction of Bi in fraction or decimal (58.0 % or 0.58 in Sn-58Bi)'
read(*,*)weightfractionofbi 
molefractionofbi=weightfractionofbi/mbi
molefractionofsn=(1-weightfractionofbi)/msn
!write(*,*)'write the value of measured diamter at surface(millimeters):'
!read(*,*)measured
moleofbi=(molefractionofbi)/(molefractionofbi + molefractionofsn)
moleofsn=(molefractionofsn)/(molefractionofbi + molefractionofsn)
Meffective = moleofbi*mbi + moleofsn*msn
write(*,*)'mole % of Bi i.e. n_Bi=',100*moleofbi, 'mole % of Sn i.e. n_Sn=', 100*moleofsn, &
'Meffective_Sn-xBi=',Meffective  
end program snbiwttomolfrac
