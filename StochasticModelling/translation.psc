# Input file
# On -> Off
# Off -> On
# -> M
# M ->
# M -> P
# P ->


# Reactions:
R1: 
    On > Off
    k1*On
R2:
    Off > On
    k2*(1-On)
R3:
    $pool > M
    k3*On

R4:
    M > $pool
    k4*M

R5:
    $pool > P
    k5*M

R6:
    P > $pool
    k6*P

# Fixed species
# Variable species
On=0
Off=1
M = 0
P = 0

# Parameters
k1 = 1
k2 = 1
k3 = 200
k4 = 200/20
k5 = 0.693*25*2
k6 = 0.693
