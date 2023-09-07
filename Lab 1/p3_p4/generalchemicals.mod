# Declare parameters
param profit1;
param profit2;
param blending_time1;
param blending_time2;
param refining_time1;
param refining_time2;
param full_time_blending;
param part_time_blending;
param full_time_refining;
param part_time_refining;

# Declare decision variables
var x1 >= 0;  # Amount of CS-01 produced in 1000 litres
var x2 >= 0;  # Amount of CS-02 produced in 1000 litres

# Objective function to maximize profit
maximize z: profit1 * x1 * 1000 + profit2 * x2 * 1000;

# Constraints
subject to blending_time: blending_time1 * x1 + blending_time2 * x2 <= full_time_blending + part_time_blending;
subject to refining_time: refining_time1 * x1 + refining_time2 * x2 <= full_time_refining + part_time_refining;
subject to demand_limit: x2 <= 120;
