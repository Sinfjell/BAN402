# Sets
set G; # Set of gasolines
set C; # Set of crude oils
set M; # Set of markets

# Parameters
param maxPurchase{C};
param purchaseCost{C};
param prodCost{G};
param timeReq{G};
param minDemand{G, M};
param salePrice{G, M};
param octane{C};
param sulfur{C};
param minOctane{G};
param maxSulfur{G};

# Variables
var x{G, C} >= 0; # Amount of crude oil c used to produce gasoline g
var y{G, M} >= 0; # Amount of gasoline g sold in market m

# Objective Function
maximize Z: sum{g in G, m in M} salePrice[g, m] * y[g, m] - sum{g in G, c in C} (purchaseCost[c] * x[g, c] + prodCost[g] * x[g, c]);

# Constraints
subject to MassConservation{g in G}:
    sum{c in C} x[g, c] = sum{m in M} y[g, m];

subject to MaxPurchase{c in C}:
    sum{g in G} x[g, c] <= maxPurchase[c];

subject to MinDemand{g in G, m in M}:
    y[g, m] >= minDemand[g, m];

subject to TimeConstraint:
    sum{g in G, c in C} x[g, c] * timeReq[g] <= 12 * 40 + 2 * 20;

subject to OctaneConstraint{g in G}:
    sum{c in C} x[g, c] * octane[c] >= minOctane[g] * sum{c in C} x[g, c];

subject to SulfurConstraint{g in G}:
    sum{c in C} x[g, c] * sulfur[c] <= maxSulfur[g] * sum{c in C} x[g, c];