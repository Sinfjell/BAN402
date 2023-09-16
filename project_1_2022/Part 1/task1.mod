# Declare sets
# Sets if facilties, f1 f2 f3

# sets is pollutants, p2, p2
set F;
set P;

# Declare parameters
param cost {F};
param reduction {F, P};
param requirement{P};

# Declare decision variables
var x{F} >= 0;

# Objective Function: Minimize total cost
minimize Total_Cost: sum {f in F} cost[f] * x[f];

# Constraints for Pollutants
subject to

Pollutant_Constraint {p in P}: 
    sum {f in F}x[f]* reduction[f, p]  >= requirement[p];
