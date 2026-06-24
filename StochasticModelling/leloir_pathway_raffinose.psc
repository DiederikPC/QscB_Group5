# Leloir pathway / GAL regulon model 
# Time unit: minutes. Species in molecule counts per cell (typical budding
# yeast haploid cell volume ~40-50 fL).


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
    Gal4_dna_binding*Gal4*Off

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

# Extracellular/intracellular galactose held fixed at a saturating
# inducing concentration (~2% galactose in standard lab media is far above
# the K_m of the Gal2 transporter and Gal1/Gal3 galactokinase-like binding,
# so a constant high pool is a reasonable simplification). FIND SOURCE
Gal=300


# Variable species
# On/Off: treated as fractional promoter occupancy (0-1), so 1 "molecule"
#   = a single allele/promoter copy switching between two states.
# Gal3_off=80, Gal3_on=0: Gal3 is expressed at moderate-to-high abundance
#   (higher than Gal80, much higher than Gal4); start fully uninduced.
# Gal80=0, Gal80_on=300: virtually all Gal80 starts as the repressive
#   dimer ("Gal80_on") bound up and ready to inhibit Gal4 in the absence
#   of galactose signal, consistent with Gal80 being constitutively
#   present and repressing Gal4 by default.
# Gal4=20, Gal4_off=0: Gal4 is the activator and is famously LOW
#   abundance in vivo (tens of molecules/cell), much lower than Gal80,
#   so Gal80 (300) is in large excess and can fully repress Gal4 (20).
# Mig1_out=0, Mig1=300: Mig1 starts active due to previous growth on raffinose; total Mig1
#   pool ~300 molecules, comparable in scale to Gal80.
# Gal1=0: no galactokinase yet (uninduced state).
# Glu=2000: moderate glucose pool for a mixed-sugar / diauxic-shift type
#   simulation; set Glu=0 for a pure-galactose induction experiment, or
#   raise Glu_import above 0 for continuous glucose feed (chemostat-like).
On=0
Off=1
Gal3_off=80
Gal3_on=0
Gal80=0
Gal80_on=300
Gal80_off=0
Gal4=200
Gal4_off=0
Mig1_out=150
Mig1=150
Gal1=0
Glu=0



# Parameters
# All second-order (bimolecular) rate constants are in
# molecules^-1 * min^-1; all first-order constants are in min^-1.
# Scale chosen so the Gal3/Gal80/Gal4 module equilibrates over
# ~minutes and full GAL1 induction develops over tens of minutes to a
# few hours, matching reported induction/derepression kinetics
# (glucose-repression elements act within minutes of glucose addition;
# full GAL1 induction after glucose exhaustion develops over roughly
# 30-90+ minutes; diauxic glucose depletion itself spans ~1-8 hours
# in batch culture).

Gal_binding = 0.02
Gal80_deactivation = 0.05
Gal80_activation = 0.01
Gal4_deactivation = 0.02
Gal_dissociation = 0.5
k6 = 0.2
k7 = 0.05
k8 = 0.01
Gal4_dna_binding = 0.5
Mig1_repression = 0.2
transcription_rate = 4
degradation_rate = 0.04
Mig1_import = 0.002
Mig1_export = 0.05
Glu_import = 0
Glu_consumption = 0.015
