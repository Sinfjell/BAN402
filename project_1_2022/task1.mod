# Declare decision variables
var x1 >= 0;  # Tons of fish processed at Facility 1
var x2 >= 0;  # Tons of fish processed at Facility 2
var x3 >= 0;  # Tons of fish processed at Facility 3

# Objective Function: Minimize total cost
minimize Total_Cost: 30*x1 + 20*x2 + 40*x3;

# Constraints for Pollutants
s.t. Pollutant1: 0.10*x1 + 0.20*x2 + 0.40*x3 >= 25;
s.t. Pollutant2: 0.45*x1 + 0.25*x2 + 0.30*x3 >= 35;
