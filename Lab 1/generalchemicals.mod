# Declare parameters
param profit1;
param profit2;
param blendingTime1;
param blendingTime2;
param refiningTime1;
param refiningTime2;
param totalBlendingTime;
param totalRefiningTime;

# Declare decision variables
var x1 >= 0;  # Amount of CS-01 produced in 1000 litres
var x2 >= 0;  # Amount of CS-02 produced in 1000 litres

# Objective function to maximize profit
maximize Profit: profit1 * x1 + profit2 * x2;

# Constraints
s.t. BlendingTime: blendingTime1 * x1 + blendingTime2 * x2 <= totalBlendingTime;
s.t. RefiningTime: refiningTime1 * x1 + refiningTime2 * x2 <= totalRefiningTime;
s.t. DemandLimit: x2 <= 120000;

# Choose solver (CPLEX in this case)
option solver 'cplex';

# Solve the problem
solve;

# Display results
display Profit;
display x1, x2;
