# Declare parameters
param m;  # Number of facilities
param n;  # Number of customers
param C{i in 1..m, j in 1..n};  # Unit transportation cost from facility i to customer j
param S{i in 1..m};  # Supply at facility i
param d{j in 1..n};  # Demand at customer j

# Declare decision variables
var x{i in 1..m, j in 1..n} >= 0;

# Objective function to minimize total transportation cost
minimize z: sum{i in 1..m, j in 1..n} C[i,j] * x[i,j];

# Supply constraints
subject to supply_constraints{i in 1..m}: sum{j in 1..n} x[i,j] = S[i];

# Demand constraints
subject to demand_constraints{j in 1..n}: sum{i in 1..m} x[i,j] = d[j];
