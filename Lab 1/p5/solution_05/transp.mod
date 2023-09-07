# Lab 1 BAN402 - Exercise 5
# I'm enjoying this course :)
set ORIG;   # origins
set DEST;   # destinations

param s{ORIG} >= 0;   # amounts available at origins
param d{DEST} >= 0;   # amounts required at destinations
param c{ORIG,DEST} >= 0;   # shipment costs per unit

var x{ORIG,DEST} >= 0;    # units to be shipped

minimize z:   #minimize cost
   sum {i in ORIG, j in DEST} c[i,j] * x[i,j];

subject to 
Supply {i in ORIG}: #respect supply capacities
   sum {j in DEST} x[i,j] <= s[i];

Demand {j in DEST}: #satisfy demand
   sum {i in ORIG} x[i,j] = d[j];

   