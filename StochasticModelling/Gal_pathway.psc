# Input file



# Reactions:
R1: 
    Gal3_off + Gal > Gal3_on
    Gal_binding*Gal3_off*Gal
R2:
   Gal3_on+Gal80 > Gal80_off
   Gal80_deactivation*Gal3_on*Gal80
R3:
    {2}Gal80 > Gal80_on
    Gal80_activation*Gal80*(Gal80-1)

R4:
    Gal4+Gal80_on > Gal4_off
    Gal4_deactivation*Gal4*Gal80_on

R5: 
    Gal3_on > Gal3_off + Gal 
    Gal_dissociation*Gal3_on
R6:
    Gal80_off > Gal3_on+Gal80
    k6*Gal80_off
R7:
    Gal80_on > {2}Gal80 
    k7*Gal80_on

R8:
    Gal4_off > Gal4+Gal80_on
    k8*Gal4_off
R9:
    Off>On
    Gal3_dna_binding*Gal3_on*Off

R10:
    On>Off
    Mig1_repression*Mig1*On


R11:
    $pool > Gal1
    transcription_rate*On

R12:
    Gal1 > $pool
    degradation_rate*Gal1

R13:
    Mig1_out > Mig1
    Mig1_import*Glu*Mig1_out

R14:
    Mig1 > Mig1_out
    Mig1_export*Mig1

R15:
    $pool > Glu
    Glu_import

R16:
    Glu > $pool
    Glu_consumption*Glu

# Fixed species
Gal=100


# Variable species
On=0
Off=1
Gal3_off=100
Gal3_on=0
Gal80=0
Gal80_on=100
Gal80_off=0
Gal4=100
Gal4_off=0
Mig1_out=10
Mig1=0
Gal1=0
Glu=0

# Parameters
Gal_binding = 10
Gal80_deactivation = 1
Gal80_activation = 1
Gal4_deactivation = 1
Gal_dissociation = 10
k6 = 1
k7 = 10
k8 = 1
Gal3_dna_binding = 10
Mig1_repression = 1000
transcription_rate = 100
degradation_rate = 1
Mig1_import = 10
Mig1_export = 0.01
Glu_import=0.1
Glu_consumption=0
